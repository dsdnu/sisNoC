//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 03.2019 
// Design Name: RT
// Module Name: routingTable
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////

module routingTable (
input clk,
input writeEnable,
input [5:0] writeAddress,
input [6:0] readAddress,
input [9:0] in,
output reg [4:0] out
); 

wire [9:0] dpo;

dram dram (
      .a(writeAddress),        // input wire [5 : 0] a
      .d(in),        // input wire [9 : 0] d
      .dpra(readAddress[6:1]),  // input wire [5 : 0] dpra
      .clk(clk),    // input wire clk
      .we(writeEnable),      // input wire we
      .dpo(dpo)    // output wire [9 : 0] dpo
    );
always @(*)
begin
    case(readAddress[0])
    1'b1: out=dpo[9:5];
    1'b0: out=dpo[4:0];
    endcase
end
   
endmodule

