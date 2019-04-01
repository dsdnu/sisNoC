//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 03.2019 
// Design Name: BUFFER
// Module Name: buffer
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////


module buffer(
    input clk,
    input rst,
    input currSeqNum,
    input nextSeqNum,
    input [6:0] currCounter,
    input [1:0] input_type,
    input input_valid,
    input input_seqNum,
    input input_status,
    output output_valid,
    output output_status
    );
 
reg [6:0]  counter [1:0]; 

dram_buffer status (
  .a({input_seqNum, counter[input_seqNum]}),        // input wire [7 : 0] a
  .d(input_status),        // input wire [0 : 0] d
  .dpra({currSeqNum, currCounter}),  // input wire [7 : 0] dpra
  .clk(clk),    // input wire clk
  .we((input_type==2'b01)&input_valid),      // input wire we
  .dpo(output_status)    // output wire [0 : 0] dpo
);

always @(posedge clk)
begin
   if(rst)
   begin
        counter[0]<=0;
        counter[1]<=0;
   end
   else
   if(nextSeqNum&(input_type==2'b01)&input_valid)
   begin
        if(currSeqNum!=input_seqNum)
        begin
            counter[currSeqNum]<=0;
            counter[input_seqNum]<=counter[input_seqNum]+1;
        end
   end
   else if(nextSeqNum)
        counter[currSeqNum]<=0;
   else if((input_type==2'b01)&input_valid) 
        counter[input_seqNum]<=counter[input_seqNum]+1;
end 
  
assign output_valid=currCounter!=counter[currSeqNum];

endmodule
