`timescale 1ns/100ps  
////// ... . .. --.. .   - .... .   -- --- -- . -. - ////// 									  																								  																			
// Author              : TienYao			  																
// Source Code Name	   : LED_TOP				  																				
// Function Description: 														 
// ===========================================================
module LED_TOP (
input CLK_100Mhz,
input RESET_N,
output LED0_R,
output LED0_G,
output LED0_B,
output LED1_R,
output LED1_G,
output LED1_B,
output LED2_R,
output LED2_G,
output LED2_B,
output LED3_R,
output LED3_G,
output LED3_B,
output LED4,
output LED5,
output LED6,
output LED7
);

wire wTick1ms;
wire wTick5ms;
wire wTick1s;
wire AddCnt, EndCnt;
reg [3:0] rvLedTemp_d, rvLedTemp_q;


clk_wiz_0 clk_wiz_0_inst (
  // Clock out ports
  .clk_out1     (clk),
  // Status and control signals
  .reset        (RESET_N),
  .locked       (rstN),
 // Clock in ports
  .clk_in1      (CLK_100Mhz)
 );

 tick_generator tick_generator_inst (
	.clk_25Mhz  (clk),
	.rstN       (rstN),
	
	.oTick1ms   (wTick1ms),
	.oTick5ms   (wTick5ms),
	.oTick1s    (wTick1s)
);

assign AddCnt = wTick1s;
assign EndCnt = AddCnt && (rvLedTemp_q == 16 - 1);
always @(posedge clk or negedge rstN) begin
    if(!rstN)
        rvLedTemp_q <= 4'h0; 
    else
        rvLedTemp_q <= rvLedTemp_d;
end

always @(*) begin
    if(EndCnt)
        rvLedTemp_d = 4'h0;
    else if(AddCnt)
        rvLedTemp_d = rvLedTemp_q + 1'b1;
    else
        rvLedTemp_d = rvLedTemp_q;
end

assign LED0_R = (rvLedTemp_q == 4'd0)  ? 1'b1 : 1'b0;
assign LED0_G = (rvLedTemp_q == 4'd1)  ? 1'b1 : 1'b0;
assign LED0_B = (rvLedTemp_q == 4'd2)  ? 1'b1 : 1'b0;
assign LED1_R = (rvLedTemp_q == 4'd3)  ? 1'b1 : 1'b0;
assign LED1_G = (rvLedTemp_q == 4'd4)  ? 1'b1 : 1'b0;
assign LED1_B = (rvLedTemp_q == 4'd5)  ? 1'b1 : 1'b0;
assign LED2_R = (rvLedTemp_q == 4'd6)  ? 1'b1 : 1'b0;
assign LED2_G = (rvLedTemp_q == 4'd7)  ? 1'b1 : 1'b0;
assign LED2_B = (rvLedTemp_q == 4'd8)  ? 1'b1 : 1'b0;
assign LED3_R = (rvLedTemp_q == 4'd9)  ? 1'b1 : 1'b0;
assign LED3_G = (rvLedTemp_q == 4'd10) ? 1'b1 : 1'b0;
assign LED3_B = (rvLedTemp_q == 4'd11) ? 1'b1 : 1'b0;
assign LED4   = (rvLedTemp_q == 4'd12) ? 1'b1 : 1'b0;
assign LED5   = (rvLedTemp_q == 4'd13) ? 1'b1 : 1'b0;
assign LED6   = (rvLedTemp_q == 4'd14) ? 1'b1 : 1'b0;
assign LED7   = (rvLedTemp_q == 4'd15) ? 1'b1 : 1'b0;

endmodule
