//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 02.2019
// Design Name: RC
// Module Name: ringCounter
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////


module ringCounter #(parameter WIDTH=5)(
    input clk,
    input rst,
    input ready,
    output reg [WIDTH-1:0] out
    );
    
integer i;

always @(posedge clk)
begin 
    if(rst)
    begin
        for(i=0; i<WIDTH; i=i+1) 
        begin   
            if(i==0)
                out[i]<=1'b1;
            else
                out[i]<=1'b0; 
        end 
    end
    else if(ready)
    begin
        for(i=0; i<WIDTH; i=i+1) 
        begin   
            if(i==0)
                out[i]<=out[WIDTH-1];
            else
                out[i]<=out[i-1]; 
        end 
    end
end
endmodule
