`timescale 1ns/100ps  
////// ... . .. --.. .   - .... .   -- --- -- . -. - ////// 									  																								  																			
// Author              : TienYao			  																
// Source Code Name	   : tick_generator				  																				
// Function Description: tick generator for system counter														 
// ===========================================================
module tick_generator (
	input clk_25Mhz,
	input rstN,
	
	output oTick1ms,
	output oTick5ms,
	output oTick1s
);
	
reg [15:0] rvTick1ms_d;
reg [15:0] rvTick1ms_q;
reg [3:0] rvTick5ms_d;
reg [3:0] rvTick5ms_q;
reg [7:0] rvTick1s_d;
reg [7:0] rvTick1s_q;

//1ms tick
always @(posedge clk_25Mhz or negedge rstN) begin
	if(!rstN)
		rvTick1ms_q <= 16'h0;
	else
		rvTick1ms_q <= rvTick1ms_d;
end	

always @(*) begin
	if(rvTick1ms_q < 16'd25000 - 1)
		rvTick1ms_d = rvTick1ms_q + 1'b1;
	else 
		rvTick1ms_d = 16'h0;
end
assign oTick1ms = (rvTick1ms_q == 16'd25000 - 1) ? 1'b1 : 1'b0;

//5ms tick
wire wAddTick5ms = (rvTick1ms_q == 16'd25000 - 1);
wire wEndTick5ms = wAddTick5ms && (rvTick5ms_q == 4'd5 - 1);
always @(posedge clk_25Mhz or negedge rstN) begin
	if(!rstN)
		rvTick5ms_q <= 4'h0;
	else
		rvTick5ms_q <= rvTick5ms_d;
end

always @(*) begin
	if(wEndTick5ms)
		rvTick5ms_d = 4'h0;
	else if(wAddTick5ms)
		rvTick5ms_d = rvTick5ms_q + 1'b1;
	else
		rvTick5ms_d = rvTick5ms_q;
end
assign oTick5ms = ((rvTick1ms_q == 16'd25000 - 1) && (wEndTick5ms)) ? 1'b1 : 1'b0;

//1s tick
wire wAddTick1s = oTick5ms;
wire wEndTick1s = wAddTick1s && (rvTick1s_q == 8'd200 - 1);
always @(posedge clk_25Mhz or negedge rstN) begin
	if(!rstN)
		rvTick1s_q <= 8'h0;
	else
		rvTick1s_q <= rvTick1s_d;
end

always @(*) begin
	if(wEndTick1s)
		rvTick1s_d = 8'h0;
	else if(wAddTick1s)
		rvTick1s_d = rvTick1s_q + 1'b1;
	else 
		rvTick1s_d = rvTick1s_q;
end
assign oTick1s = (wEndTick1s && oTick5ms) ? 1'b1 : 1'b0;
	
endmodule