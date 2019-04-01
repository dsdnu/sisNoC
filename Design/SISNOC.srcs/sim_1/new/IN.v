//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 02.2019 
// Design Name: IN
// Module Name: inputNum
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////

module inputNumber(
    input clk,
    input input_confEn,
    input [1:0] index,
    input [1:0] inputNumSegment,
    output  reg [6:0] inputNum
    );
    
always @(posedge clk)
begin
    if(input_confEn)
        if(index==3)  
            inputNum[index*2+:1]<=inputNumSegment[0];
        else
            inputNum[index*2+:2]<=inputNumSegment;
end
endmodule
