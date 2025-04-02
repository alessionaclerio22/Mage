// Copyright 2025 Politecnico di Torino.
// Solderpad Hardware License, Version 2.1, see LICENSE.md for details.
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
//
// File: fu.sv
// Author: Alessio Naclerio
// Date: 26/02/2025
// Description: functional unit

module fu
  import pea_pkg::*;
(
    input  logic                   clk_i,
    input  logic                   rst_n_i,
    input  logic      [N_BITS-1:0] a_i,
    input  logic      [N_BITS-1:0] b_i,
    input  logic                   ops_valid_i,
    input  fu_instr_t              instr_i,
    input  logic      [       7:0] reg_acc_value_i,
    output logic                   acc_loopback_o,
    output logic                   valid_o,
    output logic                   ready_o,
    output logic      [N_BITS-1:0] res_o
);

  // Internal signed versions of the inputs
  logic signed [N_BITS-1:0] a_signed;
  logic signed [N_BITS-1:0] b_signed;

  assign a_signed = $signed(a_i);
  assign b_signed = $signed(b_i);

  ////////////////////////////////////////////////////////////////
  //                    Ready-Valid Handling                    //
  ////////////////////////////////////////////////////////////////
  // division ready-valid
  logic       out_div_valid;
  logic       div_ready;
  logic       div_busy;
  logic       div_input_valid;
  logic       div_used_once;
  // acuumulation ready-valid
  logic [7:0] acc_cnt;
  logic       acc_ready;
  logic       acc_valid;
  // ready-valid
  logic       valid;
  logic       ready;

  always_ff @(posedge clk_i, negedge rst_n_i) begin
    if (!rst_n_i) begin
      acc_cnt <= 8'd0;
      acc_loopback_o <= 1'b0;
    end else begin
      if (instr_i == ACC || instr_i == MAX) begin
        if (acc_cnt == reg_acc_value_i) begin
          acc_cnt <= 8'd0;
          acc_loopback_o <= 1'b0;
        end else if (ops_valid_i) begin
          acc_cnt <= acc_cnt + 8'd1;
          acc_loopback_o <= 1'b1;
        end
      end else begin
        acc_cnt <= 8'd0;
        acc_loopback_o <= 1'b0;
      end
    end
  end

  assign acc_ready = 1'b1;
  assign acc_valid = (acc_cnt == reg_acc_value_i && acc_cnt != '0);
  assign div_input_valid = (ops_valid_i) & ((instr_i == DIV) || (instr_i == DIVU));

  always_ff @(posedge clk_i, negedge rst_n_i) begin
    if (!rst_n_i) begin
      div_busy <= 1'b0;
    end else begin
      if (out_div_valid) begin
        div_busy <= 1'b0;
      end else begin
        if (div_input_valid) begin
          div_busy <= 1'b1;
        end
      end
    end
  end

  always_ff @(posedge clk_i, negedge rst_n_i) begin
    if (!rst_n_i) begin
      div_used_once <= 1'b0;
    end else begin
      if (div_busy) begin
        div_used_once <= 1'b1;
      end
    end
  end

  always_comb begin
    if (div_busy) begin
      div_ready = 1'b0;
      if (out_div_valid) begin
        div_ready = 1'b1;
      end
    end else begin
      div_ready = 1'b1;
      if (div_input_valid) begin
        div_ready = 1'b0;
      end
    end
  end

  always_comb begin
    valid = ops_valid_i;
    ready = 1'b1;
    case (instr_i)
      DIV: begin
        valid = out_div_valid && div_used_once;
        ready = div_ready;
      end
      DIVU: begin
        valid = out_div_valid && div_used_once;
        ready = div_ready;
      end
      ACC: begin
        valid = acc_valid;
        ready = acc_ready;
      end
      MAX: begin
        valid = acc_valid;
        ready = 1'b1;
      end
    endcase
  end

  assign valid_o = valid;
  assign ready_o = ready;

  logic [N_BITS-1:0] quotient_div;
  logic [N_BITS-1:0] remainder_div;

  div_wrapper div_wrapper_i (
      .clk_i(clk_i),
      .rst_n_i(rst_n_i),
      .a_i(a_i),
      .b_i(b_i),
      .in_valid_i(div_input_valid),
      .q_o(quotient_div),
      .r_o(remainder_div),
      //.ready_o(out_div_ready),
      .valid_o(out_div_valid)
      //.instr_i(instr_i),
      //.OpBShift_DI(shift_left_result),
      //.operand_a_rev_i(operand_a_rev),
      //.operand_a_neg_rev_i(operand_a_neg_rev)
  );

  logic shift_valid;
  logic [N_BITS-1:0] shift_res;
  logic [31:0] shift_left_result;
  logic [31:0] operand_a_rev;
  logic [31:0] operand_a_neg_rev;

  p_shifter p_shifter_i (
      .a_i(a_i),
      .b_i(b_i),
      .instr_i(instr_i),
      .in_valid_i(ops_valid_i),
      .res_o(shift_res),
      .shift_left_result_o(shift_left_result),
      .operand_a_rev_o(operand_a_rev),
      .operand_a_neg_rev_o(operand_a_neg_rev),
      .valid_o(shift_valid)
  );


  always_comb begin
    case (instr_i)
      NOP: res_o = 0;
      ADD: res_o = a_signed + b_signed;
      ACC: res_o = a_signed + b_signed;
      MUL: res_o = a_signed * b_signed;
      SUB: res_o = a_signed - b_signed;
      LSH: res_o = a_signed << b_signed;
      ARSH: res_o = a_signed >>> b_signed;
      LRSH: res_o = a_signed >> b_signed;
      MAX: res_o = (a_signed > b_signed) ? a_i : b_i;
      MIN: res_o = (a_signed < b_signed) ? a_i : b_i;
      DIV: res_o = quotient_div;
      DIVU: res_o = quotient_div;
      ABS: res_o = (a_i[31]) ? -a_signed : a_signed;
      SGNMUL: res_o = (a_i[31]) ? -b_signed : b_signed;
      default: res_o = 0;
    endcase
  end

endmodule
