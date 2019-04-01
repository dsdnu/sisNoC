//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 02.2019 
// Design Name: COMPARATOR
// Module Name: comparator
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////

module comparator (
    input [3:0] in0,
    input [3:0] in1,
    output \= ,
    output \> ,
    output \< 
    );
    
    assign \= =in0==in1;
    assign \> =in0>in1;
    assign \< =in0<in1;
    
endmodule
