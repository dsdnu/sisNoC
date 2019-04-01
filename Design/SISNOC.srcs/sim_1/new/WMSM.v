//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 02.2019 
// Design Name: WMSM
// Module Name: workingModeStateMachine
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////

module workingModeStateMachine(
    input clk,
    input rst,
    input valid,
    input [1:0] type,
    output reg [1:0] mode,
    input last,
    output reg gamma_confEn,
    output reg beta_confEn,
    output reg input_confEn
    );
    
localparam CONF_INPUT=2'b00, CONF_GAMMA=2'b01, CONF_BETA=2'b10, RUN=2'b11;  

reg [1:0] nextMode;   


always @(posedge clk)
begin
    mode<=nextMode;
end

always @(*)
begin
    if(rst)
    begin
        input_confEn=0;
        gamma_confEn=0;
        beta_confEn=0;
        nextMode=CONF_GAMMA;
    end
    else
    case(mode)
        CONF_GAMMA: 
        begin
            if((type==2'b10)&valid&!last)
            begin
                input_confEn=0;
                gamma_confEn=1;
                beta_confEn=0;
                nextMode=CONF_GAMMA;  
            end
            else if((type==2'b10)&valid&last)
            begin
                input_confEn=0;
                gamma_confEn=1;
                beta_confEn=0;
                nextMode=CONF_BETA;  
            end
            else 
            begin
                input_confEn=0;
                gamma_confEn=0;
                beta_confEn=0;
                nextMode=CONF_GAMMA;                 
            end               
        end 
        CONF_BETA: 
        begin
            if((type==2'b10)&valid&!last)
            begin
                input_confEn=0;
                gamma_confEn=0;
                beta_confEn=1;
                nextMode=CONF_BETA;  
            end
            else if((type==2'b10)&valid&last)
            begin
                input_confEn=0;
                gamma_confEn=0;
                beta_confEn=1;
                nextMode=CONF_INPUT;  
            end
            else 
            begin
                input_confEn=0;
                gamma_confEn=0;
                beta_confEn=0;
                nextMode=CONF_BETA;                 
            end                              
        end  
        CONF_INPUT: 
        begin
            if((type==2'b00)&valid&!last)
            begin
                input_confEn=1;
                gamma_confEn=0;
                beta_confEn=0;
                nextMode=CONF_INPUT;
            end
            else if((type==2'b00)&valid&last)
            begin
                input_confEn=1;
                gamma_confEn=0;
                beta_confEn=0;
                nextMode=RUN;
            end
            else            
            begin
                input_confEn=0;
                gamma_confEn=0;
                beta_confEn=0;
                nextMode=CONF_INPUT;                
            end
        end
        RUN: 
        begin
            input_confEn=0;
            gamma_confEn=0;
            beta_confEn=0;
            nextMode=RUN;     
        end                   
    endcase
end
   
endmodule
