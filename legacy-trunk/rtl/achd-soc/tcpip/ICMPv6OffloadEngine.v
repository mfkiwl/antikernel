`timescale 1ns / 1ps
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
	@brief ICMPv6 offload engine
	
	@module
	@brief			ICMPv6 protocol offload
	@opcodefile		ICMPv6OffloadEngine_opcodes.constants
	
	@rpcint			ICMP_NEW_PREFIX
	@brief			New SLAAC subnet prefix
	@param			prefixlen	d0[7:0]:dec						Prefix length
	@param			prefix		{d1[31:0],d2[31:0]}:ipv6		Subnet prefix
	
	@rpcint			ICMP_NEW_ROUTERMAC
	@brief			New SLAAC router MAC address
	@param			mac			{d0[15:0],d1[31:0]}:mac			MAC address
 */
module ICMPv6OffloadEngine(

	//Clocks
	clk,
	
	//NoC interfaces
	rpc_tx_en, rpc_tx_data, rpc_tx_ack, rpc_rx_en, rpc_rx_data, rpc_rx_ack,
	dma_tx_en, dma_tx_data, dma_tx_ack, dma_rx_en, dma_rx_data, dma_rx_ack
	);
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// I/O / parameter declarations
	
	//Clocks
	input wire clk;
	
	//RPC interface
	parameter NOC_ADDR				= 16'h0000;
	output wire rpc_tx_en;
	output wire[31:0] rpc_tx_data;
	input wire[1:0] rpc_tx_ack;
	input wire rpc_rx_en;
	input wire[31:0] rpc_rx_data;
	output wire[1:0] rpc_rx_ack;
	
	//DMA interface
	output wire dma_tx_en;
	output wire[31:0] dma_tx_data;
	input wire dma_tx_ack;
	input wire dma_rx_en;
	input wire[31:0] dma_rx_data;
	output wire dma_rx_ack;
	
	parameter IPV6_HOST			= 16'h0000;
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// NoC transceivers

	`include "DMARouter_constants.v"
	`include "RPCv2Router_type_constants.v"	//Pull in autogenerated constant table
	`include "RPCv2Router_ack_constants.v"

	reg			rpc_fab_tx_en 		= 0;
	reg[15:0]	rpc_fab_tx_dst_addr	= 0;
	reg[7:0]	rpc_fab_tx_callnum	= 0;
	reg[2:0]	rpc_fab_tx_type		= 0;
	reg[20:0]	rpc_fab_tx_d0		= 0;
	reg[31:0]	rpc_fab_tx_d1		= 0;
	reg[31:0]	rpc_fab_tx_d2		= 0;
	wire		rpc_fab_tx_done;
	
	wire[15:0]	rpc_fab_rx_src_addr;
	wire[7:0]	rpc_fab_rx_callnum;
	wire[2:0]	rpc_fab_rx_type;
	wire[20:0]	rpc_fab_rx_d0;
	wire[31:0]	rpc_fab_rx_d1;
	wire[31:0]	rpc_fab_rx_d2;
	reg			rpc_fab_rx_done		= 0;
	wire		rpc_fab_inbox_full;
	
	RPCv2Transceiver #(
		.LEAF_PORT(1),
		.LEAF_ADDR(NOC_ADDR)
	) txvr(
		.clk(clk),
		
		.rpc_tx_en(rpc_tx_en),
		.rpc_tx_data(rpc_tx_data),
		.rpc_tx_ack(rpc_tx_ack),
		
		.rpc_rx_en(rpc_rx_en),
		.rpc_rx_data(rpc_rx_data),
		.rpc_rx_ack(rpc_rx_ack),
		
		.rpc_fab_tx_en(rpc_fab_tx_en),
		.rpc_fab_tx_src_addr(16'h0000),
		.rpc_fab_tx_dst_addr(rpc_fab_tx_dst_addr),
		.rpc_fab_tx_callnum(rpc_fab_tx_callnum),
		.rpc_fab_tx_type(rpc_fab_tx_type),
		.rpc_fab_tx_d0(rpc_fab_tx_d0),
		.rpc_fab_tx_d1(rpc_fab_tx_d1),
		.rpc_fab_tx_d2(rpc_fab_tx_d2),
		.rpc_fab_tx_done(rpc_fab_tx_done),
		
		.rpc_fab_rx_en(),
		.rpc_fab_rx_src_addr(rpc_fab_rx_src_addr),
		.rpc_fab_rx_dst_addr(),
		.rpc_fab_rx_callnum(rpc_fab_rx_callnum),
		.rpc_fab_rx_type(rpc_fab_rx_type),
		.rpc_fab_rx_d0(rpc_fab_rx_d0),
		.rpc_fab_rx_d1(rpc_fab_rx_d1),
		.rpc_fab_rx_d2(rpc_fab_rx_d2),
		.rpc_fab_rx_done(rpc_fab_rx_done),
		.rpc_fab_inbox_full(rpc_fab_inbox_full)
		);
	
	//DMA transmit signals
	wire		dtx_busy;
	reg[15:0]	dtx_dst_addr	= 0;
	reg[1:0]	dtx_op			= 0;
	reg[9:0]	dtx_len			= 0;
	reg[31:0]	dtx_addr		= 0;
	reg			dtx_en			= 0;
	wire		dtx_rd;
	wire[9:0]	dtx_raddr;
	reg[31:0]	dtx_buf_out		= 0;
	
	//DMA receive signals
	reg			drx_ready		= 0;
	wire		drx_en;
	wire[15:0]	drx_src_addr;
	wire[15:0]	drx_dst_addr;
	wire[1:0]	drx_op;
	wire[31:0]	drx_addr;
	wire[9:0]	drx_len;	
	reg			drx_buf_rd		= 0;
	reg[9:0]	drx_buf_addr	= 0;
	wire[31:0]	drx_buf_data;
	
	//DMA transceiver
	DMATransceiver #(
		.LEAF_PORT(1),
		.LEAF_ADDR(NOC_ADDR)
	) dma_txvr(
		.clk(clk),
		.dma_tx_en(dma_tx_en), .dma_tx_data(dma_tx_data), .dma_tx_ack(dma_tx_ack),
		.dma_rx_en(dma_rx_en), .dma_rx_data(dma_rx_data), .dma_rx_ack(dma_rx_ack),
		
		.tx_done(),
		.tx_busy(dtx_busy), .tx_src_addr(16'h0000), .tx_dst_addr(dtx_dst_addr), .tx_op(dtx_op), .tx_len(dtx_len),
		.tx_addr(dtx_addr), .tx_en(dtx_en), .tx_rd(dtx_rd), .tx_raddr(dtx_raddr), .tx_buf_out(dtx_buf_out),
		
		.rx_ready(drx_ready), .rx_en(drx_en), .rx_src_addr(drx_src_addr), .rx_dst_addr(drx_dst_addr),
		.rx_op(drx_op), .rx_addr(drx_addr), .rx_len(drx_len),
		.rx_buf_rd(drx_buf_rd), .rx_buf_addr(drx_buf_addr[8:0]), .rx_buf_data(drx_buf_data), .rx_buf_rdclk(clk)
		);
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// DMA transmit buffer
	
	reg[31:0] dma_txbuf[511:0];
	
	//Init
	integer i;
	initial begin
		for(i=0; i<512; i=i+1)
			dma_txbuf[i] <= 0;
	end
	
	//Write logic
	reg			dma_txbuf_we		= 0;
	reg[8:0]	dma_txbuf_waddr		= 0;
	reg[31:0]	dma_txbuf_wdata		= 0;
	always @(posedge clk) begin
		if(dma_txbuf_we)
			dma_txbuf[dma_txbuf_waddr] <= dma_txbuf_wdata;
	end
	
	//Read logic
	always @(posedge clk) begin
		if(dtx_rd)
			dtx_buf_out <= dma_txbuf[dtx_raddr];
	end
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Inbound checksum calculation
	
	reg			rx_checksum_load;
	reg			rx_checksum_process;
	reg[31:0]	rx_checksum_din;
	wire[15:0]	rx_checksum_dout;
	reg			rx_checksum_match;
	InternetChecksum32bit rx_checksum_calc(
		.clk(clk),
		.load(rx_checksum_load),
		.process(rx_checksum_process),
		.din(rx_checksum_din),
		.sumout(rx_checksum_dout),
		.csumout()
	);
	always @(posedge clk) begin
		rx_checksum_load	<= 0;
		rx_checksum_process	<= 0;
		rx_checksum_din		<= 0;
		
		//When the packet first gets here, preload the checksum with the next-header value
		if(drx_en) begin
			rx_checksum_load	<= 1;
			rx_checksum_din		<= IP_PROTOCOL_ICMPV6;
		end
		
		//If we just read something, checksum it.
		//Do not include the incoming MAC address pseudo-header in the checksum, but keep the length
		if(drx_buf_rd_ff && (drx_buf_addr_ff >= 2)) begin
			rx_checksum_process	<= 1;
			rx_checksum_din		<= drx_buf_data;
		end
	end
	
	always @(*) begin	
		rx_checksum_match <= (rx_checksum_dout == 16'hffff);
	end
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Outbound checksum calculation
	
	reg			tx_checksum_load		= 0;
	reg			tx_checksum_process		= 0;
	reg[31:0]	tx_checksum_din_fwd		= 0;
	wire[15:0]	tx_checksum_dout;
	InternetChecksum32bit tx_checksum_calc(
		.clk(clk),
		.load(tx_checksum_load),
		.process(tx_checksum_process),
		.din(tx_checksum_din_fwd),
		.sumout(tx_checksum_dout),
		.csumout()
	);
	
	always @(*) begin
		tx_checksum_process				<= 0;
		if(dma_txbuf_we && (dma_txbuf_waddr >= 3) )
			tx_checksum_process			<= 1;
	
		//Use special data for load (the next-header value since we always include that in our checksums)
		if(tx_checksum_load)
			tx_checksum_din_fwd			<= IP_PROTOCOL_ICMPV6;
		else
			tx_checksum_din_fwd			<= dma_txbuf_wdata;
	end
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// Main state logic
	
	`include "ICMPv6OffloadEngine_rx_states_constants.v"
	`include "IPProtocols_constants.v"
	`include "ICMPv6_types_constants.v"
	`include "IPv6OffloadEngine_opcodes_constants.v"
	`include "ICMPv6OffloadEngine_opcodes_constants.v"
	
	reg[3:0]	rx_state			= RX_STATE_IDLE;
	reg			drx_buf_rd_ff		= 0;
	
	reg[47:0]	client_mac_address	= 0;
	
	reg[9:0]	drx_buf_addr_ff		= 0;
	reg[7:0]	icmp_type 			= 0;
	
	//Data storage for packet metadata
	reg[31:0]	packet_source_addr[3:0];
	reg[47:0]	packet_source_mac	= 0;
	
	//NDP option state machine
	`include "ICMPv6OffloadEngine_ndp_rx_states_constants.v"
	`include "ICMPv6_NDP_options_constants.v"
	reg[1:0]	ndp_option_state	= NDP_RX_STATE_IDLE;
	reg[7:0]	ndp_option_count	= 0;
	reg[9:0]	ndp_option_end		= 0;
	reg[7:0]	ndp_option_type		= 0;
	reg[7:0]	ndp_prefix_len		= 0;
	reg			ndp_slaac_enabled	= 0;
	
	//Subnet prefix
	reg[63:0]	subnet_prefix		= 0;
	
	reg			dma_inbox_full		= 0;
	reg			prefix_changed		= 0;
	
	reg[31:0]	packet_len			= 0;
	reg[15:0]	rx_bytelen			= 0;
	
	always @(posedge clk) begin
		
		dtx_en					<= 0;
		
		rpc_fab_tx_en			<= 0;
		dma_txbuf_we			<= 0;
		
		tx_checksum_load		<= 0;
		
		rpc_fab_rx_done			<= 0;
		
		drx_buf_rd				<= 0;
		drx_buf_rd_ff			<= drx_buf_rd;
		if(drx_buf_rd)
			drx_buf_addr_ff		<= drx_buf_addr;
			
		if(drx_en) begin
			dma_inbox_full		<= 1;
			drx_ready			<= 0;
		end
		
		//Store source address of packet
		//If it's a router advertisement, we'll use the source layer-3 address as the default gateway
		if(drx_buf_rd_ff) begin
			case(drx_buf_addr_ff)
				2: packet_len <= drx_buf_data;
				3: packet_source_addr[0] <= drx_buf_data;
				4: packet_source_addr[1] <= drx_buf_data;
				5: packet_source_addr[2] <= drx_buf_data;
				6: packet_source_addr[3] <= drx_buf_data;
				
				default: begin
					
				end
				
			endcase
		end
		
		//Read router advertisement options
		//Needs to be before main state machine so they can reset us
		case(ndp_option_state)
			
			//Do nothing
			NDP_RX_STATE_IDLE: begin
				ndp_option_count	<= 0;
			end	//NDP_RX_STATE_IDLE
			
			//Read NDP header
			NDP_RX_STATE_HEADER: begin
				ndp_option_count	<= 1;
				ndp_option_type		<= drx_buf_data[31:24];
				ndp_option_end		<= drx_buf_addr_ff + {drx_buf_data[23:16], 1'b0};	//length is in 64-bit words
				ndp_option_state	<= NDP_RX_STATE_DATA;
				
				//Need to read beginning of MAC address
				if(drx_buf_data[31:24] == NDP_OPTION_SOURCE_MAC)
					packet_source_mac[47:32]	<= drx_buf_data[15:0];
					
				//Read prefix length
				if(drx_buf_data[31:24] == NDP_OPTION_PREFIX) begin
					ndp_prefix_len				<= drx_buf_data[15:8];
					
					//Only SLAAC this packet if it's marked as such, and is a router advertisement
					if(icmp_type == ICMP_TYPE_ROUTER_ADVERT)
						ndp_slaac_enabled			<= drx_buf_data[6];
					else
						ndp_slaac_enabled			<= 0;
					
					//Get ready to update prefix
					rpc_fab_tx_type			<= RPC_TYPE_INTERRUPT;
					rpc_fab_tx_dst_addr		<= IPV6_HOST;
					rpc_fab_tx_callnum		<= ICMP_NEW_PREFIX;
					rpc_fab_tx_d0			<= drx_buf_data[15:8];	//prefix length
				end
				
			end //NDP_RX_STATE_HEADER
			
			//Read body from this NDP packet
			NDP_RX_STATE_DATA: begin
				ndp_option_count		<= ndp_option_count + 8'h1;
				
				case(ndp_option_type)
				
					//Save the MAC address
					NDP_OPTION_SOURCE_MAC: begin
						packet_source_mac[31:0] <= drx_buf_data;
					end
					
					//Save the SLAAC prefix
					NDP_OPTION_PREFIX: begin
						//1 is valid lifetime, ignore
						//2 is preferred lifetime, ignore
						//3 is reserved
						//Only update our saved subnet if this is being used for SLAAC
						if(ndp_option_count == 4) begin
							rpc_fab_tx_d1			<= drx_buf_data;
							if(ndp_slaac_enabled) begin
								subnet_prefix[63:32]	<= drx_buf_data;
								if(subnet_prefix[63:32] != drx_buf_data)
									prefix_changed		<= 1;
							end
						end
						if(ndp_option_count == 5) begin
							rpc_fab_tx_d2 <= drx_buf_data;
							if(ndp_slaac_enabled) begin
								subnet_prefix[31:0]		<= drx_buf_data;
								if(subnet_prefix[31:0] != drx_buf_data)	
									prefix_changed		<= 1;
							end
						end
					end
					
				endcase
				
				//Go on to next option when appropriate
				if(drx_buf_addr == ndp_option_end)
					ndp_option_state	<= NDP_RX_STATE_HEADER;
					
			end	//NDP_RX_STATE_DATA
			
		endcase
		
		//Main state machine
		case(rx_state)
		
			//Wait for a new packet to come in
			RX_STATE_IDLE: begin
			
				//Process RPC packets
				if(rpc_fab_inbox_full) begin
				
					//Single cycle, whatever it is
					rpc_fab_rx_done	<= 1;
					
					//Handle interrupts from IPv6 stack
					if( (rpc_fab_rx_type == RPC_TYPE_INTERRUPT) && (rpc_fab_rx_src_addr == IPV6_HOST) ) begin
						case(rpc_fab_rx_callnum)
							IPV6_OP_NOTIFY_MAC: begin
								client_mac_address	<= { rpc_fab_rx_d0[15:0], rpc_fab_rx_d1 };
								
								//Wipe the old subnet settings
								subnet_prefix		<= 0;
							end			
						endcase
					end
				
				end
				
				//Process packets from IPv6 stack only
				else if((dma_inbox_full || drx_en) && (drx_src_addr == IPV6_HOST)) begin
					
					dma_inbox_full		<= 0;
					
					//Read the entire packet and do various things as each data word comes
					drx_buf_rd			<= 1;
					drx_buf_addr		<= 0;
					drx_buf_addr_ff		<= 0;
					rx_state			<= RX_STATE_READ;
					
					//Clear checksum
					tx_checksum_load	<= 1;

				end
				
				//Otherwise, ready for a new DMA packet
				else
					drx_ready			<= 1;
				
			end	//RX_STATE_IDLE
			
			//Actually read the packet and prepare to act on it.
			//Don't commit anything until we know the checksum is good.
			RX_STATE_READ: begin
			
				//Read next word
				drx_buf_rd		<= 1;
				drx_buf_addr	<= drx_buf_addr + 10'h1;
				
				//If we just read the last word, stop
				if( drx_buf_addr == drx_len) begin
					rx_state				<= RX_STATE_COMMIT_0;
					ndp_option_state		<= NDP_RX_STATE_IDLE;
				end
				
				case(drx_buf_addr_ff)

					//Write MAC address pseudo-header back to transmit buffer in case a response packet is required
					//Loop back source MAC to dest
					0: begin
						dma_txbuf_we		<= 1;
						dma_txbuf_waddr		<= 0;
						dma_txbuf_wdata		<= drx_buf_data;
					end
					1: begin
						dma_txbuf_we		<= 1;
						dma_txbuf_waddr		<= 1;
						dma_txbuf_wdata		<= drx_buf_data;
					end
					
					//Loop back length pseudo-header
					2: begin
						dma_txbuf_we		<= 1;
						dma_txbuf_waddr		<= 2;
						dma_txbuf_wdata		<= drx_buf_data;
						rx_bytelen			<= drx_buf_data[15:0];
					end

					//Write address pseudo-header back to transmit buffer in case a response packet is required
					//Source address becomes dest address
					3: begin
						dma_txbuf_we		<= 1;
						dma_txbuf_waddr		<= 7;
						dma_txbuf_wdata		<= drx_buf_data;
					end
					
					4: begin
						dma_txbuf_we		<= 1;
						dma_txbuf_waddr		<= 8;
						dma_txbuf_wdata		<= drx_buf_data;
					end
					
					5: begin
						dma_txbuf_we		<= 1;
						dma_txbuf_waddr		<= 9;
						dma_txbuf_wdata		<= drx_buf_data;
					end
					
					6: begin
						dma_txbuf_we		<= 1;
						dma_txbuf_waddr		<= 10;
						dma_txbuf_wdata		<= drx_buf_data;
					end
					
					//Send our source address
					7: begin
						dma_txbuf_we		<= 1;
						dma_txbuf_waddr		<= 3;
						dma_txbuf_wdata		<= subnet_prefix[63:32];
					end
					8: begin
						dma_txbuf_we		<= 1;
						dma_txbuf_waddr		<= 4;
						dma_txbuf_wdata		<= subnet_prefix[31:0];
					end
					9: begin
						dma_txbuf_we		<= 1;
						dma_txbuf_waddr		<= 5;
						dma_txbuf_wdata		<= { client_mac_address[47:24], 8'hff };
					end
					10: begin
						dma_txbuf_we		<= 1;
						dma_txbuf_waddr		<= 6;
						dma_txbuf_wdata		<= {8'hfe, client_mac_address[23:0] };
					end
					
					//ICMP type (ignore code for now)
					11: begin
						icmp_type			<= drx_buf_data[31:24];
						
						case(drx_buf_data[31:24])

							//If it's a neighbor solication, prepare to respond with a neighbor advertisement
							ICMP_TYPE_NEIGHBOR_SOLICIT: begin
								dma_txbuf_we		<= 1;
								dma_txbuf_waddr		<= 11;
								dma_txbuf_wdata		<= { ICMP_TYPE_NEIGHBOR_ADVERT, 8'h0, 16'h0 };	//no checksum yet
								
								dtx_dst_addr		<= IPV6_HOST;
								dtx_op				<= DMA_OP_WRITE_REQUEST;
								dtx_addr			<= 0;
								
							end //ICMP_TYPE_NEIGHBOR_SOLICIT
						
							//If it's an echo request, prepare to respond with an echo reply
							ICMP_TYPE_ECHO_REQUEST: begin
								
								dma_txbuf_we		<= 1;
								dma_txbuf_waddr		<= 11;
								dma_txbuf_wdata		<= { ICMP_TYPE_ECHO_REPLY, 8'h0, 16'h0 };	//no checksum yet
								
								dtx_dst_addr		<= IPV6_HOST;
								dtx_op				<= DMA_OP_WRITE_REQUEST;
								dtx_addr			<= 0;
								
							end	//ICMP_TYPE_ECHO_REQUEST
							
						endcase
						
					end
					
				endcase
					
				//Crunch the packet type
				case(icmp_type)
					
					//Crunch router advertisements 
					ICMP_TYPE_ROUTER_ADVERT: begin
						//Ignore router lifetime, reachable time, retransmit time
						
						//About to read options
						if(drx_buf_addr == 15)
							ndp_option_state	<= NDP_RX_STATE_HEADER;
						
					end //ICMP_TYPE_ROUTER_ADVERT
				
					//Prepare to respond to neighbor solicitations
					ICMP_TYPE_NEIGHBOR_SOLICIT: begin
					
						case(drx_buf_addr_ff)
							
							//12 is reserved, ignore for reads.
							//Write the header word
							12: begin
								dma_txbuf_we	<= 1;
								dma_txbuf_waddr	<= 12;
								dma_txbuf_wdata	<= {1'b0, 1'b1, 1'b1, 29'h0};	//solicited, override
							end
							
							//Target address
							//Should be our MAC address (extended with FF:FE in the middle)
							//in the low half, and our subnet prefix in the high half
							//If it doesn't match us, drop the packet
							//Meanwhile, write our IP to the buffer in case we need to respond
							13: begin
								if(drx_buf_data != subnet_prefix[63:32])
									rx_state	<= RX_STATE_IDLE;
								
								dma_txbuf_we	<= 1;
								dma_txbuf_waddr	<= 13;
								dma_txbuf_wdata	<= subnet_prefix[63:32];
							end
							14: begin
								if(drx_buf_data != subnet_prefix[31:0])
									rx_state	<= RX_STATE_IDLE;
									
								dma_txbuf_we	<= 1;
								dma_txbuf_waddr	<= 14;
								dma_txbuf_wdata	<= subnet_prefix[31:0];
							end
							15: begin
								if(drx_buf_data != {client_mac_address[47:24], 8'hff})
									rx_state	<= RX_STATE_IDLE;
									
								dma_txbuf_we	<= 1;
								dma_txbuf_waddr	<= 15;
								dma_txbuf_wdata	<= {client_mac_address[47:24], 8'hff};
							end
							16: begin
								if(drx_buf_data != {8'hfe, client_mac_address[23:0]})
									rx_state	<= RX_STATE_IDLE;
									
								dma_txbuf_we	<= 1;
								dma_txbuf_waddr	<= 16;
								dma_txbuf_wdata	<= {8'hfe, client_mac_address[23:0]};
							end
							
						endcase
					
					end	//ICMP_TYPE_NEIGHBOR_SOLICIT
					
					//Respond to pings by copying the packet payload unchanged
					ICMP_TYPE_ECHO_REQUEST: begin
						
						if(drx_buf_addr_ff >= 12) begin
							dma_txbuf_we		<= 1;
							dma_txbuf_waddr		<= drx_buf_addr_ff[8:0];
							dma_txbuf_wdata		<= drx_buf_data;
						end
					
					end	//ICMP_TYPE_ECHO_REQUEST
				endcase
								
			end	//RX_STATE_READ
			
			RX_STATE_COMMIT_0: begin
				rx_state	<= RX_STATE_COMMIT_1;
			end	//end RX_STATE_COMMIT_0
			
			//Verify checksum and actually commit the operations
			RX_STATE_COMMIT_1: begin
			
				//Nothing to do by default
				rx_state <= RX_STATE_IDLE;
			
				//Checksum is good, go do whatever
				if(rx_checksum_match) begin
				
					case(icmp_type)
				
						//This is a SLAAC router advert
						//Update our subnet info to use it
						ICMP_TYPE_ROUTER_ADVERT: begin
							if( ndp_slaac_enabled && (ndp_prefix_len == 64) && prefix_changed ) begin
								prefix_changed	<= 0;
								rpc_fab_tx_en	<= 1;
								rx_state		<= RX_STATE_SLAAC_NEWPREFIX;
							end
						end	//ICMP_TYPE_ROUTER_ADVERT
					
						//This is an ICMP neighbor solicitation
						//If we get this far, it's directed at us
						ICMP_TYPE_NEIGHBOR_SOLICIT: begin
						
							//Write ICMP length to a bogus address of the packet, just so it's included in the checksum
							//Two header words plus options = 32 bytes
							dma_txbuf_we		<= 1;
							dma_txbuf_waddr		<= 9'd500;
							dma_txbuf_wdata		<= 32'd32;
							rx_state			<= RX_STATE_NEIGHBOR_SOLICIT;
							
							//DMA transmit length: 2 words of MAC address, 1 word of length,
							//8 words of IP address plus 8 words of data
							dtx_len				<= 19;
						
						end	//ICMP_TYPE_NEIGHBOR_SOLICIT
						
						//This is an ICMP echo request
						//Respond!
						ICMP_TYPE_ECHO_REQUEST: begin
						
							//Write ICMP length to a bogus address of the packet, just so it's included in the checksum
							//ICMP length is DMA length minus pseudo-header, converted from words to bytes
							dma_txbuf_we		<= 1;
							dma_txbuf_waddr		<= 9'd500;
							dma_txbuf_wdata		<= rx_bytelen;
							
							//DMA transmit length: same as the incoming packet
							//For now, omit the MAC address!
							dtx_len				<= drx_len;
							
							//Compute checksum
							rx_state			<= RX_STATE_PING_REPLY;
						
						end	//ICMP_TYPE_ECHO_REQUEST
						
					endcase
				
				end
				
			end	//RX_STATE_COMMIT_1
			
			//Send the new SLAAC prefix to the IPv6 stack
			RX_STATE_SLAAC_NEWPREFIX: begin
				if(rpc_fab_tx_done) begin
					rx_state				<= 	RX_STATE_SLAAC_NEWMAC;
					
					rpc_fab_tx_type			<= RPC_TYPE_INTERRUPT;
					rpc_fab_tx_dst_addr		<= IPV6_HOST;
					rpc_fab_tx_callnum		<= ICMP_NEW_ROUTERMAC;
					rpc_fab_tx_d0			<= packet_source_mac[47:32];
					rpc_fab_tx_d1			<= packet_source_mac[31:0];
					rpc_fab_tx_d2			<= 0;
					rpc_fab_tx_en			<= 1;
					
				end
			end	//RX_STATE_SLAAC_NEWPREFIX
			
			//Send the new gateway MAC address to the IPv6 stack
			RX_STATE_SLAAC_NEWMAC: begin
				if(rpc_fab_tx_done)
					rx_state 		<= RX_STATE_IDLE;
			end	//RX_STATE_SLAAC_NEWMAC
			
			//Send a neighbor solicitation
			RX_STATE_NEIGHBOR_SOLICIT: begin
			
				//Use the address to determine where to write next
				case(dma_txbuf_waddr)
				
					//Just wrote ICMP length, write first half of "sender MAC address" option
					500: begin
						dma_txbuf_we		<= 1;
						dma_txbuf_waddr		<= 17;
						dma_txbuf_wdata		<= { NDP_OPTION_TARGET_MAC, 8'h01, client_mac_address[47:32] };
					end
					
					//Just wrote first half of "sender MAC" option, write second half
					17: begin
						dma_txbuf_we		<= 1;
						dma_txbuf_waddr		<= 18;
						dma_txbuf_wdata		<= client_mac_address[31:0];
					end
					
					//Just wrote remainder of option! Wait one cycle for checksum computation to complete
					18: begin
						dma_txbuf_waddr		<= 19;
					end
					
					//Checksum computation should be done, write updated packet header
					19: begin
						dma_txbuf_we		<= 1;
						dma_txbuf_waddr		<= 11;
						dma_txbuf_wdata		<= { ICMP_TYPE_NEIGHBOR_ADVERT, 8'h0, ~tx_checksum_dout };
					end
					
					//Just wrote last word of packet header, send the packet
					11: begin
						dtx_en				<= 1;
						rx_state			<= RX_STATE_DMA_TXHOLD;
					end
				
				endcase
			
			end	//RX_STATE_NEIGHBOR_SOLICIT
			
			//Send a ping reply
			RX_STATE_PING_REPLY: begin
				
				//Use the address to determine where to write next
				case(dma_txbuf_waddr)
				
					//Just wrote ICMP length. Wait one cycle for checksum computation to finish
					500: begin
						dma_txbuf_waddr		<= 501;
					end
					
					//Checksum computation should be done, write updated packet header
					501: begin
						dma_txbuf_we		<= 1;
						dma_txbuf_waddr		<= 11;
						dma_txbuf_wdata		<= { ICMP_TYPE_ECHO_REPLY, 8'h0, ~tx_checksum_dout };
					end
					
					//Just wrote last word of packet header, send the packet
					11: begin
						dtx_en				<= 1;
						rx_state			<= RX_STATE_DMA_TXHOLD;
					end
				
				endcase
				
			end	//RX_STATE_PING_REPLY
			
			//Wait for DMA transfer
			RX_STATE_DMA_TXHOLD: begin
				if(!dtx_en && !dtx_busy) begin
					rx_state 				<= RX_STATE_IDLE;
				end
			end	//RX_STATE_DMA_TXHOLD
		
		endcase
		
	end
	
endmodule
