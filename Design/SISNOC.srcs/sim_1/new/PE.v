//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 02.2019 
// Design Name: PE
// Module Name: processingElement
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////


module processingElement(
    input clk,
    input rst,
    input NI_PE_status,
    input NI_PE_gamma0,
    input NI_PE_beta0,
    input NI_PE_last,
    input NI_PE_valid,
    output NI_PE_ready,
    output PE_NI_status,
    output PE_NI_valid,
    input PE_NI_ready
    );

reg status, gamma0, beta0, last, valid;    

always @(posedge clk)
begin
    if(rst)
        valid<=0;
    else
    begin
        status<=NI_PE_status;
        gamma0<=NI_PE_gamma0;
        beta0<=NI_PE_beta0;
        last<=NI_PE_last;
        valid<=NI_PE_valid;
    end    
end

infectionStatusStateMachine infectionStatusStateMachine(
clk,
rst,
status,
PE_NI_status,
gamma0,
beta0,
valid,
last,
PE_NI_ready
 );
 
assign PE_NI_valid=last&valid;
assign NI_PE_ready=!(valid&last&!PE_NI_ready);

endmodule
