//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 02.2019 
// Design Name: RE
// Module Name: routingEngine
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////

module routingEngine #(parameter X=0, Y=0)(
    input rst,
    input clk,
    input [11:0] packet,
    input valid,
    output  reg west_valid,
    output  reg north_valid,
    output  reg east_valid,
    output  reg south_valid,
    output  reg center_valid
    );

wire rf_west_valid, rf_north_valid, rf_east_valid, rf_south_valid, rf_center_valid;
wire rt_west_valid, rt_north_valid, rt_east_valid, rt_south_valid, rt_center_valid;

reg [5:0] writeAddress;
reg [6:0] router;

routingFunction routingFunction(
.destAddress(packet[9:2]),
.rf_west_valid(rf_west_valid),
.rf_north_valid(rf_north_valid),
.rf_east_valid(rf_east_valid),
.rf_south_valid(rf_south_valid),
.rf_center_valid(rf_center_valid)
);
defparam routingFunction.X=X, routingFunction.Y=Y;

routingTable routingTable(
.clk(clk),  
.writeAddress(writeAddress),
.in(packet[9:0]),  
.writeEnable(valid&(packet[11:10]==2'b11)&(router==Y*10+X)), 
.readAddress(packet[9:6]*10+packet[5:2]), 
.out({rt_west_valid, rt_north_valid, rt_east_valid, rt_south_valid, rt_center_valid})
);


always @(posedge clk)
begin
    if(rst)
    begin
        writeAddress<=0;
        router<=0;
    end
    else
    begin
        if(valid&(packet[11:10]==2'b11))
        begin
            if(writeAddress==49)
            begin
                router<=router+1; 
                writeAddress<=0; 
            end
            else
                writeAddress<=writeAddress+1;    
        end
    end
end


always @(*)
begin
    case(packet[11:10])
    2'b00: {west_valid,north_valid,east_valid,south_valid,center_valid}={rf_west_valid, rf_north_valid, rf_east_valid, rf_south_valid, rf_center_valid};
    2'b01: {west_valid,north_valid,east_valid,south_valid,center_valid}= {rt_west_valid, rt_north_valid, rt_east_valid, rt_south_valid, rt_center_valid};
    2'b10: {west_valid,north_valid,east_valid,south_valid,center_valid}={1'b0, 1'b1, (Y==0)?1'b1:1'b0, 1'b0, 1'b1};
    2'b11: {west_valid,north_valid,east_valid,south_valid,center_valid}={1'b0, 1'b1, (Y==0)?1'b1:1'b0, 1'b0, 1'b0};
    endcase     
end

endmodule
