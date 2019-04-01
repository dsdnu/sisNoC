//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 02.2019 
// Design Name: FIFO
// Module Name: fifo
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////

module fifo #(parameter DEPTH=8, WIDTH=8)( 
input rst, 
input clk, 
input [WIDTH-1:0] input_data,
input writeEn, 
output ready,
output [WIDTH-1:0] output_data,
input readEn, 
output valid
    );
    
reg [WIDTH-1:0] memory [DEPTH-1:0]; 
reg [$clog2(DEPTH)-1:0] writePointer, readPointer;
reg [$clog2(DEPTH):0] counter;
wire full,empty;
 
always @(posedge clk)
begin
        if(writeEn&!full)
            memory[writePointer]<=input_data; 
end

always @(posedge clk)
begin
    if(rst)
    begin
        writePointer<=0;
        readPointer<=0;
    end
    else 
    begin
        if(writeEn&!full)                    
            writePointer<=writePointer+1;
        if(readEn&!empty)                    
            readPointer<=readPointer+1;
    end  
end

always @(posedge clk)
begin
    if(rst)
    begin
        counter<=0;
    end
    else 
    begin
        if((writeEn&!full)&(!readEn|empty))                    
            counter<=counter+1;
        if((readEn&!empty)&(!writeEn|full))                    
            counter<=counter-1;
    end  
end

assign ready=!full;
assign valid=!empty;
assign full=counter==DEPTH;
assign empty=counter==0;
assign output_data=memory[readPointer];
endmodule
