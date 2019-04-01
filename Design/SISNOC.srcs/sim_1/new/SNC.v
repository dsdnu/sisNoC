//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 02.2019 
// Design Name: SNC
// Module Name: sequenceNumberCounter
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////

module sequenceNumberCounter(
    input clk,
    input rst,
    input nextSeqNum,
    output reg currSeqNum
    );


always @(posedge clk)    
begin
    if(rst)
        currSeqNum<=0;
    else if(nextSeqNum)
        currSeqNum<=currSeqNum+1;        
end
    
endmodule
