`line 2 "top.tlv" 0
`line 42 "top.tlv" 1

//_\SV
   // Include Tiny Tapeout Lab.
   // Included URL: "https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlv_lib/tiny_tapeout_lib.tlv"// Included URL: "https://raw.githubusercontent.com/os-fpga/Virtual-FPGA-Lab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlv_lib/fpga_includes.tlv"
`line 205 "top.tlv" 1

// +++++++INSERT CODE++++++++++++++INSERT CODE++++++++++++++INSERT CODE++++++++++++++INSERT CODE++++++++++++++INSERT CODE++++++++++++++INSERT CODE+++++++
// +++++++INSERT CODE++++++++++++++INSERT CODE++++++++++++++INSERT CODE++++++++++++++INSERT CODE++++++++++++++INSERT CODE++++++++++++++INSERT CODE+++++++

//_\SV

// ================================================
// A simple Makerchip Verilog test bench driving random stimulus.
// Modify the module contents to your needs.
// ================================================

module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
   // Tiny tapeout I/O signals.
   logic [7:0] ui_in, uo_out;
   
   logic [31:0] r;  // a random value
   always @(posedge clk) r <= 0;
   //assign ui_in = r[7:0];
  // 
   logic ena = 1'b0;
   logic rst_n = ! reset;


   // Or, to provide specific inputs at specific times (as for lab C-TB) ...
   // BE SURE TO COMMENT THE ASSIGNMENT OF INPUTS ABOVE.
   // BE SURE TO DRIVE THESE ON THE B-PHASE OF THE CLOCK (ODD STEPS).
   // Driving on the rising clock edge creates a race with the clock that has unpredictable simulation behavior.
   initial begin
      #1  // Drive inputs on the B-phase.
         ui_in = 8'h0;
      #10 // Step 5 cycles, past reset.
         ui_in = 8'd1;
      #2
         ui_in = 8'd0;
      // ...etc.
      #42
         ui_in = 8'd4;
      #2
         ui_in = 8'd0;
      #2
         ui_in = 8'd8;
      #2
         ui_in = 8'd0;
      //start game
      #2
         ui_in = 8'd2;
      #2
         ui_in = 8'd0;
      #36
      	ui_in = 8'd1;
      #2
         ui_in = 8'd0;
      #60
         ui_in = 8'd4;
      #2
         ui_in = 8'd0;
      #9
         ui_in = 8'd8;
      #2
         ui_in = 8'd0;
      //start game
      #2
         ui_in = 8'd2;
      #2
         ui_in = 8'd0;
      #63
      	ui_in = 8'd1;
      #2
         ui_in = 8'd0;
      #30
         ui_in = 8'd8;
      #2
         ui_in = 8'd0;
      #9
         ui_in = 8'd4;
      #2
         ui_in = 8'd0;
      //start game
      #2
         ui_in = 8'd2;
      #2
         ui_in = 8'd0;
      #36
      	ui_in = 8'd1;
      #2
         ui_in = 8'd0;
      #30
         ui_in = 8'd8;
      #2
         ui_in = 8'd0;
      #9
         ui_in = 8'd4;
      #2
         ui_in = 8'd0;
      //start game
      #2
         ui_in = 8'd2;
      #2
         ui_in = 8'd0;
      #36
      	ui_in = 8'd1;
      #2
         ui_in = 8'd0;
      #30
         ui_in = 8'd8;
      #2
         ui_in = 8'd0;
      #9
         ui_in = 8'd4;
      #2
         ui_in = 8'd0;
   end


   // Instantiate the Tiny Tapeout module.
   tt_um_template tt(.*);

   assign passed = top.cyc_cnt > 600;
   assign failed = 1'b0;
endmodule


// Provide a wrapper module to debounce input signals if requested.

//_\SV



// =======================
// The Tiny Tapeout module
// =======================

module tt_um_template (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    /*   // The FPGA is based on TinyTapeout 3 which has no bidirectional I/Os (vs. TT6 for the ASIC).
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    */
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
   wire reset = ! rst_n;

`include "top_gen.sv" //_\TLV
   /* verilator lint_off UNOPTFLAT */
   // Connect Tiny Tapeout I/Os to Virtual FPGA Lab.
   `line 77 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlvlib/tinytapeoutlib.tlv" 1
      assign L0_slideswitch_a0[7:0] = ui_in;
      assign L0_sseg_segment_n_a0[6:0] = ~ uo_out[6:0];
      assign L0_sseg_decimal_point_n_a0 = ~ uo_out[7];
      assign L0_sseg_digit_n_a0[7:0] = 8'b11111110;
   //_\end_source
   `line 355 "top.tlv" 2

   // Instantiate the Virtual FPGA Lab.
   `line 308 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv" 1
      
      `line 356 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv" 1
         //_/thanks
            /* Viz omitted here */























      //_\end_source
      `line 310 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv" 2
      
   
      // Board VIZ.
   
      // Board Image.
      /* Viz omitted here */



















      //_/fpga_pins
         /* Viz omitted here */


         //_/fpga
            `line 50 "top.tlv" 1
               //_|time
                  //_@0
                     assign FpgaPins_Fpga_TIME_reset_a0 = reset;
                     assign FpgaPins_Fpga_TIME_btn_a0[3:0] = ui_in[3:0];
            
                     // divides clock for better switching on dual seven-segment
                     assign FpgaPins_Fpga_TIME_clk_disp_a0 = FpgaPins_Fpga_TIME_clk_disp_a10 ? 1'b0 : FpgaPins_Fpga_TIME_clk_disp_a10 + 1'b1;
            
                     assign FpgaPins_Fpga_TIME_cnt_a0[20:0] =
                        FpgaPins_Fpga_TIME_reset_a0 ? 0 :
                        FpgaPins_Fpga_TIME_time_clk_a1 ? 0 :
                        (1 + FpgaPins_Fpga_TIME_cnt_a1);
                     //time_clk counts the num of cycles equal to 0.1s
                     assign FpgaPins_Fpga_TIME_time_clk_a0 = (FpgaPins_Fpga_TIME_cnt_a0 == 21'b111101000010010000000);
            
                     // 100 in binary 1100100
                     assign FpgaPins_Fpga_TIME_sec_cnt_a0[3:0] =
                        FpgaPins_Fpga_TIME_reset_a0 ? 0 :
                        (FpgaPins_Fpga_TIME_sec_cnt_a1 == 4'd10) ? 4'd0 :
                        FpgaPins_Fpga_TIME_time_clk_a1 ? (1 + FpgaPins_Fpga_TIME_sec_cnt_a1):
                        FpgaPins_Fpga_TIME_sec_cnt_a1;
            
                     // begins the countdown display
                     assign FpgaPins_Fpga_TIME_start_a0 =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) ? 0 :
                        FpgaPins_Fpga_TIME_start_a1 ? 1 :
                        FpgaPins_Fpga_TIME_btn_a0 == 4'd1 ? 1 :
                        0;
                     //game is paused when user clicks button 2
                     assign FpgaPins_Fpga_TIME_p1_sub_a0 =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) ? 0 :
                        (FpgaPins_Fpga_TIME_btn_a0 == 4'd4) ? 1 :
                        FpgaPins_Fpga_TIME_p1_sub_a1 ? 1 :
                        0;
                     //game is paused when user clicks button 3 (2 player)
                     assign FpgaPins_Fpga_TIME_p2_sub_a0 =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) ? 0 :
                        (FpgaPins_Fpga_TIME_btn_a0 == 4'd8) ? 1 :
                        FpgaPins_Fpga_TIME_p2_sub_a1 ? 1 :
                        0;
                     //random counter to select goal time
                     assign FpgaPins_Fpga_TIME_rand_cnt_a0[2:0] =
                        FpgaPins_Fpga_TIME_reset_a0 ? 3'd0 :
                        FpgaPins_Fpga_TIME_start_a0 ? FpgaPins_Fpga_TIME_rand_cnt_a1 :
                        !FpgaPins_Fpga_TIME_start_a0 && (FpgaPins_Fpga_TIME_start_a1 == 0) ? FpgaPins_Fpga_TIME_rand_cnt_a1 :
                        (FpgaPins_Fpga_TIME_rand_cnt_a1 == 3'd4) ? 3'd0 :
                        (3'd1 + FpgaPins_Fpga_TIME_rand_cnt_a1);
            
                     //random goal value, 5.0-9.0 by 1.0 each step
                     assign FpgaPins_Fpga_TIME_rand_goal_a0[7:0] =
                        FpgaPins_Fpga_TIME_reset_a0 ? {4'd5,4'd0} :
                        (FpgaPins_Fpga_TIME_rand_cnt_a0 == 3'd0) ? {4'd6,4'd0} :
                        (FpgaPins_Fpga_TIME_rand_cnt_a0 == 3'd1) ? {4'd8,4'd0} :
                        (FpgaPins_Fpga_TIME_rand_cnt_a0 == 3'd2) ? {4'd9,4'd0} :
                        (FpgaPins_Fpga_TIME_rand_cnt_a0 == 3'd3) ? {4'd5,4'd0} :
                        (FpgaPins_Fpga_TIME_rand_cnt_a0 == 3'd4) ? {4'd7,4'd0} :
                        {4'd9,4'd0};
            
                     //left disp?
                     assign FpgaPins_Fpga_TIME_ones_a0[3:0] =
                        FpgaPins_Fpga_TIME_reset_a0 ? 4'd0 :
                        (FpgaPins_Fpga_TIME_btn_a0 == 4'd0) && !FpgaPins_Fpga_TIME_start_a0 ? FpgaPins_Fpga_TIME_rand_goal_a0[3:0] :
                        (FpgaPins_Fpga_TIME_start_a1 == 1'b0) && FpgaPins_Fpga_TIME_start_a0 ? 4'd0 :
                        (FpgaPins_Fpga_TIME_ones_a1 == 4'd9) && (FpgaPins_Fpga_TIME_tens_a1 == 4'd9) ? 4'd9 :
                        FpgaPins_Fpga_TIME_time_clk_a1 && (FpgaPins_Fpga_TIME_ones_a1 != 4'd9) && FpgaPins_Fpga_TIME_start_a0 ? (FpgaPins_Fpga_TIME_ones_a1 + 4'd1) :
                        FpgaPins_Fpga_TIME_time_clk_a1 && (FpgaPins_Fpga_TIME_ones_a1 == 4'd9) && FpgaPins_Fpga_TIME_start_a0 ? 4'd0 :
                        FpgaPins_Fpga_TIME_ones_a1;
                     //right disp?
                     assign FpgaPins_Fpga_TIME_tens_a0[3:0] =
                        FpgaPins_Fpga_TIME_reset_a0 ? 4'd0 :
                        (FpgaPins_Fpga_TIME_btn_a0 == 4'd0) && !FpgaPins_Fpga_TIME_start_a0 ? FpgaPins_Fpga_TIME_rand_goal_a0[7:4] :
                        (FpgaPins_Fpga_TIME_start_a1 == 1'b0) && FpgaPins_Fpga_TIME_start_a0 ? 4'd0 :
                        (FpgaPins_Fpga_TIME_ones_a1 == 4'd9) && (FpgaPins_Fpga_TIME_tens_a1 == 4'd9) ? 4'd9 :
                        (FpgaPins_Fpga_TIME_sec_cnt_a1 == 4'd10) && (FpgaPins_Fpga_TIME_tens_a1 != 4'd9) && FpgaPins_Fpga_TIME_start_a0 ? (FpgaPins_Fpga_TIME_tens_a1 + 4'd1) :
                        (FpgaPins_Fpga_TIME_sec_cnt_a1 == 4'd10) && (FpgaPins_Fpga_TIME_tens_a1 == 4'd9) && FpgaPins_Fpga_TIME_start_a0 ? 4'd0 :
                        FpgaPins_Fpga_TIME_tens_a1;
                     //after X time disp hides so player can asnwer
                     assign FpgaPins_Fpga_TIME_hide_a0 =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) || (FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0) ? 0 :
                        (FpgaPins_Fpga_TIME_ones_a1 == 4'd0) && (FpgaPins_Fpga_TIME_tens_a1 == 4'd3) ? 1 :
                        FpgaPins_Fpga_TIME_hide_a1 ? 1 :
                        0;
                     //These variables store the answers for p1 and p2
                     assign FpgaPins_Fpga_TIME_p1_ans_a0[7:0] =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) ? 8'd0 :
                        FpgaPins_Fpga_TIME_p1_sub_a1 ? FpgaPins_Fpga_TIME_p1_ans_a1 :
                        (FpgaPins_Fpga_TIME_btn_a0 == 4'd4) ? {FpgaPins_Fpga_TIME_tens_a0[3:0],FpgaPins_Fpga_TIME_ones_a0[3:0]} :
                        FpgaPins_Fpga_TIME_p1_ans_a1;
                     assign FpgaPins_Fpga_TIME_p2_ans_a0[7:0] =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) ? 8'd0 :
                        FpgaPins_Fpga_TIME_p2_sub_a1 ? FpgaPins_Fpga_TIME_p2_ans_a1 :
                        (FpgaPins_Fpga_TIME_btn_a0 == 4'd8) ? {FpgaPins_Fpga_TIME_tens_a0[3:0],FpgaPins_Fpga_TIME_ones_a0[3:0]} :
                        FpgaPins_Fpga_TIME_p2_ans_a1;
                     //determines a players score, calculates how far off a player was
                     assign FpgaPins_Fpga_TIME_p1_score_a0[7:0] =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) ? 8'd0 :
                        FpgaPins_Fpga_TIME_p1_sub_a1 ? FpgaPins_Fpga_TIME_p1_score_a1 :
                        FpgaPins_Fpga_TIME_p1_sub_a0 && (FpgaPins_Fpga_TIME_p1_ans_a0[7:4]>=FpgaPins_Fpga_TIME_rand_goal_a0[7:4]) ? {FpgaPins_Fpga_TIME_p1_ans_a0[7:4]-FpgaPins_Fpga_TIME_rand_goal_a0[7:4],FpgaPins_Fpga_TIME_p1_ans_a0[3:0]} :
                        FpgaPins_Fpga_TIME_p1_sub_a0 && (FpgaPins_Fpga_TIME_p1_ans_a0[7:4]<=FpgaPins_Fpga_TIME_rand_goal_a0[7:4]) && (FpgaPins_Fpga_TIME_p1_ans_a0[3:0] == 4'd0) ? {FpgaPins_Fpga_TIME_rand_goal_a0[7:4]-FpgaPins_Fpga_TIME_p1_ans_a0[7:4],FpgaPins_Fpga_TIME_p1_ans_a0[3:0]} :
                        FpgaPins_Fpga_TIME_p1_sub_a0 && (FpgaPins_Fpga_TIME_p1_ans_a0[7:4]<=FpgaPins_Fpga_TIME_rand_goal_a0[7:4]) ? {FpgaPins_Fpga_TIME_rand_goal_a0[7:4]-FpgaPins_Fpga_TIME_p1_ans_a0[7:4]-4'd1, 4'd10-FpgaPins_Fpga_TIME_p1_ans_a0[3:0]} :
                        8'd0;
                     assign FpgaPins_Fpga_TIME_p2_score_a0[7:0] =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) ? 8'd0 :
                        FpgaPins_Fpga_TIME_p2_sub_a1 ? FpgaPins_Fpga_TIME_p2_score_a1 :
                        FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_p2_ans_a0[7:4]>=FpgaPins_Fpga_TIME_rand_goal_a0[7:4]) ? {FpgaPins_Fpga_TIME_p2_ans_a0[7:4]-FpgaPins_Fpga_TIME_rand_goal_a0[7:4],FpgaPins_Fpga_TIME_p2_ans_a0[3:0]} :
                        FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_p2_ans_a0[7:4]<=FpgaPins_Fpga_TIME_rand_goal_a0[7:4]) && (FpgaPins_Fpga_TIME_p2_ans_a0[3:0] == 4'd0) ? {FpgaPins_Fpga_TIME_rand_goal_a0[7:4]-FpgaPins_Fpga_TIME_p2_ans_a0[7:4],FpgaPins_Fpga_TIME_p2_ans_a0[3:0]} :
                        FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_p2_ans_a0[7:4]<=FpgaPins_Fpga_TIME_rand_goal_a0[7:4]) ? {FpgaPins_Fpga_TIME_rand_goal_a0[7:4]-FpgaPins_Fpga_TIME_p2_ans_a0[7:4]-4'd1, 4'd10-FpgaPins_Fpga_TIME_p2_ans_a0[3:0]} :
                        8'd0;
                     //determines the winner of the game, 0 is a tie, 1 is player 1, 2 is player 2
                     assign FpgaPins_Fpga_TIME_winner_a0[1:0] =
                        FpgaPins_Fpga_TIME_reset_a0 || (FpgaPins_Fpga_TIME_btn_a0 == 4'd2) ? 2'd0 :
                        FpgaPins_Fpga_TIME_p1_sub_a5 && FpgaPins_Fpga_TIME_p2_sub_a5 ? FpgaPins_Fpga_TIME_winner_a1 :
                        FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && FpgaPins_Fpga_TIME_p1_score_a0[7:4]>FpgaPins_Fpga_TIME_p2_score_a0[7:4] ? 2'd2 :
                        FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && FpgaPins_Fpga_TIME_p1_score_a0[7:4]<FpgaPins_Fpga_TIME_p2_score_a0[7:4] ? 2'd1 :
                        FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && FpgaPins_Fpga_TIME_p1_score_a0[3:0]>FpgaPins_Fpga_TIME_p2_score_a0[3:0] ? 2'd2 :
                        FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && FpgaPins_Fpga_TIME_p1_score_a0[3:0]<FpgaPins_Fpga_TIME_p2_score_a0[3:0] ? 2'd1 :
                        FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && FpgaPins_Fpga_TIME_p1_score_a0[7:0]==FpgaPins_Fpga_TIME_p2_score_a0[7:0] ? 2'd0 :
                        2'd3;
            
            
                     assign FpgaPins_Fpga_TIME_digit_a0[3:0] =
                        FpgaPins_Fpga_TIME_clk_disp_a0 && FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_btn_a0 == 4'd5) ? FpgaPins_Fpga_TIME_p1_ans_a0[7:4] :
                        FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_btn_a0 == 4'd5) ? FpgaPins_Fpga_TIME_p1_ans_a0[3:0] :
                        FpgaPins_Fpga_TIME_clk_disp_a0 && FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_btn_a0 == 4'd9) ? FpgaPins_Fpga_TIME_p2_ans_a0[7:4] :
                        FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_btn_a0 == 4'd9) ? FpgaPins_Fpga_TIME_p2_ans_a0[3:0] :
                        FpgaPins_Fpga_TIME_clk_disp_a0 && FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_winner_a0 == 2'd0) ? 4'd0 :
                        FpgaPins_Fpga_TIME_clk_disp_a0 && FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_winner_a0 == 2'd1) ? 4'd1 :
                        FpgaPins_Fpga_TIME_clk_disp_a0 && FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 && (FpgaPins_Fpga_TIME_winner_a0 == 2'd2) ? 4'd2 :
                        FpgaPins_Fpga_TIME_p1_sub_a0 && FpgaPins_Fpga_TIME_p2_sub_a0 ? 4'd11 :
                        FpgaPins_Fpga_TIME_clk_disp_a0 ? FpgaPins_Fpga_TIME_tens_a0 :
                        FpgaPins_Fpga_TIME_ones_a0;
            
                     //+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                     // decodes either tens or ones place to the seven-segments
                     assign uo_out[7:0] = {FpgaPins_Fpga_TIME_clk_disp_a0,
                        (FpgaPins_Fpga_TIME_hide_a0) ? 7'b1000000 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd0) ? 7'b0111111 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd1) ? 7'b0000110 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd2) ? 7'b1011011 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd3) ? 7'b1001111 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd4) ? 7'b1100110 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd5) ? 7'b1101101 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd6) ? 7'b1111101 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd7) ? 7'b0000111 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd8) ? 7'b1111111 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd9) ? 7'b1101111 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd10) ? 7'b1110011 :
                        (FpgaPins_Fpga_TIME_digit_a0 == 4'd11) ? 7'b1001001 :
                                         7'b0000000};
            
            
            
               // Connect Tiny Tapeout outputs. Note that uio_ outputs are not available in the Tiny-Tapeout-3-based FPGA boards.
               
               
            //_\end_source
            `line 341 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv" 2
   
      // LEDs.
      
   
      // 7-Segment
      `line 396 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv" 1
         for (digit = 0; digit <= 0; digit++) begin : L1_Digit //_/digit
            /* Viz omitted here */



















            for (leds = 0; leds <= 7; leds++) begin : L2_Leds logic L2_viz_lit_a0; //_/leds
               assign L2_viz_lit_a0 = (! L0_sseg_digit_n_a0[digit]) && ! ((leds == 7) ? L0_sseg_decimal_point_n_a0 : L0_sseg_segment_n_a0[leds % 7]);
               /* Viz omitted here */
































               end end
      //_\end_source
      `line 347 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv" 2
   
      // slideswitches
      `line 455 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv" 1
         for (switch = 0; switch <= 7; switch++) begin : L1_Switch logic L1_viz_switch_a0; //_/switch
            assign L1_viz_switch_a0 = L0_slideswitch_a0[switch];
            /* Viz omitted here */










































            end
      //_\end_source
      `line 350 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/a069f1e4e19adc829b53237b3e0b5d6763dc3194/tlvlib/fpgaincludes.tlv" 2
   
      // pushbuttons
      
   //_\end_source
   `line 358 "top.tlv" 2
   // Label the switch inputs [0..7] (1..8 on the physical switch panel) (top-to-bottom).
   `line 83 "/raw.githubusercontent.com/osfpga/VirtualFPGALab/35e36bd144fddd75495d4cbc01c4fc50ac5bde6f/tlvlib/tinytapeoutlib.tlv" 1
      for (input_label = 0; input_label <= 7; input_label++) begin : L1_InputLabel //_/input_label
         /* Viz omitted here */















         end
   //_\end_source
   `line 360 "top.tlv" 2

//_\SV
endmodule


// Undefine macros defined by SandPiper (in "top_gen.sv").
`undef BOGUS_USE
