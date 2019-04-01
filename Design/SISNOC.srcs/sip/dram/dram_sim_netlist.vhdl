-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Tue Mar 19 20:46:06 2019
-- Host        : LAPTOP-RVFHID97 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/Admin/Google/Research/SISNOC/Design/SISNOC.srcs/sip/dram/dram_sim_netlist.vhdl
-- Design      : dram
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7vx485tffg1157-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dram_sdpram is
  port (
    dpo : out STD_LOGIC_VECTOR ( 9 downto 0 );
    clk : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 9 downto 0 );
    we : in STD_LOGIC;
    dpra : in STD_LOGIC_VECTOR ( 5 downto 0 );
    a : in STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dram_sdpram : entity is "sdpram";
end dram_sdpram;

architecture STRUCTURE of dram_sdpram is
  signal \^dpo\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal qsdpo_int : STD_LOGIC_VECTOR ( 9 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of qsdpo_int : signal is "true";
  signal NLW_ram_reg_0_63_0_2_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_0_63_3_5_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_0_63_6_8_DOD_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_0_63_9_9_DOB_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_0_63_9_9_DOC_UNCONNECTED : STD_LOGIC;
  signal NLW_ram_reg_0_63_9_9_DOD_UNCONNECTED : STD_LOGIC;
  attribute KEEP : string;
  attribute KEEP of \qsdpo_int_reg[0]\ : label is "yes";
  attribute equivalent_register_removal : string;
  attribute equivalent_register_removal of \qsdpo_int_reg[0]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[1]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[1]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[2]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[2]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[3]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[3]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[4]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[4]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[5]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[5]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[6]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[6]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[7]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[7]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[8]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[8]\ : label is "no";
  attribute KEEP of \qsdpo_int_reg[9]\ : label is "yes";
  attribute equivalent_register_removal of \qsdpo_int_reg[9]\ : label is "no";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_63_0_2 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_63_3_5 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_63_6_8 : label is "";
  attribute METHODOLOGY_DRC_VIOS of ram_reg_0_63_9_9 : label is "";
begin
  dpo(9 downto 0) <= \^dpo\(9 downto 0);
\qsdpo_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(0),
      Q => qsdpo_int(0),
      R => '0'
    );
\qsdpo_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(1),
      Q => qsdpo_int(1),
      R => '0'
    );
\qsdpo_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(2),
      Q => qsdpo_int(2),
      R => '0'
    );
\qsdpo_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(3),
      Q => qsdpo_int(3),
      R => '0'
    );
\qsdpo_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(4),
      Q => qsdpo_int(4),
      R => '0'
    );
\qsdpo_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(5),
      Q => qsdpo_int(5),
      R => '0'
    );
\qsdpo_int_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(6),
      Q => qsdpo_int(6),
      R => '0'
    );
\qsdpo_int_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(7),
      Q => qsdpo_int(7),
      R => '0'
    );
\qsdpo_int_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(8),
      Q => qsdpo_int(8),
      R => '0'
    );
\qsdpo_int_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => \^dpo\(9),
      Q => qsdpo_int(9),
      R => '0'
    );
ram_reg_0_63_0_2: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(0),
      DIB => d(1),
      DIC => d(2),
      DID => '0',
      DOA => \^dpo\(0),
      DOB => \^dpo\(1),
      DOC => \^dpo\(2),
      DOD => NLW_ram_reg_0_63_0_2_DOD_UNCONNECTED,
      WCLK => clk,
      WE => we
    );
ram_reg_0_63_3_5: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(3),
      DIB => d(4),
      DIC => d(5),
      DID => '0',
      DOA => \^dpo\(3),
      DOB => \^dpo\(4),
      DOC => \^dpo\(5),
      DOD => NLW_ram_reg_0_63_3_5_DOD_UNCONNECTED,
      WCLK => clk,
      WE => we
    );
ram_reg_0_63_6_8: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(6),
      DIB => d(7),
      DIC => d(8),
      DID => '0',
      DOA => \^dpo\(6),
      DOB => \^dpo\(7),
      DOC => \^dpo\(8),
      DOD => NLW_ram_reg_0_63_6_8_DOD_UNCONNECTED,
      WCLK => clk,
      WE => we
    );
ram_reg_0_63_9_9: unisim.vcomponents.RAM64M
    generic map(
      INIT_A => X"0000000000000000",
      INIT_B => X"0000000000000000",
      INIT_C => X"0000000000000000",
      INIT_D => X"0000000000000000"
    )
        port map (
      ADDRA(5 downto 0) => dpra(5 downto 0),
      ADDRB(5 downto 0) => dpra(5 downto 0),
      ADDRC(5 downto 0) => dpra(5 downto 0),
      ADDRD(5 downto 0) => a(5 downto 0),
      DIA => d(9),
      DIB => '0',
      DIC => '0',
      DID => '0',
      DOA => \^dpo\(9),
      DOB => NLW_ram_reg_0_63_9_9_DOB_UNCONNECTED,
      DOC => NLW_ram_reg_0_63_9_9_DOC_UNCONNECTED,
      DOD => NLW_ram_reg_0_63_9_9_DOD_UNCONNECTED,
      WCLK => clk,
      WE => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dram_dist_mem_gen_v8_0_12_synth is
  port (
    dpo : out STD_LOGIC_VECTOR ( 9 downto 0 );
    clk : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 9 downto 0 );
    we : in STD_LOGIC;
    dpra : in STD_LOGIC_VECTOR ( 5 downto 0 );
    a : in STD_LOGIC_VECTOR ( 5 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dram_dist_mem_gen_v8_0_12_synth : entity is "dist_mem_gen_v8_0_12_synth";
end dram_dist_mem_gen_v8_0_12_synth;

architecture STRUCTURE of dram_dist_mem_gen_v8_0_12_synth is
begin
\gen_sdp_ram.sdpram_inst\: entity work.dram_sdpram
     port map (
      a(5 downto 0) => a(5 downto 0),
      clk => clk,
      d(9 downto 0) => d(9 downto 0),
      dpo(9 downto 0) => dpo(9 downto 0),
      dpra(5 downto 0) => dpra(5 downto 0),
      we => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dram_dist_mem_gen_v8_0_12 is
  port (
    a : in STD_LOGIC_VECTOR ( 5 downto 0 );
    d : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 5 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    i_ce : in STD_LOGIC;
    qspo_ce : in STD_LOGIC;
    qdpo_ce : in STD_LOGIC;
    qdpo_clk : in STD_LOGIC;
    qspo_rst : in STD_LOGIC;
    qdpo_rst : in STD_LOGIC;
    qspo_srst : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 9 downto 0 );
    dpo : out STD_LOGIC_VECTOR ( 9 downto 0 );
    qspo : out STD_LOGIC_VECTOR ( 9 downto 0 );
    qdpo : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  attribute C_ADDR_WIDTH : integer;
  attribute C_ADDR_WIDTH of dram_dist_mem_gen_v8_0_12 : entity is 6;
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of dram_dist_mem_gen_v8_0_12 : entity is "0";
  attribute C_DEPTH : integer;
  attribute C_DEPTH of dram_dist_mem_gen_v8_0_12 : entity is 64;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of dram_dist_mem_gen_v8_0_12 : entity is "./";
  attribute C_FAMILY : string;
  attribute C_FAMILY of dram_dist_mem_gen_v8_0_12 : entity is "virtex7";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of dram_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of dram_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of dram_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of dram_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of dram_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of dram_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of dram_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of dram_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of dram_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of dram_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of dram_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QSPO_CE : integer;
  attribute C_HAS_QSPO_CE of dram_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of dram_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of dram_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of dram_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of dram_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_MEM_INIT_FILE : string;
  attribute C_MEM_INIT_FILE of dram_dist_mem_gen_v8_0_12 : entity is "no_coe_file_loaded";
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of dram_dist_mem_gen_v8_0_12 : entity is 4;
  attribute C_PARSER_TYPE : integer;
  attribute C_PARSER_TYPE of dram_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of dram_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of dram_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of dram_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_READ_MIF : integer;
  attribute C_READ_MIF of dram_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_REG_A_D_INPUTS : integer;
  attribute C_REG_A_D_INPUTS of dram_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of dram_dist_mem_gen_v8_0_12 : entity is 0;
  attribute C_SYNC_ENABLE : integer;
  attribute C_SYNC_ENABLE of dram_dist_mem_gen_v8_0_12 : entity is 1;
  attribute C_WIDTH : integer;
  attribute C_WIDTH of dram_dist_mem_gen_v8_0_12 : entity is 10;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of dram_dist_mem_gen_v8_0_12 : entity is "dist_mem_gen_v8_0_12";
end dram_dist_mem_gen_v8_0_12;

architecture STRUCTURE of dram_dist_mem_gen_v8_0_12 is
  signal \<const0>\ : STD_LOGIC;
begin
  qdpo(9) <= \<const0>\;
  qdpo(8) <= \<const0>\;
  qdpo(7) <= \<const0>\;
  qdpo(6) <= \<const0>\;
  qdpo(5) <= \<const0>\;
  qdpo(4) <= \<const0>\;
  qdpo(3) <= \<const0>\;
  qdpo(2) <= \<const0>\;
  qdpo(1) <= \<const0>\;
  qdpo(0) <= \<const0>\;
  qspo(9) <= \<const0>\;
  qspo(8) <= \<const0>\;
  qspo(7) <= \<const0>\;
  qspo(6) <= \<const0>\;
  qspo(5) <= \<const0>\;
  qspo(4) <= \<const0>\;
  qspo(3) <= \<const0>\;
  qspo(2) <= \<const0>\;
  qspo(1) <= \<const0>\;
  qspo(0) <= \<const0>\;
  spo(9) <= \<const0>\;
  spo(8) <= \<const0>\;
  spo(7) <= \<const0>\;
  spo(6) <= \<const0>\;
  spo(5) <= \<const0>\;
  spo(4) <= \<const0>\;
  spo(3) <= \<const0>\;
  spo(2) <= \<const0>\;
  spo(1) <= \<const0>\;
  spo(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\synth_options.dist_mem_inst\: entity work.dram_dist_mem_gen_v8_0_12_synth
     port map (
      a(5 downto 0) => a(5 downto 0),
      clk => clk,
      d(9 downto 0) => d(9 downto 0),
      dpo(9 downto 0) => dpo(9 downto 0),
      dpra(5 downto 0) => dpra(5 downto 0),
      we => we
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity dram is
  port (
    a : in STD_LOGIC_VECTOR ( 5 downto 0 );
    d : in STD_LOGIC_VECTOR ( 9 downto 0 );
    dpra : in STD_LOGIC_VECTOR ( 5 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    dpo : out STD_LOGIC_VECTOR ( 9 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of dram : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of dram : entity is "dram,dist_mem_gen_v8_0_12,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of dram : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of dram : entity is "dist_mem_gen_v8_0_12,Vivado 2018.2";
end dram;

architecture STRUCTURE of dram is
  signal NLW_U0_qdpo_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_U0_qspo_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal NLW_U0_spo_UNCONNECTED : STD_LOGIC_VECTOR ( 9 downto 0 );
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "virtex7";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of U0 : label is 1;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of U0 : label is 1;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of U0 : label is 1;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of U0 : label is 1;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of U0 : label is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of U0 : label is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of U0 : label is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of U0 : label is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of U0 : label is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of U0 : label is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of U0 : label is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of U0 : label is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of U0 : label is 0;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of U0 : label is 1;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 4;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of U0 : label is 0;
  attribute c_addr_width : integer;
  attribute c_addr_width of U0 : label is 6;
  attribute c_default_data : string;
  attribute c_default_data of U0 : label is "0";
  attribute c_depth : integer;
  attribute c_depth of U0 : label is 64;
  attribute c_elaboration_dir : string;
  attribute c_elaboration_dir of U0 : label is "./";
  attribute c_has_i_ce : integer;
  attribute c_has_i_ce of U0 : label is 0;
  attribute c_has_qspo_ce : integer;
  attribute c_has_qspo_ce of U0 : label is 0;
  attribute c_mem_init_file : string;
  attribute c_mem_init_file of U0 : label is "no_coe_file_loaded";
  attribute c_parser_type : integer;
  attribute c_parser_type of U0 : label is 1;
  attribute c_pipeline_stages : integer;
  attribute c_pipeline_stages of U0 : label is 0;
  attribute c_qce_joined : integer;
  attribute c_qce_joined of U0 : label is 0;
  attribute c_qualify_we : integer;
  attribute c_qualify_we of U0 : label is 0;
  attribute c_read_mif : integer;
  attribute c_read_mif of U0 : label is 0;
  attribute c_reg_a_d_inputs : integer;
  attribute c_reg_a_d_inputs of U0 : label is 0;
  attribute c_sync_enable : integer;
  attribute c_sync_enable of U0 : label is 1;
  attribute c_width : integer;
  attribute c_width of U0 : label is 10;
begin
U0: entity work.dram_dist_mem_gen_v8_0_12
     port map (
      a(5 downto 0) => a(5 downto 0),
      clk => clk,
      d(9 downto 0) => d(9 downto 0),
      dpo(9 downto 0) => dpo(9 downto 0),
      dpra(5 downto 0) => dpra(5 downto 0),
      i_ce => '1',
      qdpo(9 downto 0) => NLW_U0_qdpo_UNCONNECTED(9 downto 0),
      qdpo_ce => '1',
      qdpo_clk => '0',
      qdpo_rst => '0',
      qdpo_srst => '0',
      qspo(9 downto 0) => NLW_U0_qspo_UNCONNECTED(9 downto 0),
      qspo_ce => '1',
      qspo_rst => '0',
      qspo_srst => '0',
      spo(9 downto 0) => NLW_U0_spo_UNCONNECTED(9 downto 0),
      we => we
    );
end STRUCTURE;
