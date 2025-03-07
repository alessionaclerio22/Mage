// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package mage_reg_pkg;

  // Address widths within the block
  parameter int BlockAw = 7;

  ////////////////////////////
  // Typedefs for registers //
  ////////////////////////////

  typedef struct packed {logic [31:0] q;} mage_reg2hw_cfg_pe_00_mreg_t;

  typedef struct packed {logic [31:0] q;} mage_reg2hw_cfg_pe_01_mreg_t;

  typedef struct packed {logic [31:0] q;} mage_reg2hw_cfg_pe_02_mreg_t;

  typedef struct packed {logic [31:0] q;} mage_reg2hw_cfg_pe_03_mreg_t;

  typedef struct packed {logic [31:0] q;} mage_reg2hw_cfg_pe_10_mreg_t;

  typedef struct packed {logic [31:0] q;} mage_reg2hw_cfg_pe_11_mreg_t;

  typedef struct packed {logic [31:0] q;} mage_reg2hw_cfg_pe_12_mreg_t;

  typedef struct packed {logic [31:0] q;} mage_reg2hw_cfg_pe_13_mreg_t;

  typedef struct packed {logic [31:0] q;} mage_reg2hw_cfg_pe_20_mreg_t;

  typedef struct packed {logic [31:0] q;} mage_reg2hw_cfg_pe_21_mreg_t;

  typedef struct packed {logic [31:0] q;} mage_reg2hw_cfg_pe_22_mreg_t;

  typedef struct packed {logic [31:0] q;} mage_reg2hw_cfg_pe_23_mreg_t;

  typedef struct packed {logic [31:0] q;} mage_reg2hw_cfg_pe_30_mreg_t;

  typedef struct packed {logic [31:0] q;} mage_reg2hw_cfg_pe_31_mreg_t;

  typedef struct packed {logic [31:0] q;} mage_reg2hw_cfg_pe_32_mreg_t;

  typedef struct packed {logic [31:0] q;} mage_reg2hw_cfg_pe_33_mreg_t;

  typedef struct packed {
    struct packed {logic [7:0] q;} c0;
    struct packed {logic [7:0] q;} c1;
    struct packed {logic [7:0] q;} c2;
    struct packed {logic [7:0] q;} c3;
  } mage_reg2hw_pea_constants_mreg_t;

  typedef struct packed {logic [3:0] q;} mage_reg2hw_stream_dma_cfg_reg_t;

  typedef struct packed {
    struct packed {logic [7:0] q;} sel_col_0;
    struct packed {logic [7:0] q;} sel_col_1;
    struct packed {logic [7:0] q;} sel_col_2;
    struct packed {logic [7:0] q;} sel_col_3;
  } mage_reg2hw_sel_out_col_pea_mreg_t;

  typedef struct packed {
    struct packed {logic [7:0] q;} pe_0;
    struct packed {logic [7:0] q;} pe_1;
    struct packed {logic [7:0] q;} pe_2;
    struct packed {logic [7:0] q;} pe_3;
  } mage_reg2hw_acc_value_mreg_t;

  // Register -> HW type
  typedef struct packed {
    mage_reg2hw_cfg_pe_00_mreg_t [0:0] cfg_pe_00;  // [803:772]
    mage_reg2hw_cfg_pe_01_mreg_t [0:0] cfg_pe_01;  // [771:740]
    mage_reg2hw_cfg_pe_02_mreg_t [0:0] cfg_pe_02;  // [739:708]
    mage_reg2hw_cfg_pe_03_mreg_t [0:0] cfg_pe_03;  // [707:676]
    mage_reg2hw_cfg_pe_10_mreg_t [0:0] cfg_pe_10;  // [675:644]
    mage_reg2hw_cfg_pe_11_mreg_t [0:0] cfg_pe_11;  // [643:612]
    mage_reg2hw_cfg_pe_12_mreg_t [0:0] cfg_pe_12;  // [611:580]
    mage_reg2hw_cfg_pe_13_mreg_t [0:0] cfg_pe_13;  // [579:548]
    mage_reg2hw_cfg_pe_20_mreg_t [0:0] cfg_pe_20;  // [547:516]
    mage_reg2hw_cfg_pe_21_mreg_t [0:0] cfg_pe_21;  // [515:484]
    mage_reg2hw_cfg_pe_22_mreg_t [0:0] cfg_pe_22;  // [483:452]
    mage_reg2hw_cfg_pe_23_mreg_t [0:0] cfg_pe_23;  // [451:420]
    mage_reg2hw_cfg_pe_30_mreg_t [0:0] cfg_pe_30;  // [419:388]
    mage_reg2hw_cfg_pe_31_mreg_t [0:0] cfg_pe_31;  // [387:356]
    mage_reg2hw_cfg_pe_32_mreg_t [0:0] cfg_pe_32;  // [355:324]
    mage_reg2hw_cfg_pe_33_mreg_t [0:0] cfg_pe_33;  // [323:292]
    mage_reg2hw_pea_constants_mreg_t [3:0] pea_constants;  // [291:164]
    mage_reg2hw_stream_dma_cfg_reg_t stream_dma_cfg;  // [163:160]
    mage_reg2hw_sel_out_col_pea_mreg_t [0:0] sel_out_col_pea;  // [159:128]
    mage_reg2hw_acc_value_mreg_t [3:0] acc_value;  // [127:0]
  } mage_reg2hw_t;

  // Register offsets
  parameter logic [BlockAw-1:0] MAGE_CFG_PE_00_OFFSET = 7'h0;
  parameter logic [BlockAw-1:0] MAGE_CFG_PE_01_OFFSET = 7'h4;
  parameter logic [BlockAw-1:0] MAGE_CFG_PE_02_OFFSET = 7'h8;
  parameter logic [BlockAw-1:0] MAGE_CFG_PE_03_OFFSET = 7'hc;
  parameter logic [BlockAw-1:0] MAGE_CFG_PE_10_OFFSET = 7'h10;
  parameter logic [BlockAw-1:0] MAGE_CFG_PE_11_OFFSET = 7'h14;
  parameter logic [BlockAw-1:0] MAGE_CFG_PE_12_OFFSET = 7'h18;
  parameter logic [BlockAw-1:0] MAGE_CFG_PE_13_OFFSET = 7'h1c;
  parameter logic [BlockAw-1:0] MAGE_CFG_PE_20_OFFSET = 7'h20;
  parameter logic [BlockAw-1:0] MAGE_CFG_PE_21_OFFSET = 7'h24;
  parameter logic [BlockAw-1:0] MAGE_CFG_PE_22_OFFSET = 7'h28;
  parameter logic [BlockAw-1:0] MAGE_CFG_PE_23_OFFSET = 7'h2c;
  parameter logic [BlockAw-1:0] MAGE_CFG_PE_30_OFFSET = 7'h30;
  parameter logic [BlockAw-1:0] MAGE_CFG_PE_31_OFFSET = 7'h34;
  parameter logic [BlockAw-1:0] MAGE_CFG_PE_32_OFFSET = 7'h38;
  parameter logic [BlockAw-1:0] MAGE_CFG_PE_33_OFFSET = 7'h3c;
  parameter logic [BlockAw-1:0] MAGE_PEA_CONSTANTS_0_OFFSET = 7'h40;
  parameter logic [BlockAw-1:0] MAGE_PEA_CONSTANTS_1_OFFSET = 7'h44;
  parameter logic [BlockAw-1:0] MAGE_PEA_CONSTANTS_2_OFFSET = 7'h48;
  parameter logic [BlockAw-1:0] MAGE_PEA_CONSTANTS_3_OFFSET = 7'h4c;
  parameter logic [BlockAw-1:0] MAGE_STREAM_DMA_CFG_OFFSET = 7'h50;
  parameter logic [BlockAw-1:0] MAGE_SEL_OUT_COL_PEA_OFFSET = 7'h54;
  parameter logic [BlockAw-1:0] MAGE_ACC_VALUE_0_OFFSET = 7'h58;
  parameter logic [BlockAw-1:0] MAGE_ACC_VALUE_1_OFFSET = 7'h5c;
  parameter logic [BlockAw-1:0] MAGE_ACC_VALUE_2_OFFSET = 7'h60;
  parameter logic [BlockAw-1:0] MAGE_ACC_VALUE_3_OFFSET = 7'h64;

  // Register index
  typedef enum int {
    MAGE_CFG_PE_00,
    MAGE_CFG_PE_01,
    MAGE_CFG_PE_02,
    MAGE_CFG_PE_03,
    MAGE_CFG_PE_10,
    MAGE_CFG_PE_11,
    MAGE_CFG_PE_12,
    MAGE_CFG_PE_13,
    MAGE_CFG_PE_20,
    MAGE_CFG_PE_21,
    MAGE_CFG_PE_22,
    MAGE_CFG_PE_23,
    MAGE_CFG_PE_30,
    MAGE_CFG_PE_31,
    MAGE_CFG_PE_32,
    MAGE_CFG_PE_33,
    MAGE_PEA_CONSTANTS_0,
    MAGE_PEA_CONSTANTS_1,
    MAGE_PEA_CONSTANTS_2,
    MAGE_PEA_CONSTANTS_3,
    MAGE_STREAM_DMA_CFG,
    MAGE_SEL_OUT_COL_PEA,
    MAGE_ACC_VALUE_0,
    MAGE_ACC_VALUE_1,
    MAGE_ACC_VALUE_2,
    MAGE_ACC_VALUE_3
  } mage_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] MAGE_PERMIT[26] = '{
      4'b1111,  // index[ 0] MAGE_CFG_PE_00
      4'b1111,  // index[ 1] MAGE_CFG_PE_01
      4'b1111,  // index[ 2] MAGE_CFG_PE_02
      4'b1111,  // index[ 3] MAGE_CFG_PE_03
      4'b1111,  // index[ 4] MAGE_CFG_PE_10
      4'b1111,  // index[ 5] MAGE_CFG_PE_11
      4'b1111,  // index[ 6] MAGE_CFG_PE_12
      4'b1111,  // index[ 7] MAGE_CFG_PE_13
      4'b1111,  // index[ 8] MAGE_CFG_PE_20
      4'b1111,  // index[ 9] MAGE_CFG_PE_21
      4'b1111,  // index[10] MAGE_CFG_PE_22
      4'b1111,  // index[11] MAGE_CFG_PE_23
      4'b1111,  // index[12] MAGE_CFG_PE_30
      4'b1111,  // index[13] MAGE_CFG_PE_31
      4'b1111,  // index[14] MAGE_CFG_PE_32
      4'b1111,  // index[15] MAGE_CFG_PE_33
      4'b1111,  // index[16] MAGE_PEA_CONSTANTS_0
      4'b1111,  // index[17] MAGE_PEA_CONSTANTS_1
      4'b1111,  // index[18] MAGE_PEA_CONSTANTS_2
      4'b1111,  // index[19] MAGE_PEA_CONSTANTS_3
      4'b0001,  // index[20] MAGE_STREAM_DMA_CFG
      4'b1111,  // index[21] MAGE_SEL_OUT_COL_PEA
      4'b1111,  // index[22] MAGE_ACC_VALUE_0
      4'b1111,  // index[23] MAGE_ACC_VALUE_1
      4'b1111,  // index[24] MAGE_ACC_VALUE_2
      4'b1111  // index[25] MAGE_ACC_VALUE_3
  };

endpackage

