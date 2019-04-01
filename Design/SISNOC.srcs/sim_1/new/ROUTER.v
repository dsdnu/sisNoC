//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 03.2019 
// Design Name: ROUTER
// Module Name: router
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////

module router #(parameter X=0, Y=0) (
input clk,
input rst,
input [11:0] input_west_packet,
input input_west_valid,
output input_west_ready,
input [11:0] input_north_packet,
input input_north_valid,
output input_north_ready,
input [11:0] input_east_packet,
input input_east_valid,
output input_east_ready,
input [11:0] input_south_packet,
input input_south_valid,
output input_south_ready,
input [11:0] input_center_packet,
input input_center_valid,
output input_center_ready,

output [11:0] output_west_packet,
output output_west_valid,
input output_west_ready,
output [11:0] output_north_packet,
output output_north_valid,
input output_north_ready,
output [11:0] output_east_packet,
output output_east_valid,
input output_east_ready,
output [11:0] output_south_packet,
output output_south_valid,
input output_south_ready,
output [11:0] output_center_packet,
output output_center_valid,
input output_center_ready
    );

wire fifo_west_valid, fifo_north_valid, fifo_east_valid, fifo_south_valid, fifo_center_valid;
wire fifo_west_grant, fifo_north_grant, fifo_east_grant, fifo_south_grant, fifo_center_grant; 
wire [11:0] fifo_west_packet, fifo_north_packet, fifo_east_packet, fifo_south_packet, fifo_center_packet;
wire fifo_west_ready, fifo_north_ready, fifo_east_ready, fifo_south_ready, fifo_center_ready;
wire fifo_west_full, fifo_north_full, fifo_east_full, fifo_south_full, fifo_center_full;
wire fifo_west_empty, fifo_north_empty, fifo_east_empty, fifo_south_empty, fifo_center_empty;
wire [11:0] fifo_packet, packet;
wire fifo_valid, fifo_ready, valid, ready;
wire west_valid, north_valid, east_valid, south_valid, center_valid;

assign input_west_ready=!fifo_west_full;
assign input_north_ready=!fifo_north_full;
assign input_east_ready=!fifo_east_full;
assign input_south_ready=!fifo_south_full;
assign input_center_ready=!fifo_center_full;

assign fifo_west_valid=!fifo_west_empty;
assign fifo_north_valid=!fifo_north_empty;
assign fifo_east_valid=!fifo_east_empty;
assign fifo_south_valid=!fifo_south_empty;
assign fifo_center_valid=!fifo_center_empty;


fifo west_fifo(
  .clk(clk),      // input wire clk
  .srst(rst),    // input wire srst
  .din(input_west_packet),      // input wire [11 : 0] din
  .wr_en(input_west_valid),  // input wire wr_en
  .rd_en(fifo_west_ready),  // input wire rd_en
  .dout(fifo_west_packet),    // output wire [11 : 0] dout
  .full(fifo_west_full),    // output wire full
  .empty(fifo_west_empty)  // output wire empty
);

fifo north_fifo(
  .clk(clk),      // input wire clk
  .srst(rst),    // input wire srst
  .din(input_north_packet),      // input wire [11 : 0] din
  .wr_en(input_north_valid),  // input wire wr_en
  .rd_en(fifo_north_ready),  // input wire rd_en
  .dout(fifo_north_packet),    // output wire [11 : 0] dout
  .full(fifo_north_full),    // output wire full
  .empty(fifo_north_empty)  // output wire empty
);

fifo east_fifo(
  .clk(clk),      // input wire clk
  .srst(rst),    // input wire srst
  .din(input_east_packet),      // input wire [11 : 0] din
  .wr_en(input_east_valid),  // input wire wr_en
  .rd_en(fifo_east_ready),  // input wire rd_en
  .dout(fifo_east_packet),    // output wire [11 : 0] dout
  .full(fifo_east_full),    // output wire full
  .empty(fifo_east_empty)  // output wire empty
);

fifo south_fifo(
  .clk(clk),      // input wire clk
  .srst(rst),    // input wire srst
  .din(input_south_packet),      // input wire [11 : 0] din
  .wr_en(input_south_valid),  // input wire wr_en
  .rd_en(fifo_south_ready),  // input wire rd_en
  .dout(fifo_south_packet),    // output wire [11 : 0] dout
  .full(fifo_south_full),    // output wire full
  .empty(fifo_south_empty)  // output wire empty
);

fifo center_fifo(
  .clk(clk),      // input wire clk
  .srst(rst),    // input wire srst
  .din(input_center_packet),      // input wire [11 : 0] din
  .wr_en(input_center_valid),  // input wire wr_en
  .rd_en(fifo_center_ready),  // input wire rd_en
  .dout(fifo_center_packet),    // output wire [11 : 0] dout
  .full(fifo_center_full),    // output wire full
  .empty(fifo_center_empty)  // output wire empty
);

arbiter arbiter (
clk,
rst,
ready,
fifo_west_valid,
fifo_north_valid,
fifo_east_valid,
fifo_south_valid,
fifo_center_valid,
fifo_west_grant,
fifo_north_grant,
fifo_east_grant,
fifo_south_grant,
fifo_center_grant
);

mux_5 mux_5(
.select({fifo_center_grant,fifo_south_grant,fifo_east_grant, fifo_north_grant,fifo_west_grant}),
.in0(fifo_west_packet),
.in1(fifo_north_packet),
.in2(fifo_east_packet),
.in3(fifo_south_packet),
.in4(fifo_center_packet),
.out(fifo_packet)
);
defparam mux_5.WIDTH=12;

assign fifo_valid = fifo_west_grant|fifo_north_grant|fifo_east_grant|fifo_south_grant|fifo_center_grant;

registerSlice registerSlice (
  .aclk(clk),                    // input wire aclk
  .aresetn(!rst),              // input wire aresetn
  .s_axis_tvalid(fifo_valid),  // input wire s_axis_tvalid
  .s_axis_tready(fifo_ready),  // output wire s_axis_tready
  .s_axis_tdata(fifo_packet),    // input wire [15 : 0] s_axis_tdata
  .m_axis_tvalid(valid),  // output wire m_axis_tvalid
  .m_axis_tready(ready),  // input wire m_axis_tready
  .m_axis_tdata(packet)    // output wire [15 : 0] m_axis_tdata
);

routingEngine routingEngine(
.clk(clk),
.rst(rst),
.packet(packet),
.valid(valid),
.west_valid(west_valid),
.north_valid(north_valid),
.east_valid(east_valid),
.south_valid(south_valid),
.center_valid(center_valid)
);
defparam routingEngine.X=X, routingEngine.Y=Y;

assign ready=(~(west_valid&valid)|output_west_ready)&(~(north_valid&valid)|output_north_ready)&(~(east_valid&valid)|output_east_ready)&(~(south_valid&valid)|output_south_ready)&(~(center_valid&valid)|output_center_ready);
assign fifo_west_ready=fifo_west_grant&ready;
assign fifo_north_ready=fifo_north_grant&ready;
assign fifo_east_ready=fifo_east_grant&ready;
assign fifo_south_ready=fifo_south_grant&ready;
assign fifo_center_ready=fifo_center_grant&ready;

assign output_west_valid=west_valid&valid&ready;
assign output_north_valid=north_valid&valid&ready;
assign output_east_valid=east_valid&valid&ready;
assign output_south_valid=south_valid&valid&ready;
assign output_center_valid=center_valid&valid&ready;
assign {output_west_packet,output_north_packet,output_east_packet,output_south_packet,output_center_packet}={5{packet}};
  
endmodule
