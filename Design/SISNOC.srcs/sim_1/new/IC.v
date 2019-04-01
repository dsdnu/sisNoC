//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 02.2019 
// Design Name: IC
// Module Name: inputCounter
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////

module inputCounter(
    input clk,
    input rst,
    input valid,
    input [1:0] type,
    input NI_PE_valid,
    input NI_PE_ready,
    input [1:0] mode,
    output reg last,
    input [6:0] inputNum,
    output reg [6:0] currCounter  
    );

localparam CONF_INPUT=2'b00, CONF_GAMMA=2'b01, CONF_BETA=2'b10, RUN=2'b11;  

always @(posedge clk)
begin
    if(rst)
    begin
        currCounter<=0;
    end
    else 
    begin
        case(mode)
        CONF_GAMMA:
        begin
            if((type==2'b10)&valid&!last)
                currCounter<=currCounter+1;
            else if((type==2'b10)&valid&last)  
                currCounter<=0;  
        end
        CONF_BETA:
        begin
            if((type==2'b10)&valid&!last)
                currCounter<=currCounter+1;
            else if((type==2'b10)&valid&last)  
                currCounter<=0;  
        end
        CONF_INPUT:
        begin
            if((type==2'b00)&valid&!last)
                currCounter<=currCounter+1;
            else if((type==2'b00)&valid&last)  
                currCounter<=0;  
        end
        RUN:
        begin
            if(NI_PE_valid&NI_PE_ready&!last)
                currCounter<=currCounter+1;
            else if(NI_PE_valid&NI_PE_ready&last)  
                currCounter<=0;  
        end 
        endcase       
    end     
end

always @(*)
begin
    case(mode)
    CONF_GAMMA: last=(currCounter==9);
    CONF_BETA: last=(currCounter==9);
    CONF_INPUT: last=(currCounter==3);  
    RUN: last=(currCounter==inputNum);  
    endcase
end
 
endmodule
