// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Tue Mar 19 15:20:52 2019
// Host        : LAPTOP-RVFHID97 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/Admin/Google/Research/SISNOC/Design/SISNOC.srcs/sip/registerSlice/registerSlice_stub.v
// Design      : registerSlice
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1157-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axis_register_slice_v1_1_17_axis_register_slice,Vivado 2018.2" *)
module registerSlice(aclk, aresetn, s_axis_tvalid, s_axis_tready, 
  s_axis_tdata, m_axis_tvalid, m_axis_tready, m_axis_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[15:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[15:0]" */;
  input aclk;
  input aresetn;
  input s_axis_tvalid;
  output s_axis_tready;
  input [15:0]s_axis_tdata;
  output m_axis_tvalid;
  input m_axis_tready;
  output [15:0]m_axis_tdata;
endmodule
