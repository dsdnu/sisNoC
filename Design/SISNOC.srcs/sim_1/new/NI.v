//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 02.2019 
// Design Name: NI
// Module Name: networkInterface
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////


module networkInterface #(parameter ADDRESS=0)(
    input clk,
    input rst,
    input [11:0] NOC_NI_packet,
    input NOC_NI_valid,
    output NOC_NI_ready,
    output NI_PE_status,
    output NI_PE_gamma0,
    output NI_PE_beta0,
    output NI_PE_last,
    output NI_PE_valid,
    input NI_PE_ready,
    input PE_NI_status,
    input PE_NI_valid,
    output PE_NI_ready,
    output [11:0] NI_NOC_packet,
    output NI_NOC_valid,
    input NI_NOC_ready
    );

localparam CONF_INPUT=2'b00, CONF_GAMMA=2'b01, CONF_BETA=2'b10, RUN=2'b11;      

reg [11:0] packet;
reg valid;

always @(posedge clk)
begin
    if(rst)
        valid<=0;
    else
    begin          
        packet<=NOC_NI_packet;
        valid<=NOC_NI_valid;
    end
end

assign NOC_NI_ready=1'b1; 

wire [6:0] currCounter, inputNum;
wire currSeqNum, nextSeqNum, buffer_output_valid, buffer_output_status, last, gamma_confEn, beta_confEn, input_confEn;
wire [1:0] mode;

buffer buffer(
clk,
rst,
currSeqNum,
nextSeqNum,
currCounter,
packet[11:10],
valid,
packet[1],
packet[0],
buffer_output_valid,
buffer_output_status
);

workingModeStateMachine workingModeStateMachine(
clk,
rst,
valid,
packet[11:10],
mode,
NI_PE_last,
gamma_confEn,
beta_confEn,
input_confEn
);

inputCounter inputCounter(
clk,
rst,
valid,
packet[11:10],
NI_PE_valid,
NI_PE_ready,
mode,
NI_PE_last,
inputNum,
currCounter  
);

rate gamma(
clk,
mode,
packet[9:0],
currCounter[3:0],
NI_PE_gamma0,
gamma_confEn
);

rate beta(
clk,
mode,
packet[9:0],
currCounter[3:0],
NI_PE_beta0,
beta_confEn
);

inputNumber inputNumber(
clk,
input_confEn,
currCounter[1:0],
packet[1:0],
inputNum
);

sequenceNumberCounter input_sequenceNumberCounter(
clk,
rst,
nextSeqNum,
currSeqNum
);

assign nextSeqNum=(mode==RUN)&NI_PE_valid&NI_PE_ready&NI_PE_last; 
assign NI_PE_valid=(mode==RUN)?buffer_output_valid:input_confEn&NI_PE_last;
assign NI_PE_status=(mode==RUN)?buffer_output_status:packet[1];


sequenceNumberCounter output_sequenceNumberCounter(
clk,
rst,
NI_NOC_valid&NI_NOC_ready,
NI_NOC_packet[1]
);

assign PE_NI_ready=NI_NOC_ready; 
assign NI_NOC_valid=PE_NI_valid; 
assign NI_NOC_packet[0]=PE_NI_status;
assign NI_NOC_packet[11:10]=2'b01;
assign NI_NOC_packet[9:2]=ADDRESS;


endmodule
