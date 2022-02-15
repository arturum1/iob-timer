`timescale 1ns/1ps
`include "iob_lib.vh"
`include "TIMERsw_reg_def.vh"

module timer_core
  #(
    parameter DATA_W = 32
    )
   (
    `INPUT(TIMER_ENABLE, `TIMER_ENABLE_W),
    `INPUT(TIMER_SAMPLE, `TIMER_SAMPLE_W),
    `OUTPUT(TIMER_VALUE, `TIMER_DATA_LOW_W+`TIMER_DATA_HIGH_W),
    `INPUT(clk, 1),
    `INPUT(rst, 1)
    );


   `VAR(time_counter, 2*DATA_W)
   `COUNTER_ARE(clk, rst, TIMER_ENABLE, time_counter)

   //time counter register
   `VAR(counter_reg, 2*DATA_W)

   `REG_E(clk, TIMER_SAMPLE, counter_reg, time_counter)

   `VAR2WIRE(counter_reg, TIMER_VALUE)

endmodule
