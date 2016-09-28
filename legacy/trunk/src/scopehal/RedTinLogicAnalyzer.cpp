/***********************************************************************************************************************
*                                                                                                                      *
* ANTIKERNEL v0.1                                                                                                      *
*                                                                                                                      *
* Copyright (c) 2012-2016 Andrew D. Zonenberg                                                                          *
* All rights reserved.                                                                                                 *
*                                                                                                                      *
* Redistribution and use in source and binary forms, with or without modification, are permitted provided that the     *
* following conditions are met:                                                                                        *
*                                                                                                                      *
*    * Redistributions of source code must retain the above copyright notice, this list of conditions, and the         *
*      following disclaimer.                                                                                           *
*                                                                                                                      *
*    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the       *
*      following disclaimer in the documentation and/or other materials provided with the distribution.                *
*                                                                                                                      *
*    * Neither the name of the author nor the names of any contributors may be used to endorse or promote products     *
*      derived from this software without specific prior written permission.                                           *
*                                                                                                                      *
* THIS SOFTWARE IS PROVIDED BY THE AUTHORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   *
* TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL *
* THE AUTHORS BE HELD LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES        *
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR       *
* BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT *
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE       *
* POSSIBILITY OF SUCH DAMAGE.                                                                                          *
*                                                                                                                      *
***********************************************************************************************************************/

/**
	@file
	@author Andrew D. Zonenberg
	@brief Implementation of RedTinLogicAnalyzer
 */

#include "scopehal.h"
#include "RedTinLogicAnalyzer.h"
#include "ProtocolDecoder.h"
#include "StateDecoder.h"

#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <arpa/inet.h>
#include <netdb.h>

#include <memory.h>

#include <NOCSysinfo_constants.h>
#include <RPCv2Router_type_constants.h>
#include <RPCv2Router_ack_constants.h>

using namespace std;

int bit_test_pair(int state_0, int state_1, int current_1, int old_1, int current_0, int old_0);
int bit_test(int state, int current, int old);
int MakeTruthTable(int state_0, int state_1);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Construction / destruction

/**
	@brief Connects to nocswitch and then establishes a connection to the LA core
 */
RedTinLogicAnalyzer::RedTinLogicAnalyzer(const std::string& host, unsigned short port, const std::string& nochost)
	: m_nameserver(NULL)
{
	//leave triggers empty
	
	//Connect to nocswitch
	m_iface.Connect(host, port);
	
	//and the LA
	Connect(nochost);
}

/**
	@brief Connects to nocswitch but does not establish a connection to the LA core.
	
	Useful if doing LA device enumeration. Use Connect() to connect to a specific LA on the device. The result of 
	calling any other member functions before Connect() is undefined.
 */
RedTinLogicAnalyzer::RedTinLogicAnalyzer(const std::string& host, unsigned short port)
	: m_nameserver(NULL)
{
	//leave triggers empty
	
	//Connect to nocswitch only
	m_iface.Connect(host, port);
}

/**
	@brief Connects to the LA core
 */
void RedTinLogicAnalyzer::Connect(const std::string& nochost)
{
	//Connect to the LA
	m_nameserver = new NameServer(&m_iface);
	m_scopeaddr = m_nameserver->ForwardLookup(nochost);
	printf("Logic analyzer is at %04x\n", m_scopeaddr);
	m_nochost = nochost;
		
	//Get channel list
	LoadChannels();
	
	//Clear out trigger
	ResetTriggerConditions();
}

RedTinLogicAnalyzer::~RedTinLogicAnalyzer()
{
	delete m_nameserver;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Information queries

string RedTinLogicAnalyzer::GetName()
{
	return m_nochost;
}

string RedTinLogicAnalyzer::GetVendor()
{
	return "RED TIN LA core";
}

string RedTinLogicAnalyzer::GetSerial()
{
	return "NoSerialNumber";
}

void RedTinLogicAnalyzer::LoadChannels()
{
	//Get the table
	DMAMessage msg;
	msg.from = 0x0000;
	msg.to = m_scopeaddr;
	msg.opcode = DMA_OP_READ_REQUEST;
	msg.len = 512;
	msg.address = 0x10000000;
	m_iface.SendDMAMessage(msg);
	
	DMAMessage rxm;
	if(!m_iface.RecvDMAMessageBlockingWithTimeout(rxm, 5))
	{
		throw JtagExceptionWrapper(
			"Message timeout",
			"",
			JtagException::EXCEPTION_TYPE_FIRMWARE);
	}
	
	//Color table
	int color_num = 0;
	string color_table[]=
	{
		"#ffa0a0",
		"#a0ffff",
		"#ffd0a0",
		"#a0d0ff",
		"#ffffa0",
		"#a0a0ff",
		"#ffa0d0",
		"#d0ffa0",
		"#d0a0ff",
		"#a0ffa0",
		"#ffa0ff",
		"#a0ffd0",
	};
	
	/*
		Serialized data format
			Time scale (32 bits, big endian)
			Depth (32 bits, big endian)
			Per channel
				Signal type
					0 = regular signal
						Signal width (8 bits)
						Signal name length (8 bits)
						Signal name data
						Constant table filename length (8 bits)
						Constant table filename data
					1 = protocol decoder
						Signal name length (8 bits)
						Signal name data
						Decoder name length (8 bits)
						Decoder name data
		A frame with zero for signal width indicates the end of the buffer.
	*/
	const unsigned char* data = (const unsigned char*)&rxm.data[0];
	int pos = 0;
	for(; pos<4; pos++)
		m_timescale = (m_timescale << 8) | data[pos];
	for(; pos<8; pos++)
		m_width = (m_width << 8) | data[pos];
	for(; pos<12; pos++)
		m_depth = (m_depth << 8) | data[pos];
	printf("    System clock period is %" PRIu32 " ps\n", m_timescale);
	printf("    LA has %" PRIu32 " channels\n", m_width);
	printf("    Capture depth is %" PRIu32 " samples\n", m_depth);
	while(pos < 2048)
	{
		//Get the channel type
		int type = data[pos++];
		
		//Allocate a color for it
		string color = color_table[color_num];
		color_num = (color_num + 1) % (sizeof(color_table) / sizeof(color_table[0]));
		
		//Normal channel
		//TODO: Don't have constant filenames here, use the decoder syntax instead
		if(type == 0)
		{		
			//Unpack the serialized data
			int width = data[pos++];
			if(width == 0)
				break;
			string sname = ReadString(data, pos);
			string fname = ReadString(data, pos);
			
			//Add the signals
			OscilloscopeChannel* chan = NULL;
			if(width == 1)
			{
				m_channels.push_back(chan = new OscilloscopeChannel(
					sname, OscilloscopeChannel::CHANNEL_TYPE_DIGITAL, color));
			}
			else
			{
				m_channels.push_back(chan = new OscilloscopeChannel(
					sname, OscilloscopeChannel::CHANNEL_TYPE_DIGITAL, color, false, width));
			}
				
			//If decoding, create the constant decoder
			if(fname != "")
			{
				//Create the decoder (using the same color as the original signal)
				ProtocolDecoder* decoder = new StateDecoder(sname, color, *m_nameserver, fname);
				decoder->SetInput(0, chan);
				m_channels.push_back(decoder);
				
				//Hide the original channel
				chan->m_visible = false;
			}
		}
		
		//Protocol decoder
		else if(type == 1)
		{
			//Signal name and decoder type
			string sname = ReadString(data, pos);
			string tname = ReadString(data, pos);

			//Create the protocol decoder
			ProtocolDecoder* decoder = ProtocolDecoder::CreateDecoder(
				tname,
				sname,
				color,
				*m_nameserver);
			
			//Number of inputs
			int ninputs = data[pos++];
						
			//Read the strings
			for(int j=0; j<ninputs; j++)
			{
				string input = ReadString(data, pos);
				decoder->SetInput(j, GetChannel(input));
			}
			
			//Add the decoder
			m_channels.push_back(decoder);
		}
		
		//Nope, don't know what
		else
		{
			throw JtagExceptionWrapper(
				"Signal name ROM has bad signal type",
				"",
				JtagException::EXCEPTION_TYPE_FIRMWARE);
		}
	}
	
	//Initialize trigger
	m_triggers.clear();
	for(uint32_t i=0; i<m_width; i++)
		m_triggers.push_back(RedTinLogicAnalyzer::TRIGGER_TYPE_DONTCARE);
}

string RedTinLogicAnalyzer::ReadString(const unsigned char* data, int& pos)
{
	int namelen = data[pos++];
	char str[257] = {0};  //namelen was 8 bits so can never be >256
	memcpy(str, data+pos, namelen);
	pos += namelen;
	
	return string(str);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Triggering

Oscilloscope::TriggerMode RedTinLogicAnalyzer::PollTrigger()
{
	//Wait for trigger notification
	RPCMessage rxm;
	//printf("[%.3f] Trigger poll\n", GetTime());
	if(m_iface.RecvRPCMessage(rxm))
	{
		if(rxm.from != m_scopeaddr)
		{
			printf("Got message from unexpected source, ignoring\n");
			return TRIGGER_MODE_RUN;
		}
		if((rxm.type == RPC_TYPE_INTERRUPT) && (rxm.callnum == 0) )
		{
			printf("Triggered\n");
			return TRIGGER_MODE_TRIGGERED;
		}
		else
		{
			printf("Unknown opcode, ignoring\n");
			return TRIGGER_MODE_RUN;
		}
	}
	
	return TRIGGER_MODE_RUN;
}

void RedTinLogicAnalyzer::AcquireData(sigc::slot1<int, float> progress_callback)
{
	printf("Acquiring data...\n");
	
	bool* rx_buf = new bool[m_depth * m_width];
	int64_t* timestamp = new int64_t[m_depth];
	
	//Number of columns to read
	const uint32_t read_cols = m_width / 32;
	
	//Number of words in a single column
	//Columns are always 32 bits wide
	const uint32_t colsize = 4 * m_depth;

	//Read the data
	//Blocks 0...read_cols-1 are data, read_cols is timestamp
	for(uint32_t col=0; col<=read_cols; col++)
	{
		progress_callback(static_cast<float>(col) / (read_cols+1));
		
		//Read in blocks of 512 words x 32 samples
		for(uint32_t start=0; start<m_depth; start += 512)
		{
			//Request read
			DMAMessage rmsg;
			rmsg.from = 0x0000;
			rmsg.to = m_scopeaddr;
			rmsg.opcode = DMA_OP_READ_REQUEST;
			rmsg.len = 512;
			rmsg.address = 0x00000000 + colsize*col + start*4;	//start is in words, not bytes, so need to multiply
			m_iface.SendDMAMessage(rmsg);
			
			//Get data back
			DMAMessage rxm;
			if(!m_iface.RecvDMAMessageBlockingWithTimeout(rxm, 5))
			{
				delete[] rx_buf;
				delete[] timestamp;
				
				throw JtagExceptionWrapper(
					"Message timeout",
					"",
					JtagException::EXCEPTION_TYPE_FIRMWARE);
			}
			
			//Sanity check origin
			if( (rxm.from != m_scopeaddr) || (rxm.address != rmsg.address) || (rxm.len != 512) )
			{
				delete[] rx_buf;
				delete[] timestamp;
				
				throw JtagExceptionWrapper(
					"Invalid message received",
					"",
					JtagException::EXCEPTION_TYPE_FIRMWARE);
			}

			//We don't have sample -1 so arbitrarily declare the start of sample 0 to be T=0
			if(col == read_cols)
				timestamp[0] = 0;
			
			//Flip byte/bit ordering as necessary
			if(col == read_cols)
				FlipEndian32Array((unsigned char*)&rxm.data[0], 2048);
			else
				FlipBitArray((unsigned char*)&rxm.data[0], 2048);
			
			//Crunch it
			for(int i=0; i<512; i++)
			{				
				//Data
				if(col < read_cols)
				{
					for(int j=0; j<32; j++)
						rx_buf[m_width*(start+i) + col*32 + (31 - j)] = (rxm.data[i] >> j) & 1;
				}
			
				//Timestamp
				else
					timestamp[start+i] = rxm.data[i];
			}
		}
	}
	
	//Pre-process the buffer
	//If two samples in a row are identical (incomplete compression, etc) combine them
	//Do not merge the first two samples. This ensures that we always have a line to draw.
	unsigned int write_ptr = 1;
	for(unsigned int read_ptr=1; read_ptr<m_depth; read_ptr++)
	{
		//Invariant: read_ptr >= write_ptr
		
		//Check if they're equal
		bool equal = true;
		if(read_ptr > 0)
		{
			for(uint32_t j=0; j<m_width; j++)
				equal &= (rx_buf[read_ptr*m_width + j] == rx_buf[(read_ptr-1)*m_width + j]);
		}
		
		//Copy the data
		for(uint32_t j=0; j<m_width; j++)
			rx_buf[write_ptr*m_width + j] = rx_buf[read_ptr*m_width + j];
		
		//If equal, merge them
		if(equal)
		{
			timestamp[write_ptr] += timestamp[read_ptr];
			//do not increment write pointer since we merged
		}
		
		//Otherwise, copy
		else
		{
			timestamp[write_ptr] = timestamp[read_ptr];
			write_ptr ++;
		}
		
	}
	
	int sample_count = write_ptr - 1;
	printf("Final sample count: %d\n", sample_count);
	
	//Get channel info
	int nstart = m_width-1;
	for(size_t i=0; i<m_channels.size(); i++)
	{
		OscilloscopeChannel* chan = m_channels[i];
		
		//If the channel is procedural, skip it (no effect on the actual data)
		if(m_channels[i]->IsProcedural())
			continue;
		
		int width = chan->GetWidth();
		int hi = nstart;
		int lo = nstart - width + 1;
		nstart -= width;
		//printf("    Channel %s is %d bits wide, from %d to %d\n", chan->m_displayname.c_str(), width, hi, lo);
		
		//Set channel info
		if(width == 1)
		{
			DigitalCapture* capture = new DigitalCapture;
			capture->m_timescale = m_timescale;
			int64_t last_timestamp = 0;											
			for(int j=0; j<sample_count; j++)
			{
				last_timestamp += timestamp[j];
				
				//Duration - until start of next sample
				int64_t duration = 1;
				if(j < (sample_count - 1))
					duration = timestamp[j+1];
				
				capture->m_samples.push_back(DigitalSample(last_timestamp, duration, rx_buf[m_width*j + hi]));
			}
			chan->SetData(capture);
		}
		else
		{
			DigitalBusCapture* capture = new DigitalBusCapture;
			capture->m_timescale = m_timescale;
			int64_t last_timestamp = 0;
			for(int j=0; j<sample_count; j++)
			{
				last_timestamp += timestamp[j];
				
				//Duration - until start of next sample
				int64_t duration = 1;
				if(j < (sample_count - 1))
					duration = timestamp[j+1];
							
				//Add a new sample				
				std::vector<bool> row;
				for(int k=hi; k>=lo; k--)
					row.push_back(rx_buf[m_width*j + k]);
				capture->m_samples.push_back(DigitalBusSample(last_timestamp, duration, row));
			}
			chan->SetData(capture);
		}
	}
	
	//Refresh procedural channels
	for(size_t i=0; i<m_channels.size(); i++)
	{
		if(m_channels[i]->IsProcedural())
		{
			ProtocolDecoder* decoder = dynamic_cast<ProtocolDecoder*>(m_channels[i]);
			if(decoder == NULL)
			{
				delete[] rx_buf;
				delete[] timestamp;
				
				throw JtagExceptionWrapper(
					"Something claimed to be a procedural channel but isn't a protocol decoder",
					"",
					JtagException::EXCEPTION_TYPE_GIGO);
			}
			decoder->Refresh();
		}
	}
	
	delete[] timestamp;
	delete[] rx_buf;
}

void RedTinLogicAnalyzer::StartSingleTrigger()
{
	//Build the full bitmask set
	//This creates the truth tables in LOGICAL order, not bitstream order.
	vector<int> truth_tables;
	for(uint32_t i=0; i<m_width; i+=2)
		truth_tables.push_back(MakeTruthTable(m_triggers[i], m_triggers[i+1]));
		
	/*
	//Debug
	printf("Truth tables\n");
	for(uint32_t i=0; i<truth_tables.size(); i++)
		printf("    %08x\n", truth_tables[i]);
	*/
	
	//We send the bitstream to the board as a DMA packet (WIDTH/2 32-bit words).
	//Set up the initial message parameters
	DMAMessage trigmsg;
	trigmsg.from = 0x0000;
	trigmsg.to = m_scopeaddr;
	trigmsg.opcode = DMA_OP_WRITE_REQUEST;
	trigmsg.len = 0;
	trigmsg.address = 0x20000000;

	//Generate the configuration bitstream.
	//Each bitplane configures one LUT, each word corresponds to one entry in all 32 LUTs.
	//32 words configure a full set of 32 LUTs, additional LUTs are configured with another set.
	//Note that since we shift into the LSB shift registers, we need to load the MOST significant block first.
	uint32_t nblocks = m_width / 64;
	for(int32_t block=nblocks-1; block>=0; block--)
	{
		//Generate the words one at a time
		//The first bit shifted into the LUT is selected by A[4:0] = 5'b11111.
		//The last bit is selected by A[4:0] = 5'b00000.			
		for(int row=31; row>=0; row--)
		{			
			//Extract one bit from each bitplane and shove it into this word.
			//Trigger LUT uses inputs 64*nrow + ncol*2 +: 1
			//Dividing by two, we get LUT number 32*nrow + ncol.
			uint32_t current_word = 0;
			for(uint32_t col=0; col<32; col++)
			{
				uint32_t entry = (truth_tables[block*32 + col] >> row) & 1;
				current_word |= (entry << col);
			}
			
			//and save it
			trigmsg.data[trigmsg.len ++] = current_word;
		}
	}
	
	//Flip endianness
	FlipEndian32Array((unsigned char*)&trigmsg.data[0], trigmsg.len * 4);
	
	/*
	//Debug print
	printf("Trigger message\n");
	for(int i=0; i<trigmsg.len; i++)
		printf("    %08x\n", trigmsg.data[i]);
	*/

	//Done, send it
	m_iface.SendDMAMessage(trigmsg);
}

void RedTinLogicAnalyzer::Start()
{
	printf("continuous capture not implemented\n");
}

void RedTinLogicAnalyzer::Stop()
{
	
}

void RedTinLogicAnalyzer::ResetTriggerConditions()
{
	for(size_t i=0; i<m_triggers.size(); i++)
		m_triggers[i] = TRIGGER_TYPE_DONTCARE;
}

void RedTinLogicAnalyzer::SetTriggerForChannel(OscilloscopeChannel* channel, std::vector<TriggerType> triggerbits)
{
	int nstart = m_width - 1;
	for(size_t i=0; i<m_channels.size(); i++)
	{
		OscilloscopeChannel* chan = m_channels[i]; 
		
		//If the channel is procedural, skip it (no effect on the actual data)
		if(chan->IsProcedural())
			continue;
		
		int width = chan->GetWidth();
		int hi = nstart;
		//int lo = nstart - width + 1;
		nstart -= width;
		
		//Check if we've hit the target channel, if not keep moving
		if(channel != chan)
			continue;
		
		//Hit - sanity-check signal itself
		if(triggerbits.size() != (size_t)width)
		{
			throw JtagExceptionWrapper(
				"Trigger array size does not match signal width",
				"",
				JtagException::EXCEPTION_TYPE_GIGO);
		}
		
		//printf("Signal %s = bits %d to %d\n", chan->m_displayname.c_str(), hi, lo);
		
		//Copy the array
		for(size_t j=0; j<triggerbits.size(); j++)
		{
			int k = hi - j;
			m_triggers[k] = triggerbits[j];
			//printf("    trigger bit %d = %d\n", k, triggerbits[j]);
		}
	}
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Helpers for trigger truth table generation

int bit_test_pair(int state_0, int state_1, int current_1, int old_1, int current_0, int old_0)
{
	return bit_test(state_0, current_0, old_0) && bit_test(state_1, current_1, old_1);
}

int bit_test(int state, int current, int old)
{
	switch(state)
	{
		case RedTinLogicAnalyzer::TRIGGER_TYPE_LOW:
			return (!current);
		case RedTinLogicAnalyzer::TRIGGER_TYPE_HIGH:
			return (current);
		case RedTinLogicAnalyzer::TRIGGER_TYPE_RISING:
			return (current && !old);
		case RedTinLogicAnalyzer::TRIGGER_TYPE_FALLING:
			return (!current && old);
		case RedTinLogicAnalyzer::TRIGGER_TYPE_CHANGE:
			return (current != old);
		case RedTinLogicAnalyzer::TRIGGER_TYPE_DONTCARE:
			return 1;
	}
	return 0;
}

int MakeTruthTable(int state_0, int state_1)
{	
	int table = 0;
	for(int current_0 = 0; current_0 <= 1; current_0 ++)
	{
		for(int current_1 = 0; current_1 <= 1; current_1 ++)
		{
			for(int old_0 = 0; old_0 <= 1; old_0 ++)
			{
				for(int old_1 = 0; old_1 <= 1; old_1 ++)
				{
					int bitnum = (current_1 << 3) | (current_0 << 2) | (old_1 << 1) | (old_0);
					int bitval = bit_test_pair(state_0, state_1, current_1, old_1, current_0, old_0);
					table |= (bitval << bitnum);
				}
			}					
		}
	}
	return table;
}