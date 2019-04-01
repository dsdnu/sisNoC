//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
//
// Create Date: 02.2019 
// Design Name: MUX_5
// Module Name: mux_5
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////

module mux_5 #(parameter WIDTH=8)(
    input [4:0] select,
    input [WIDTH-1:0] in0,
    input [WIDTH-1:0] in1,
    input [WIDTH-1:0] in2,
    input [WIDTH-1:0] in3,
    input [WIDTH-1:0] in4,
    output reg [WIDTH-1:0] out
    );

always @(*)
begin
    case(select)
    5'b00001: out=in0;
    5'b00010: out=in1;
    5'b00100: out=in2;
    5'b01000: out=in3;
    5'b10000: out=in4;
    default: out=0;
    endcase
end    
endmodule
