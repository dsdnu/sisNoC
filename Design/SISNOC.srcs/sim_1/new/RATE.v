//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 02.2019 
// Design Name: RATE
// Module Name: rate
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////

module rate(
    input clk,
    input [1:0] mode,
    input [9:0] rateSegment,
    input [3:0] index,
    output rate0,
    input confEn
    );
  
localparam CONF_INPUT=2'b00, CONF_GAMMA=2'b01, CONF_BETA=2'b10, RUN=2'b11;   
reg [99:0] rate;
integer i;

always @(posedge clk)
begin
    case(mode)
    RUN:
    begin
        rate[0]<=rate[99];
        for(i=0;i<99;i=i+1) 
            rate[i+1]<=rate[i];      
    end  
    default:
    begin 
        if(confEn) 
            rate[index*10+:10]<= rateSegment; 
    end  
    endcase
end

assign rate0=rate[0];
endmodule
