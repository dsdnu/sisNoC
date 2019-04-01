//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 02.2019 
// Design Name: RF
// Module Name: routingFunction
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////


module routingFunction #(parameter X=0, Y=0)(
    input [7:0] destAddress,
    output reg rf_west_valid,
    output reg rf_north_valid,
    output reg rf_east_valid,
    output reg rf_south_valid,
    output reg rf_center_valid
    );
    
    wire [2:0] x_comparator_output, y_comparator_output;
    
    comparator x_comparator(
    .in0(destAddress[3:0]),
    .in1(X),
    .\= (x_comparator_output[2]),
    .\> (x_comparator_output[1]),
    .\< (x_comparator_output[0])
    );
    
    
    comparator y_comparator(
    .in0(destAddress[7:4]),
    .in1(Y),
    .\= (y_comparator_output[2]),
    .\> (y_comparator_output[1]),
    .\< (y_comparator_output[0])
    );
    
    
    always @(*)
    begin
        casex({x_comparator_output, y_comparator_output})
        6'b100100: {rf_west_valid, rf_north_valid, rf_east_valid,rf_south_valid, rf_center_valid}= 5'b00001;
        6'b010xxx: {rf_west_valid, rf_north_valid, rf_east_valid,rf_south_valid, rf_center_valid}= 5'b00100;
        6'b001xxx: {rf_west_valid, rf_north_valid, rf_east_valid,rf_south_valid, rf_center_valid}= 5'b10000;
        6'b100010: {rf_west_valid, rf_north_valid, rf_east_valid,rf_south_valid, rf_center_valid}= 5'b01000;
        6'b100001: {rf_west_valid, rf_north_valid, rf_east_valid,rf_south_valid, rf_center_valid}= 5'b00010;
        default: {rf_west_valid, rf_north_valid, rf_east_valid,rf_south_valid, rf_center_valid}=5'b00001;
        endcase
    end
    
    
endmodule
