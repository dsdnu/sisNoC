//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 02.2019 
// Design Name: ISSM
// Module Name: infectionStatusStateMachine
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////


module infectionStatusStateMachine(
    input clk,
    input rst,
    input status,
    output reg infectionStatus,
    input gamma0,
    input beta0,
    input valid,
    input last,
    input ready
    );
    
localparam X=2'b00, S=2'b01, SI=2'b10, I=2'b11;   

reg [1:0] state, nextState;

always @(posedge clk)
begin
    state<=nextState;
end

always @(*)
begin
    if(rst)
    begin
        nextState=X;
        infectionStatus=0;
    end
    else    
        case(state)
        X:
        begin
           if(valid&(status==0))
           begin
                nextState=S; 
                infectionStatus=0;
           end
           else if(valid&(status==1))
           begin
                nextState=I;
                infectionStatus=1;
           end
           else
           begin
                nextState=X;
                infectionStatus=0;
           end
        end   
        S:
        begin
            if(valid&(status==1)&(beta0==1)&!last)
            begin
                nextState=SI;
                infectionStatus=1;
            end
            else if(valid&ready&(status==1)&(beta0==1)&last)
            begin
                nextState=I;
                infectionStatus=1;
            end
            else
            begin
                nextState=S;
                infectionStatus=0;
            end
        end
        SI:
        begin
            if(valid&ready&last)
            begin
                nextState=I;
                infectionStatus=1;
            end
            else
            begin
                nextState=SI;
                infectionStatus=1;
            end
        end
        I:
        begin
            if(valid&ready&(gamma0==1)&last)
            begin
                nextState=S;
                infectionStatus=0;
            end
            else
            begin
                nextState=I;
                infectionStatus=1;
            end
        end
        endcase
end
    
endmodule
