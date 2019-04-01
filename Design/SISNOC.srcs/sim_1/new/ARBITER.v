//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 02.2019
// Design Name: ARBITER
// Module Name: arbiter
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////

module arbiter(
    input clk,
    input rst,
    input ready,
    input fifo_west_valid,
    input fifo_north_valid,
    input fifo_east_valid,
    input fifo_south_valid,
    input fifo_center_valid,
    output fifo_west_grant,
    output fifo_north_grant,
    output fifo_east_grant,
    output fifo_south_grant,
    output fifo_center_grant
    );

wire west_priority, north_priority, east_priority, south_priority, center_priority;
wire west_priority_west_grant, west_priority_north_grant, west_priority_east_grant, west_priority_south_grant, west_priority_center_grant;
wire north_priority_north_grant, north_priority_east_grant, north_priority_south_grant, north_priority_center_grant,north_priority_west_grant;
wire east_priority_east_grant, east_priority_south_grant, east_priority_center_grant,east_priority_west_grant, east_priority_north_grant;
wire south_priority_south_grant, south_priority_center_grant,south_priority_west_grant, south_priority_north_grant, south_priority_east_grant;
wire center_priority_center_grant,center_priority_west_grant, center_priority_north_grant, center_priority_east_grant, center_priority_south_grant;

ringCounter ringCounter(
.clk(clk), 
.rst(rst),
.ready(ready),
.out({center_priority, south_priority, east_priority, north_priority, west_priority})
);
defparam ringCounter.WIDTH=5;   

priorityLogic west_priorityLogic(
    .in({fifo_west_valid, fifo_north_valid, fifo_east_valid, fifo_south_valid, fifo_center_valid}),
    .out({west_priority_west_grant, west_priority_north_grant, west_priority_east_grant, west_priority_south_grant, west_priority_center_grant})
);  

priorityLogic north_priorityLogic(
    .in({fifo_north_valid, fifo_east_valid, fifo_south_valid, fifo_center_valid, fifo_west_valid}),
    .out({north_priority_north_grant, north_priority_east_grant, north_priority_south_grant, north_priority_center_grant,north_priority_west_grant})
);

priorityLogic east_priorityLogic(
    .in({fifo_east_valid, fifo_south_valid, fifo_center_valid, fifo_west_valid, fifo_north_valid}),
    .out({east_priority_east_grant, east_priority_south_grant, east_priority_center_grant,east_priority_west_grant, east_priority_north_grant})
);

priorityLogic south_priorityLogic(
    .in({fifo_south_valid, fifo_center_valid, fifo_west_valid, fifo_north_valid, fifo_east_valid}),
    .out({south_priority_south_grant, south_priority_center_grant,south_priority_west_grant, south_priority_north_grant, south_priority_east_grant})
);

priorityLogic center_priorityLogic(
    .in({fifo_center_valid, fifo_west_valid, fifo_north_valid, fifo_east_valid, fifo_south_valid}),
    .out({center_priority_center_grant,center_priority_west_grant, center_priority_north_grant, center_priority_east_grant, center_priority_south_grant})
);

mux_5 mux_5(
.select({center_priority, south_priority, east_priority, north_priority, west_priority }),
.in0({west_priority_west_grant, west_priority_north_grant, west_priority_east_grant, west_priority_south_grant, west_priority_center_grant}), 
.in1({north_priority_west_grant, north_priority_north_grant, north_priority_east_grant, north_priority_south_grant, north_priority_center_grant}),
.in2({east_priority_west_grant, east_priority_north_grant, east_priority_east_grant, east_priority_south_grant, east_priority_center_grant}),
.in3({south_priority_west_grant, south_priority_north_grant, south_priority_east_grant, south_priority_south_grant, south_priority_center_grant}),
.in4({center_priority_west_grant, center_priority_north_grant, center_priority_east_grant, center_priority_south_grant, center_priority_center_grant}),
.out({fifo_west_grant, fifo_north_grant, fifo_east_grant, fifo_south_grant, fifo_center_grant})
);
defparam mux_5.WIDTH=5;


endmodule
