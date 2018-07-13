// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_CSC_WL_dec.v
// ================================================================
// NVDLA Open Source Project
// 
// Copyright(c) 2016 - 2017 NVIDIA Corporation.  Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with 
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_CSC.h
    //entry bits
    //atomC
    //in bytes, entry/8
    //CSC_ENTRY_HEX/2
    //CSC_ENTRY_HEX/4
    //CSC_ENTRY_HEX-1
    //atomK
    //atomK
    //atomK*2
    `define CC_ATOMC_DIV_ATOMK_EQUAL_4
//image stripe keep 2*atomK
//batch keep 1
module NV_NVDLA_CSC_WL_dec (
   nvdla_core_clk
  ,nvdla_core_rstn
  ,input_data
  ,input_mask
  ,input_mask_en
  ,input_pipe_valid
  ,input_sel
  ,is_fp16
  ,is_int8
//: for(my $i = 0; $i < 32; $i ++) {
//: print qq( ,output_data${i}\n);
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
 ,output_data0
 ,output_data1
 ,output_data2
 ,output_data3
 ,output_data4
 ,output_data5
 ,output_data6
 ,output_data7
 ,output_data8
 ,output_data9
 ,output_data10
 ,output_data11
 ,output_data12
 ,output_data13
 ,output_data14
 ,output_data15
 ,output_data16
 ,output_data17
 ,output_data18
 ,output_data19
 ,output_data20
 ,output_data21
 ,output_data22
 ,output_data23
 ,output_data24
 ,output_data25
 ,output_data26
 ,output_data27
 ,output_data28
 ,output_data29
 ,output_data30
 ,output_data31

//| eperl: generated_end (DO NOT EDIT ABOVE)
  ,output_mask
  ,output_pvld
  ,output_sel
  );
input nvdla_core_clk;
input nvdla_core_rstn;
input [32*8 -1:0] input_data;
input [32 -1:0] input_mask;
input [9:0] input_mask_en;
input input_pipe_valid;
input [8 -1:0] input_sel;
input is_fp16;
input is_int8;
//: for(my $i = 0; $i < 32; $i ++) {
//: print qq(output [8 -1:0] output_data${i};\n);
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
output [8 -1:0] output_data0;
output [8 -1:0] output_data1;
output [8 -1:0] output_data2;
output [8 -1:0] output_data3;
output [8 -1:0] output_data4;
output [8 -1:0] output_data5;
output [8 -1:0] output_data6;
output [8 -1:0] output_data7;
output [8 -1:0] output_data8;
output [8 -1:0] output_data9;
output [8 -1:0] output_data10;
output [8 -1:0] output_data11;
output [8 -1:0] output_data12;
output [8 -1:0] output_data13;
output [8 -1:0] output_data14;
output [8 -1:0] output_data15;
output [8 -1:0] output_data16;
output [8 -1:0] output_data17;
output [8 -1:0] output_data18;
output [8 -1:0] output_data19;
output [8 -1:0] output_data20;
output [8 -1:0] output_data21;
output [8 -1:0] output_data22;
output [8 -1:0] output_data23;
output [8 -1:0] output_data24;
output [8 -1:0] output_data25;
output [8 -1:0] output_data26;
output [8 -1:0] output_data27;
output [8 -1:0] output_data28;
output [8 -1:0] output_data29;
output [8 -1:0] output_data30;
output [8 -1:0] output_data31;

//| eperl: generated_end (DO NOT EDIT ABOVE)
output [32 -1:0] output_mask;
output output_pvld;
output [8 -1:0] output_sel;
wire [32 -1:0] input_mask_gated;
reg [32*8 -1:0] data_d1;
reg [32 -1:0] mask_d1;
//reg [32 -1:0] mask_d2_fp16_w;
//reg [32 -1:0] mask_d2_int16_w;
wire [32 -1:0] mask_d2_int8_w;
wire [32 -1:0] mask_d2_w;
reg [32 -1:0] mask_d3;
reg [8 -1:0] sel_d1;
reg [8 -1:0] sel_d2;
reg [8 -1:0] sel_d3;
reg valid_d1;
reg valid_d2;
reg valid_d3;
//: my $kk=8;
//: for(my $i = 0; $i < 32; $i ++) {
//: my $series_no = sprintf("%02d", $i);
//: print qq(reg [8 -1:0] vec_data_${series_no};\n);
//: print qq(reg [8 -1:0] vec_data_${series_no}_d2;\n);
//: print qq(reg [8 -1:0] vec_data_${series_no}_d3;\n);
//: }
//: for(my $i = 0; $i < 32; $i ++) {
//: my $j = 1;
//: while(2**$j <= ($i + 1)) {
//: $j ++;
//: }
//: my $k = $j - 1;
//: my $series_no = sprintf("%02d", $i);
//: print qq(wire [${k}:0] vec_sum_${series_no};\n);
//: print qq(reg [${k}:0] vec_sum_${series_no}_d1;\n);
//: }
//| eperl: generated_beg (DO NOT EDIT BELOW)
reg [8 -1:0] vec_data_00;
reg [8 -1:0] vec_data_00_d2;
reg [8 -1:0] vec_data_00_d3;
reg [8 -1:0] vec_data_01;
reg [8 -1:0] vec_data_01_d2;
reg [8 -1:0] vec_data_01_d3;
reg [8 -1:0] vec_data_02;
reg [8 -1:0] vec_data_02_d2;
reg [8 -1:0] vec_data_02_d3;
reg [8 -1:0] vec_data_03;
reg [8 -1:0] vec_data_03_d2;
reg [8 -1:0] vec_data_03_d3;
reg [8 -1:0] vec_data_04;
reg [8 -1:0] vec_data_04_d2;
reg [8 -1:0] vec_data_04_d3;
reg [8 -1:0] vec_data_05;
reg [8 -1:0] vec_data_05_d2;
reg [8 -1:0] vec_data_05_d3;
reg [8 -1:0] vec_data_06;
reg [8 -1:0] vec_data_06_d2;
reg [8 -1:0] vec_data_06_d3;
reg [8 -1:0] vec_data_07;
reg [8 -1:0] vec_data_07_d2;
reg [8 -1:0] vec_data_07_d3;
reg [8 -1:0] vec_data_08;
reg [8 -1:0] vec_data_08_d2;
reg [8 -1:0] vec_data_08_d3;
reg [8 -1:0] vec_data_09;
reg [8 -1:0] vec_data_09_d2;
reg [8 -1:0] vec_data_09_d3;
reg [8 -1:0] vec_data_10;
reg [8 -1:0] vec_data_10_d2;
reg [8 -1:0] vec_data_10_d3;
reg [8 -1:0] vec_data_11;
reg [8 -1:0] vec_data_11_d2;
reg [8 -1:0] vec_data_11_d3;
reg [8 -1:0] vec_data_12;
reg [8 -1:0] vec_data_12_d2;
reg [8 -1:0] vec_data_12_d3;
reg [8 -1:0] vec_data_13;
reg [8 -1:0] vec_data_13_d2;
reg [8 -1:0] vec_data_13_d3;
reg [8 -1:0] vec_data_14;
reg [8 -1:0] vec_data_14_d2;
reg [8 -1:0] vec_data_14_d3;
reg [8 -1:0] vec_data_15;
reg [8 -1:0] vec_data_15_d2;
reg [8 -1:0] vec_data_15_d3;
reg [8 -1:0] vec_data_16;
reg [8 -1:0] vec_data_16_d2;
reg [8 -1:0] vec_data_16_d3;
reg [8 -1:0] vec_data_17;
reg [8 -1:0] vec_data_17_d2;
reg [8 -1:0] vec_data_17_d3;
reg [8 -1:0] vec_data_18;
reg [8 -1:0] vec_data_18_d2;
reg [8 -1:0] vec_data_18_d3;
reg [8 -1:0] vec_data_19;
reg [8 -1:0] vec_data_19_d2;
reg [8 -1:0] vec_data_19_d3;
reg [8 -1:0] vec_data_20;
reg [8 -1:0] vec_data_20_d2;
reg [8 -1:0] vec_data_20_d3;
reg [8 -1:0] vec_data_21;
reg [8 -1:0] vec_data_21_d2;
reg [8 -1:0] vec_data_21_d3;
reg [8 -1:0] vec_data_22;
reg [8 -1:0] vec_data_22_d2;
reg [8 -1:0] vec_data_22_d3;
reg [8 -1:0] vec_data_23;
reg [8 -1:0] vec_data_23_d2;
reg [8 -1:0] vec_data_23_d3;
reg [8 -1:0] vec_data_24;
reg [8 -1:0] vec_data_24_d2;
reg [8 -1:0] vec_data_24_d3;
reg [8 -1:0] vec_data_25;
reg [8 -1:0] vec_data_25_d2;
reg [8 -1:0] vec_data_25_d3;
reg [8 -1:0] vec_data_26;
reg [8 -1:0] vec_data_26_d2;
reg [8 -1:0] vec_data_26_d3;
reg [8 -1:0] vec_data_27;
reg [8 -1:0] vec_data_27_d2;
reg [8 -1:0] vec_data_27_d3;
reg [8 -1:0] vec_data_28;
reg [8 -1:0] vec_data_28_d2;
reg [8 -1:0] vec_data_28_d3;
reg [8 -1:0] vec_data_29;
reg [8 -1:0] vec_data_29_d2;
reg [8 -1:0] vec_data_29_d3;
reg [8 -1:0] vec_data_30;
reg [8 -1:0] vec_data_30_d2;
reg [8 -1:0] vec_data_30_d3;
reg [8 -1:0] vec_data_31;
reg [8 -1:0] vec_data_31_d2;
reg [8 -1:0] vec_data_31_d3;
wire [0:0] vec_sum_00;
reg [0:0] vec_sum_00_d1;
wire [1:0] vec_sum_01;
reg [1:0] vec_sum_01_d1;
wire [1:0] vec_sum_02;
reg [1:0] vec_sum_02_d1;
wire [2:0] vec_sum_03;
reg [2:0] vec_sum_03_d1;
wire [2:0] vec_sum_04;
reg [2:0] vec_sum_04_d1;
wire [2:0] vec_sum_05;
reg [2:0] vec_sum_05_d1;
wire [2:0] vec_sum_06;
reg [2:0] vec_sum_06_d1;
wire [3:0] vec_sum_07;
reg [3:0] vec_sum_07_d1;
wire [3:0] vec_sum_08;
reg [3:0] vec_sum_08_d1;
wire [3:0] vec_sum_09;
reg [3:0] vec_sum_09_d1;
wire [3:0] vec_sum_10;
reg [3:0] vec_sum_10_d1;
wire [3:0] vec_sum_11;
reg [3:0] vec_sum_11_d1;
wire [3:0] vec_sum_12;
reg [3:0] vec_sum_12_d1;
wire [3:0] vec_sum_13;
reg [3:0] vec_sum_13_d1;
wire [3:0] vec_sum_14;
reg [3:0] vec_sum_14_d1;
wire [4:0] vec_sum_15;
reg [4:0] vec_sum_15_d1;
wire [4:0] vec_sum_16;
reg [4:0] vec_sum_16_d1;
wire [4:0] vec_sum_17;
reg [4:0] vec_sum_17_d1;
wire [4:0] vec_sum_18;
reg [4:0] vec_sum_18_d1;
wire [4:0] vec_sum_19;
reg [4:0] vec_sum_19_d1;
wire [4:0] vec_sum_20;
reg [4:0] vec_sum_20_d1;
wire [4:0] vec_sum_21;
reg [4:0] vec_sum_21_d1;
wire [4:0] vec_sum_22;
reg [4:0] vec_sum_22_d1;
wire [4:0] vec_sum_23;
reg [4:0] vec_sum_23_d1;
wire [4:0] vec_sum_24;
reg [4:0] vec_sum_24_d1;
wire [4:0] vec_sum_25;
reg [4:0] vec_sum_25_d1;
wire [4:0] vec_sum_26;
reg [4:0] vec_sum_26_d1;
wire [4:0] vec_sum_27;
reg [4:0] vec_sum_27_d1;
wire [4:0] vec_sum_28;
reg [4:0] vec_sum_28_d1;
wire [4:0] vec_sum_29;
reg [4:0] vec_sum_29_d1;
wire [4:0] vec_sum_30;
reg [4:0] vec_sum_30_d1;
wire [5:0] vec_sum_31;
reg [5:0] vec_sum_31_d1;

//| eperl: generated_end (DO NOT EDIT ABOVE)
/////////////////////////////////////////////////////////////////////////////////////////////
// Decoder of compressed weight
//
// data_mask input_data mac_sel
// | | |
// sums_for_sel register register
// | | |
// ------------------> mux register
// | |
// output_data output_sel
//
/////////////////////////////////////////////////////////////////////////////////////////////
//: my $i;
//: my $j;
//: my $k;
//: my $series_no;
//: my $series_no_1;
//: my $name;
//: my $name_1;
//: my $width;
//: my $st;
//: my $end;
//: my @bit_width_list;
//: $width = 8;
//: for($i = 0; $i < 32; $i ++) {
//: $j = 0;
//: while(2**$j <= ($i + 1)) {
//: $j ++;
//: }
//: $bit_width_list[$i] = $j;
//: }
//: print "////////////////////////////////// phase I: calculate sums for mux //////////////////////////////////\n";
//: print "assign input_mask_gated = ~input_mask_en[8] ? {${width}{1'b0}} : input_mask;\n\n";
//:
//: for($i = 0; $i < 32; $i ++) {
//: $series_no = sprintf("%02d", $i);
//: print "assign vec_sum_${series_no} = ";
//: for($j = 0; $j < $i + 1; $j ++) {
//: print "input_mask_gated[${j}]";
//: if($j == $i) {
//: print ";\n";
//: } elsif ($j % 8 == 7) {
//: print "\n                   + ";
//: } else {
//: print " + ";
//: }
//: }
//: print "\n\n";
//: }
//: print "\n\n";
//:
//: print "////////////////////////////////// phase I: registers //////////////////////////////////\n";
//: &eperl::flop("-nodeclare -rval \"1'b0\" -q valid_d1 -d input_pipe_valid ");
//: &eperl::flop("-nodeclare -norst -q data_d1 -en input_pipe_valid -d input_data ");
//: &eperl::flop("-nodeclare -norst -q mask_d1 -en input_pipe_valid -d input_mask ");
//: &eperl::flop("-nodeclare -q sel_d1 -en input_pipe_valid -d input_sel ");
//:
//: for($i = 0; $i < 32; $i ++) {
//: $series_no = sprintf("%02d", $i);
//: my $j = int($i / 8);
//: my $wid = $bit_width_list[$i];
//: &eperl::flop("-nodeclare -rval \"{${wid}{1'b0}}\" -q vec_sum_${series_no}_d1 -en \"(input_pipe_valid & input_mask_en[${j}])\" -d vec_sum_${series_no} ");
//: }
//: print "\n\n";
//:
//: print "////////////////////////////////// phase II: mux //////////////////////////////////\n";
//: for($i = 0; $i < 32; $i ++) {
//: $series_no = sprintf("%02d", $i);
//: $name = "vec_data_${series_no}";
//: $k = $bit_width_list[$i];
//:
//: print "always @ (*) begin\n";
//: print "    case(vec_sum_${series_no}_d1)\n";
//:
//: for($j = 1; $j <= $i + 1; $j ++) {
//: $st = $j * $width - 1;
//: $end = ($j - 1) * $width;
//: print "        ${k}'d${j}: $name = data_d1[${st}:${end}];\n";
//: }
//: print "    default: $name= ${width}'b0;\n";
//: print "    endcase\n";
//: print "end\n\n";
//: }
//: print "\n\n";
//:
//: print "////////////////////////////////// phase II: registers //////////////////////////////////\n";
//: &eperl::flop("-nodeclare -rval \"1'b0\" -q valid_d2 -d valid_d1 ");
//: &eperl::flop("-nodeclare -q sel_d2 -en valid_d1 -d sel_d1 ");
//: for($i = 0; $i < 32; $i ++) {
//: $series_no = sprintf("%02d", $i);
//: $name = "vec_data_${series_no}";
//: &eperl::flop("-nodeclare -norst -q ${name}_d2 -en \"valid_d1\" -d \"(${name} & {${width}{mask_d1[${i}]}})\" ");
//: }
//: print "\n\n";
//:
//: print "////////////////////////////////// phase III: registers //////////////////////////////////\n";
//: for($i = 0; $i < 32; $i ++) {
//: $series_no = sprintf("%02d", $i);
//: $name = "vec_data_${series_no}_d2";
//: print "assign mask_d2_int8_w[${i}] = (|${name});\n";
//: }
//: print "\n\n\n";
//:
//: #for($i = 0; $i < 32; $i += 2) {
//: # $j = $i + 1;
//: # $series_no = sprintf("%02d", $i);
//: # $series_no_1 = sprintf("%02d", $j);
//: # $name = "vec_data_${series_no}_d2";
//: # $name_1 = "vec_data_${series_no_1}_d2";
//: # print "assign mask_d2_int16_w[${j}:${i}] = {2{(|{${name_1}, ${name}})}};\n";
//: #}
//: #print "\n\n\n";
//:
//: #for($i = 0; $i < 32; $i += 2) {
//: # $j = $i + 1;
//: # $series_no = sprintf("%02d", $i);
//: # $series_no_1 = sprintf("%02d", $j);
//: # $name = "vec_data_${series_no}_d2";
//: # $name_1 = "vec_data_${series_no_1}_d2";
//: # print "assign mask_d2_fp16_w[${j}:${i}] = {2{(|{${name_1}[6:0], ${name}})}};\n";
//: #}
//: #print "\n\n\n";
//:
//: #print "assign mask_d2_w = is_int8 ? mask_d2_int8_w :\n";
//: #print "                   is_fp16 ? mask_d2_fp16_w :\n";
//: #print "                   mask_d2_int16_w;\n";
//: #print "\n\n\n";
//: print "assign mask_d2_w = mask_d2_int8_w ;\n"; #only for int8
//:
//: &eperl::flop("-nodeclare -rval \"1'b0\" -q valid_d3 -d valid_d2 ");
//: &eperl::flop("-nodeclare -norst -q mask_d3 -en valid_d2 -d mask_d2_w ");
//: &eperl::flop("-nodeclare -q sel_d3 -en valid_d2 -d sel_d2 ");
//: for($i = 0; $i < 32; $i ++) {
//: $series_no = sprintf("%02d", $i);
//: $name = "vec_data_${series_no}";
//: &eperl::flop("-nodeclare -q ${name}_d3 -en valid_d2 -d ${name}_d2 ");
//: }
//: print "\n\n";
//:
//: print "////////////////////////////////// output: rename //////////////////////////////////\n";
//: print "assign output_pvld = valid_d3;\n";
//: print "assign output_mask = mask_d3;\n";
//: print "assign output_sel = sel_d3;\n";
//: for($i = 0; $i < 32; $i ++) {
//: $series_no = sprintf("%02d", $i);
//: $name = "vec_data_${series_no}";
//: print "assign output_data${i} = ${name}_d3;\n";
//: }
//: print "\n\n";
//| eperl: generated_beg (DO NOT EDIT BELOW)
////////////////////////////////// phase I: calculate sums for mux //////////////////////////////////
assign input_mask_gated = ~input_mask_en[8] ? {8{1'b0}} : input_mask;

assign vec_sum_00 = input_mask_gated[0];


assign vec_sum_01 = input_mask_gated[0] + input_mask_gated[1];


assign vec_sum_02 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2];


assign vec_sum_03 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3];


assign vec_sum_04 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4];


assign vec_sum_05 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5];


assign vec_sum_06 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6];


assign vec_sum_07 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7];


assign vec_sum_08 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8];


assign vec_sum_09 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9];


assign vec_sum_10 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10];


assign vec_sum_11 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11];


assign vec_sum_12 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12];


assign vec_sum_13 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13];


assign vec_sum_14 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14];


assign vec_sum_15 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14] + input_mask_gated[15];


assign vec_sum_16 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14] + input_mask_gated[15]
                   + input_mask_gated[16];


assign vec_sum_17 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14] + input_mask_gated[15]
                   + input_mask_gated[16] + input_mask_gated[17];


assign vec_sum_18 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14] + input_mask_gated[15]
                   + input_mask_gated[16] + input_mask_gated[17] + input_mask_gated[18];


assign vec_sum_19 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14] + input_mask_gated[15]
                   + input_mask_gated[16] + input_mask_gated[17] + input_mask_gated[18] + input_mask_gated[19];


assign vec_sum_20 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14] + input_mask_gated[15]
                   + input_mask_gated[16] + input_mask_gated[17] + input_mask_gated[18] + input_mask_gated[19] + input_mask_gated[20];


assign vec_sum_21 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14] + input_mask_gated[15]
                   + input_mask_gated[16] + input_mask_gated[17] + input_mask_gated[18] + input_mask_gated[19] + input_mask_gated[20] + input_mask_gated[21];


assign vec_sum_22 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14] + input_mask_gated[15]
                   + input_mask_gated[16] + input_mask_gated[17] + input_mask_gated[18] + input_mask_gated[19] + input_mask_gated[20] + input_mask_gated[21] + input_mask_gated[22];


assign vec_sum_23 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14] + input_mask_gated[15]
                   + input_mask_gated[16] + input_mask_gated[17] + input_mask_gated[18] + input_mask_gated[19] + input_mask_gated[20] + input_mask_gated[21] + input_mask_gated[22] + input_mask_gated[23];


assign vec_sum_24 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14] + input_mask_gated[15]
                   + input_mask_gated[16] + input_mask_gated[17] + input_mask_gated[18] + input_mask_gated[19] + input_mask_gated[20] + input_mask_gated[21] + input_mask_gated[22] + input_mask_gated[23]
                   + input_mask_gated[24];


assign vec_sum_25 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14] + input_mask_gated[15]
                   + input_mask_gated[16] + input_mask_gated[17] + input_mask_gated[18] + input_mask_gated[19] + input_mask_gated[20] + input_mask_gated[21] + input_mask_gated[22] + input_mask_gated[23]
                   + input_mask_gated[24] + input_mask_gated[25];


assign vec_sum_26 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14] + input_mask_gated[15]
                   + input_mask_gated[16] + input_mask_gated[17] + input_mask_gated[18] + input_mask_gated[19] + input_mask_gated[20] + input_mask_gated[21] + input_mask_gated[22] + input_mask_gated[23]
                   + input_mask_gated[24] + input_mask_gated[25] + input_mask_gated[26];


assign vec_sum_27 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14] + input_mask_gated[15]
                   + input_mask_gated[16] + input_mask_gated[17] + input_mask_gated[18] + input_mask_gated[19] + input_mask_gated[20] + input_mask_gated[21] + input_mask_gated[22] + input_mask_gated[23]
                   + input_mask_gated[24] + input_mask_gated[25] + input_mask_gated[26] + input_mask_gated[27];


assign vec_sum_28 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14] + input_mask_gated[15]
                   + input_mask_gated[16] + input_mask_gated[17] + input_mask_gated[18] + input_mask_gated[19] + input_mask_gated[20] + input_mask_gated[21] + input_mask_gated[22] + input_mask_gated[23]
                   + input_mask_gated[24] + input_mask_gated[25] + input_mask_gated[26] + input_mask_gated[27] + input_mask_gated[28];


assign vec_sum_29 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14] + input_mask_gated[15]
                   + input_mask_gated[16] + input_mask_gated[17] + input_mask_gated[18] + input_mask_gated[19] + input_mask_gated[20] + input_mask_gated[21] + input_mask_gated[22] + input_mask_gated[23]
                   + input_mask_gated[24] + input_mask_gated[25] + input_mask_gated[26] + input_mask_gated[27] + input_mask_gated[28] + input_mask_gated[29];


assign vec_sum_30 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14] + input_mask_gated[15]
                   + input_mask_gated[16] + input_mask_gated[17] + input_mask_gated[18] + input_mask_gated[19] + input_mask_gated[20] + input_mask_gated[21] + input_mask_gated[22] + input_mask_gated[23]
                   + input_mask_gated[24] + input_mask_gated[25] + input_mask_gated[26] + input_mask_gated[27] + input_mask_gated[28] + input_mask_gated[29] + input_mask_gated[30];


assign vec_sum_31 = input_mask_gated[0] + input_mask_gated[1] + input_mask_gated[2] + input_mask_gated[3] + input_mask_gated[4] + input_mask_gated[5] + input_mask_gated[6] + input_mask_gated[7]
                   + input_mask_gated[8] + input_mask_gated[9] + input_mask_gated[10] + input_mask_gated[11] + input_mask_gated[12] + input_mask_gated[13] + input_mask_gated[14] + input_mask_gated[15]
                   + input_mask_gated[16] + input_mask_gated[17] + input_mask_gated[18] + input_mask_gated[19] + input_mask_gated[20] + input_mask_gated[21] + input_mask_gated[22] + input_mask_gated[23]
                   + input_mask_gated[24] + input_mask_gated[25] + input_mask_gated[26] + input_mask_gated[27] + input_mask_gated[28] + input_mask_gated[29] + input_mask_gated[30] + input_mask_gated[31];




////////////////////////////////// phase I: registers //////////////////////////////////
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       valid_d1 <= 1'b0;
   end else begin
       valid_d1 <= input_pipe_valid;
   end
end
always @(posedge nvdla_core_clk) begin
       if ((input_pipe_valid) == 1'b1) begin
           data_d1 <= input_data;
       // VCS coverage off
       end else if ((input_pipe_valid) == 1'b0) begin
       end else begin
           data_d1 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((input_pipe_valid) == 1'b1) begin
           mask_d1 <= input_mask;
       // VCS coverage off
       end else if ((input_pipe_valid) == 1'b0) begin
       end else begin
           mask_d1 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sel_d1 <= 'b0;
   end else begin
       if ((input_pipe_valid) == 1'b1) begin
           sel_d1 <= input_sel;
       // VCS coverage off
       end else if ((input_pipe_valid) == 1'b0) begin
       end else begin
           sel_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_00_d1 <= {1{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[0])) == 1'b1) begin
           vec_sum_00_d1 <= vec_sum_00;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[0])) == 1'b0) begin
       end else begin
           vec_sum_00_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_01_d1 <= {2{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[0])) == 1'b1) begin
           vec_sum_01_d1 <= vec_sum_01;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[0])) == 1'b0) begin
       end else begin
           vec_sum_01_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_02_d1 <= {2{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[0])) == 1'b1) begin
           vec_sum_02_d1 <= vec_sum_02;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[0])) == 1'b0) begin
       end else begin
           vec_sum_02_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_03_d1 <= {3{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[0])) == 1'b1) begin
           vec_sum_03_d1 <= vec_sum_03;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[0])) == 1'b0) begin
       end else begin
           vec_sum_03_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_04_d1 <= {3{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[0])) == 1'b1) begin
           vec_sum_04_d1 <= vec_sum_04;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[0])) == 1'b0) begin
       end else begin
           vec_sum_04_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_05_d1 <= {3{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[0])) == 1'b1) begin
           vec_sum_05_d1 <= vec_sum_05;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[0])) == 1'b0) begin
       end else begin
           vec_sum_05_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_06_d1 <= {3{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[0])) == 1'b1) begin
           vec_sum_06_d1 <= vec_sum_06;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[0])) == 1'b0) begin
       end else begin
           vec_sum_06_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_07_d1 <= {4{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[0])) == 1'b1) begin
           vec_sum_07_d1 <= vec_sum_07;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[0])) == 1'b0) begin
       end else begin
           vec_sum_07_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_08_d1 <= {4{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[1])) == 1'b1) begin
           vec_sum_08_d1 <= vec_sum_08;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[1])) == 1'b0) begin
       end else begin
           vec_sum_08_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_09_d1 <= {4{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[1])) == 1'b1) begin
           vec_sum_09_d1 <= vec_sum_09;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[1])) == 1'b0) begin
       end else begin
           vec_sum_09_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_10_d1 <= {4{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[1])) == 1'b1) begin
           vec_sum_10_d1 <= vec_sum_10;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[1])) == 1'b0) begin
       end else begin
           vec_sum_10_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_11_d1 <= {4{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[1])) == 1'b1) begin
           vec_sum_11_d1 <= vec_sum_11;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[1])) == 1'b0) begin
       end else begin
           vec_sum_11_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_12_d1 <= {4{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[1])) == 1'b1) begin
           vec_sum_12_d1 <= vec_sum_12;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[1])) == 1'b0) begin
       end else begin
           vec_sum_12_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_13_d1 <= {4{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[1])) == 1'b1) begin
           vec_sum_13_d1 <= vec_sum_13;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[1])) == 1'b0) begin
       end else begin
           vec_sum_13_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_14_d1 <= {4{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[1])) == 1'b1) begin
           vec_sum_14_d1 <= vec_sum_14;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[1])) == 1'b0) begin
       end else begin
           vec_sum_14_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_15_d1 <= {5{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[1])) == 1'b1) begin
           vec_sum_15_d1 <= vec_sum_15;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[1])) == 1'b0) begin
       end else begin
           vec_sum_15_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_16_d1 <= {5{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[2])) == 1'b1) begin
           vec_sum_16_d1 <= vec_sum_16;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[2])) == 1'b0) begin
       end else begin
           vec_sum_16_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_17_d1 <= {5{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[2])) == 1'b1) begin
           vec_sum_17_d1 <= vec_sum_17;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[2])) == 1'b0) begin
       end else begin
           vec_sum_17_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_18_d1 <= {5{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[2])) == 1'b1) begin
           vec_sum_18_d1 <= vec_sum_18;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[2])) == 1'b0) begin
       end else begin
           vec_sum_18_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_19_d1 <= {5{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[2])) == 1'b1) begin
           vec_sum_19_d1 <= vec_sum_19;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[2])) == 1'b0) begin
       end else begin
           vec_sum_19_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_20_d1 <= {5{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[2])) == 1'b1) begin
           vec_sum_20_d1 <= vec_sum_20;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[2])) == 1'b0) begin
       end else begin
           vec_sum_20_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_21_d1 <= {5{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[2])) == 1'b1) begin
           vec_sum_21_d1 <= vec_sum_21;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[2])) == 1'b0) begin
       end else begin
           vec_sum_21_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_22_d1 <= {5{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[2])) == 1'b1) begin
           vec_sum_22_d1 <= vec_sum_22;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[2])) == 1'b0) begin
       end else begin
           vec_sum_22_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_23_d1 <= {5{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[2])) == 1'b1) begin
           vec_sum_23_d1 <= vec_sum_23;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[2])) == 1'b0) begin
       end else begin
           vec_sum_23_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_24_d1 <= {5{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[3])) == 1'b1) begin
           vec_sum_24_d1 <= vec_sum_24;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[3])) == 1'b0) begin
       end else begin
           vec_sum_24_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_25_d1 <= {5{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[3])) == 1'b1) begin
           vec_sum_25_d1 <= vec_sum_25;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[3])) == 1'b0) begin
       end else begin
           vec_sum_25_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_26_d1 <= {5{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[3])) == 1'b1) begin
           vec_sum_26_d1 <= vec_sum_26;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[3])) == 1'b0) begin
       end else begin
           vec_sum_26_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_27_d1 <= {5{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[3])) == 1'b1) begin
           vec_sum_27_d1 <= vec_sum_27;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[3])) == 1'b0) begin
       end else begin
           vec_sum_27_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_28_d1 <= {5{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[3])) == 1'b1) begin
           vec_sum_28_d1 <= vec_sum_28;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[3])) == 1'b0) begin
       end else begin
           vec_sum_28_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_29_d1 <= {5{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[3])) == 1'b1) begin
           vec_sum_29_d1 <= vec_sum_29;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[3])) == 1'b0) begin
       end else begin
           vec_sum_29_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_30_d1 <= {5{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[3])) == 1'b1) begin
           vec_sum_30_d1 <= vec_sum_30;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[3])) == 1'b0) begin
       end else begin
           vec_sum_30_d1 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_sum_31_d1 <= {6{1'b0}};
   end else begin
       if (((input_pipe_valid & input_mask_en[3])) == 1'b1) begin
           vec_sum_31_d1 <= vec_sum_31;
       // VCS coverage off
       end else if (((input_pipe_valid & input_mask_en[3])) == 1'b0) begin
       end else begin
           vec_sum_31_d1 <= 'bx;
       // VCS coverage on
       end
   end
end


////////////////////////////////// phase II: mux //////////////////////////////////
always @ (*) begin
    case(vec_sum_00_d1)
        1'd1: vec_data_00 = data_d1[7:0];
    default: vec_data_00= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_01_d1)
        2'd1: vec_data_01 = data_d1[7:0];
        2'd2: vec_data_01 = data_d1[15:8];
    default: vec_data_01= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_02_d1)
        2'd1: vec_data_02 = data_d1[7:0];
        2'd2: vec_data_02 = data_d1[15:8];
        2'd3: vec_data_02 = data_d1[23:16];
    default: vec_data_02= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_03_d1)
        3'd1: vec_data_03 = data_d1[7:0];
        3'd2: vec_data_03 = data_d1[15:8];
        3'd3: vec_data_03 = data_d1[23:16];
        3'd4: vec_data_03 = data_d1[31:24];
    default: vec_data_03= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_04_d1)
        3'd1: vec_data_04 = data_d1[7:0];
        3'd2: vec_data_04 = data_d1[15:8];
        3'd3: vec_data_04 = data_d1[23:16];
        3'd4: vec_data_04 = data_d1[31:24];
        3'd5: vec_data_04 = data_d1[39:32];
    default: vec_data_04= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_05_d1)
        3'd1: vec_data_05 = data_d1[7:0];
        3'd2: vec_data_05 = data_d1[15:8];
        3'd3: vec_data_05 = data_d1[23:16];
        3'd4: vec_data_05 = data_d1[31:24];
        3'd5: vec_data_05 = data_d1[39:32];
        3'd6: vec_data_05 = data_d1[47:40];
    default: vec_data_05= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_06_d1)
        3'd1: vec_data_06 = data_d1[7:0];
        3'd2: vec_data_06 = data_d1[15:8];
        3'd3: vec_data_06 = data_d1[23:16];
        3'd4: vec_data_06 = data_d1[31:24];
        3'd5: vec_data_06 = data_d1[39:32];
        3'd6: vec_data_06 = data_d1[47:40];
        3'd7: vec_data_06 = data_d1[55:48];
    default: vec_data_06= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_07_d1)
        4'd1: vec_data_07 = data_d1[7:0];
        4'd2: vec_data_07 = data_d1[15:8];
        4'd3: vec_data_07 = data_d1[23:16];
        4'd4: vec_data_07 = data_d1[31:24];
        4'd5: vec_data_07 = data_d1[39:32];
        4'd6: vec_data_07 = data_d1[47:40];
        4'd7: vec_data_07 = data_d1[55:48];
        4'd8: vec_data_07 = data_d1[63:56];
    default: vec_data_07= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_08_d1)
        4'd1: vec_data_08 = data_d1[7:0];
        4'd2: vec_data_08 = data_d1[15:8];
        4'd3: vec_data_08 = data_d1[23:16];
        4'd4: vec_data_08 = data_d1[31:24];
        4'd5: vec_data_08 = data_d1[39:32];
        4'd6: vec_data_08 = data_d1[47:40];
        4'd7: vec_data_08 = data_d1[55:48];
        4'd8: vec_data_08 = data_d1[63:56];
        4'd9: vec_data_08 = data_d1[71:64];
    default: vec_data_08= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_09_d1)
        4'd1: vec_data_09 = data_d1[7:0];
        4'd2: vec_data_09 = data_d1[15:8];
        4'd3: vec_data_09 = data_d1[23:16];
        4'd4: vec_data_09 = data_d1[31:24];
        4'd5: vec_data_09 = data_d1[39:32];
        4'd6: vec_data_09 = data_d1[47:40];
        4'd7: vec_data_09 = data_d1[55:48];
        4'd8: vec_data_09 = data_d1[63:56];
        4'd9: vec_data_09 = data_d1[71:64];
        4'd10: vec_data_09 = data_d1[79:72];
    default: vec_data_09= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_10_d1)
        4'd1: vec_data_10 = data_d1[7:0];
        4'd2: vec_data_10 = data_d1[15:8];
        4'd3: vec_data_10 = data_d1[23:16];
        4'd4: vec_data_10 = data_d1[31:24];
        4'd5: vec_data_10 = data_d1[39:32];
        4'd6: vec_data_10 = data_d1[47:40];
        4'd7: vec_data_10 = data_d1[55:48];
        4'd8: vec_data_10 = data_d1[63:56];
        4'd9: vec_data_10 = data_d1[71:64];
        4'd10: vec_data_10 = data_d1[79:72];
        4'd11: vec_data_10 = data_d1[87:80];
    default: vec_data_10= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_11_d1)
        4'd1: vec_data_11 = data_d1[7:0];
        4'd2: vec_data_11 = data_d1[15:8];
        4'd3: vec_data_11 = data_d1[23:16];
        4'd4: vec_data_11 = data_d1[31:24];
        4'd5: vec_data_11 = data_d1[39:32];
        4'd6: vec_data_11 = data_d1[47:40];
        4'd7: vec_data_11 = data_d1[55:48];
        4'd8: vec_data_11 = data_d1[63:56];
        4'd9: vec_data_11 = data_d1[71:64];
        4'd10: vec_data_11 = data_d1[79:72];
        4'd11: vec_data_11 = data_d1[87:80];
        4'd12: vec_data_11 = data_d1[95:88];
    default: vec_data_11= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_12_d1)
        4'd1: vec_data_12 = data_d1[7:0];
        4'd2: vec_data_12 = data_d1[15:8];
        4'd3: vec_data_12 = data_d1[23:16];
        4'd4: vec_data_12 = data_d1[31:24];
        4'd5: vec_data_12 = data_d1[39:32];
        4'd6: vec_data_12 = data_d1[47:40];
        4'd7: vec_data_12 = data_d1[55:48];
        4'd8: vec_data_12 = data_d1[63:56];
        4'd9: vec_data_12 = data_d1[71:64];
        4'd10: vec_data_12 = data_d1[79:72];
        4'd11: vec_data_12 = data_d1[87:80];
        4'd12: vec_data_12 = data_d1[95:88];
        4'd13: vec_data_12 = data_d1[103:96];
    default: vec_data_12= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_13_d1)
        4'd1: vec_data_13 = data_d1[7:0];
        4'd2: vec_data_13 = data_d1[15:8];
        4'd3: vec_data_13 = data_d1[23:16];
        4'd4: vec_data_13 = data_d1[31:24];
        4'd5: vec_data_13 = data_d1[39:32];
        4'd6: vec_data_13 = data_d1[47:40];
        4'd7: vec_data_13 = data_d1[55:48];
        4'd8: vec_data_13 = data_d1[63:56];
        4'd9: vec_data_13 = data_d1[71:64];
        4'd10: vec_data_13 = data_d1[79:72];
        4'd11: vec_data_13 = data_d1[87:80];
        4'd12: vec_data_13 = data_d1[95:88];
        4'd13: vec_data_13 = data_d1[103:96];
        4'd14: vec_data_13 = data_d1[111:104];
    default: vec_data_13= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_14_d1)
        4'd1: vec_data_14 = data_d1[7:0];
        4'd2: vec_data_14 = data_d1[15:8];
        4'd3: vec_data_14 = data_d1[23:16];
        4'd4: vec_data_14 = data_d1[31:24];
        4'd5: vec_data_14 = data_d1[39:32];
        4'd6: vec_data_14 = data_d1[47:40];
        4'd7: vec_data_14 = data_d1[55:48];
        4'd8: vec_data_14 = data_d1[63:56];
        4'd9: vec_data_14 = data_d1[71:64];
        4'd10: vec_data_14 = data_d1[79:72];
        4'd11: vec_data_14 = data_d1[87:80];
        4'd12: vec_data_14 = data_d1[95:88];
        4'd13: vec_data_14 = data_d1[103:96];
        4'd14: vec_data_14 = data_d1[111:104];
        4'd15: vec_data_14 = data_d1[119:112];
    default: vec_data_14= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_15_d1)
        5'd1: vec_data_15 = data_d1[7:0];
        5'd2: vec_data_15 = data_d1[15:8];
        5'd3: vec_data_15 = data_d1[23:16];
        5'd4: vec_data_15 = data_d1[31:24];
        5'd5: vec_data_15 = data_d1[39:32];
        5'd6: vec_data_15 = data_d1[47:40];
        5'd7: vec_data_15 = data_d1[55:48];
        5'd8: vec_data_15 = data_d1[63:56];
        5'd9: vec_data_15 = data_d1[71:64];
        5'd10: vec_data_15 = data_d1[79:72];
        5'd11: vec_data_15 = data_d1[87:80];
        5'd12: vec_data_15 = data_d1[95:88];
        5'd13: vec_data_15 = data_d1[103:96];
        5'd14: vec_data_15 = data_d1[111:104];
        5'd15: vec_data_15 = data_d1[119:112];
        5'd16: vec_data_15 = data_d1[127:120];
    default: vec_data_15= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_16_d1)
        5'd1: vec_data_16 = data_d1[7:0];
        5'd2: vec_data_16 = data_d1[15:8];
        5'd3: vec_data_16 = data_d1[23:16];
        5'd4: vec_data_16 = data_d1[31:24];
        5'd5: vec_data_16 = data_d1[39:32];
        5'd6: vec_data_16 = data_d1[47:40];
        5'd7: vec_data_16 = data_d1[55:48];
        5'd8: vec_data_16 = data_d1[63:56];
        5'd9: vec_data_16 = data_d1[71:64];
        5'd10: vec_data_16 = data_d1[79:72];
        5'd11: vec_data_16 = data_d1[87:80];
        5'd12: vec_data_16 = data_d1[95:88];
        5'd13: vec_data_16 = data_d1[103:96];
        5'd14: vec_data_16 = data_d1[111:104];
        5'd15: vec_data_16 = data_d1[119:112];
        5'd16: vec_data_16 = data_d1[127:120];
        5'd17: vec_data_16 = data_d1[135:128];
    default: vec_data_16= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_17_d1)
        5'd1: vec_data_17 = data_d1[7:0];
        5'd2: vec_data_17 = data_d1[15:8];
        5'd3: vec_data_17 = data_d1[23:16];
        5'd4: vec_data_17 = data_d1[31:24];
        5'd5: vec_data_17 = data_d1[39:32];
        5'd6: vec_data_17 = data_d1[47:40];
        5'd7: vec_data_17 = data_d1[55:48];
        5'd8: vec_data_17 = data_d1[63:56];
        5'd9: vec_data_17 = data_d1[71:64];
        5'd10: vec_data_17 = data_d1[79:72];
        5'd11: vec_data_17 = data_d1[87:80];
        5'd12: vec_data_17 = data_d1[95:88];
        5'd13: vec_data_17 = data_d1[103:96];
        5'd14: vec_data_17 = data_d1[111:104];
        5'd15: vec_data_17 = data_d1[119:112];
        5'd16: vec_data_17 = data_d1[127:120];
        5'd17: vec_data_17 = data_d1[135:128];
        5'd18: vec_data_17 = data_d1[143:136];
    default: vec_data_17= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_18_d1)
        5'd1: vec_data_18 = data_d1[7:0];
        5'd2: vec_data_18 = data_d1[15:8];
        5'd3: vec_data_18 = data_d1[23:16];
        5'd4: vec_data_18 = data_d1[31:24];
        5'd5: vec_data_18 = data_d1[39:32];
        5'd6: vec_data_18 = data_d1[47:40];
        5'd7: vec_data_18 = data_d1[55:48];
        5'd8: vec_data_18 = data_d1[63:56];
        5'd9: vec_data_18 = data_d1[71:64];
        5'd10: vec_data_18 = data_d1[79:72];
        5'd11: vec_data_18 = data_d1[87:80];
        5'd12: vec_data_18 = data_d1[95:88];
        5'd13: vec_data_18 = data_d1[103:96];
        5'd14: vec_data_18 = data_d1[111:104];
        5'd15: vec_data_18 = data_d1[119:112];
        5'd16: vec_data_18 = data_d1[127:120];
        5'd17: vec_data_18 = data_d1[135:128];
        5'd18: vec_data_18 = data_d1[143:136];
        5'd19: vec_data_18 = data_d1[151:144];
    default: vec_data_18= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_19_d1)
        5'd1: vec_data_19 = data_d1[7:0];
        5'd2: vec_data_19 = data_d1[15:8];
        5'd3: vec_data_19 = data_d1[23:16];
        5'd4: vec_data_19 = data_d1[31:24];
        5'd5: vec_data_19 = data_d1[39:32];
        5'd6: vec_data_19 = data_d1[47:40];
        5'd7: vec_data_19 = data_d1[55:48];
        5'd8: vec_data_19 = data_d1[63:56];
        5'd9: vec_data_19 = data_d1[71:64];
        5'd10: vec_data_19 = data_d1[79:72];
        5'd11: vec_data_19 = data_d1[87:80];
        5'd12: vec_data_19 = data_d1[95:88];
        5'd13: vec_data_19 = data_d1[103:96];
        5'd14: vec_data_19 = data_d1[111:104];
        5'd15: vec_data_19 = data_d1[119:112];
        5'd16: vec_data_19 = data_d1[127:120];
        5'd17: vec_data_19 = data_d1[135:128];
        5'd18: vec_data_19 = data_d1[143:136];
        5'd19: vec_data_19 = data_d1[151:144];
        5'd20: vec_data_19 = data_d1[159:152];
    default: vec_data_19= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_20_d1)
        5'd1: vec_data_20 = data_d1[7:0];
        5'd2: vec_data_20 = data_d1[15:8];
        5'd3: vec_data_20 = data_d1[23:16];
        5'd4: vec_data_20 = data_d1[31:24];
        5'd5: vec_data_20 = data_d1[39:32];
        5'd6: vec_data_20 = data_d1[47:40];
        5'd7: vec_data_20 = data_d1[55:48];
        5'd8: vec_data_20 = data_d1[63:56];
        5'd9: vec_data_20 = data_d1[71:64];
        5'd10: vec_data_20 = data_d1[79:72];
        5'd11: vec_data_20 = data_d1[87:80];
        5'd12: vec_data_20 = data_d1[95:88];
        5'd13: vec_data_20 = data_d1[103:96];
        5'd14: vec_data_20 = data_d1[111:104];
        5'd15: vec_data_20 = data_d1[119:112];
        5'd16: vec_data_20 = data_d1[127:120];
        5'd17: vec_data_20 = data_d1[135:128];
        5'd18: vec_data_20 = data_d1[143:136];
        5'd19: vec_data_20 = data_d1[151:144];
        5'd20: vec_data_20 = data_d1[159:152];
        5'd21: vec_data_20 = data_d1[167:160];
    default: vec_data_20= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_21_d1)
        5'd1: vec_data_21 = data_d1[7:0];
        5'd2: vec_data_21 = data_d1[15:8];
        5'd3: vec_data_21 = data_d1[23:16];
        5'd4: vec_data_21 = data_d1[31:24];
        5'd5: vec_data_21 = data_d1[39:32];
        5'd6: vec_data_21 = data_d1[47:40];
        5'd7: vec_data_21 = data_d1[55:48];
        5'd8: vec_data_21 = data_d1[63:56];
        5'd9: vec_data_21 = data_d1[71:64];
        5'd10: vec_data_21 = data_d1[79:72];
        5'd11: vec_data_21 = data_d1[87:80];
        5'd12: vec_data_21 = data_d1[95:88];
        5'd13: vec_data_21 = data_d1[103:96];
        5'd14: vec_data_21 = data_d1[111:104];
        5'd15: vec_data_21 = data_d1[119:112];
        5'd16: vec_data_21 = data_d1[127:120];
        5'd17: vec_data_21 = data_d1[135:128];
        5'd18: vec_data_21 = data_d1[143:136];
        5'd19: vec_data_21 = data_d1[151:144];
        5'd20: vec_data_21 = data_d1[159:152];
        5'd21: vec_data_21 = data_d1[167:160];
        5'd22: vec_data_21 = data_d1[175:168];
    default: vec_data_21= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_22_d1)
        5'd1: vec_data_22 = data_d1[7:0];
        5'd2: vec_data_22 = data_d1[15:8];
        5'd3: vec_data_22 = data_d1[23:16];
        5'd4: vec_data_22 = data_d1[31:24];
        5'd5: vec_data_22 = data_d1[39:32];
        5'd6: vec_data_22 = data_d1[47:40];
        5'd7: vec_data_22 = data_d1[55:48];
        5'd8: vec_data_22 = data_d1[63:56];
        5'd9: vec_data_22 = data_d1[71:64];
        5'd10: vec_data_22 = data_d1[79:72];
        5'd11: vec_data_22 = data_d1[87:80];
        5'd12: vec_data_22 = data_d1[95:88];
        5'd13: vec_data_22 = data_d1[103:96];
        5'd14: vec_data_22 = data_d1[111:104];
        5'd15: vec_data_22 = data_d1[119:112];
        5'd16: vec_data_22 = data_d1[127:120];
        5'd17: vec_data_22 = data_d1[135:128];
        5'd18: vec_data_22 = data_d1[143:136];
        5'd19: vec_data_22 = data_d1[151:144];
        5'd20: vec_data_22 = data_d1[159:152];
        5'd21: vec_data_22 = data_d1[167:160];
        5'd22: vec_data_22 = data_d1[175:168];
        5'd23: vec_data_22 = data_d1[183:176];
    default: vec_data_22= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_23_d1)
        5'd1: vec_data_23 = data_d1[7:0];
        5'd2: vec_data_23 = data_d1[15:8];
        5'd3: vec_data_23 = data_d1[23:16];
        5'd4: vec_data_23 = data_d1[31:24];
        5'd5: vec_data_23 = data_d1[39:32];
        5'd6: vec_data_23 = data_d1[47:40];
        5'd7: vec_data_23 = data_d1[55:48];
        5'd8: vec_data_23 = data_d1[63:56];
        5'd9: vec_data_23 = data_d1[71:64];
        5'd10: vec_data_23 = data_d1[79:72];
        5'd11: vec_data_23 = data_d1[87:80];
        5'd12: vec_data_23 = data_d1[95:88];
        5'd13: vec_data_23 = data_d1[103:96];
        5'd14: vec_data_23 = data_d1[111:104];
        5'd15: vec_data_23 = data_d1[119:112];
        5'd16: vec_data_23 = data_d1[127:120];
        5'd17: vec_data_23 = data_d1[135:128];
        5'd18: vec_data_23 = data_d1[143:136];
        5'd19: vec_data_23 = data_d1[151:144];
        5'd20: vec_data_23 = data_d1[159:152];
        5'd21: vec_data_23 = data_d1[167:160];
        5'd22: vec_data_23 = data_d1[175:168];
        5'd23: vec_data_23 = data_d1[183:176];
        5'd24: vec_data_23 = data_d1[191:184];
    default: vec_data_23= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_24_d1)
        5'd1: vec_data_24 = data_d1[7:0];
        5'd2: vec_data_24 = data_d1[15:8];
        5'd3: vec_data_24 = data_d1[23:16];
        5'd4: vec_data_24 = data_d1[31:24];
        5'd5: vec_data_24 = data_d1[39:32];
        5'd6: vec_data_24 = data_d1[47:40];
        5'd7: vec_data_24 = data_d1[55:48];
        5'd8: vec_data_24 = data_d1[63:56];
        5'd9: vec_data_24 = data_d1[71:64];
        5'd10: vec_data_24 = data_d1[79:72];
        5'd11: vec_data_24 = data_d1[87:80];
        5'd12: vec_data_24 = data_d1[95:88];
        5'd13: vec_data_24 = data_d1[103:96];
        5'd14: vec_data_24 = data_d1[111:104];
        5'd15: vec_data_24 = data_d1[119:112];
        5'd16: vec_data_24 = data_d1[127:120];
        5'd17: vec_data_24 = data_d1[135:128];
        5'd18: vec_data_24 = data_d1[143:136];
        5'd19: vec_data_24 = data_d1[151:144];
        5'd20: vec_data_24 = data_d1[159:152];
        5'd21: vec_data_24 = data_d1[167:160];
        5'd22: vec_data_24 = data_d1[175:168];
        5'd23: vec_data_24 = data_d1[183:176];
        5'd24: vec_data_24 = data_d1[191:184];
        5'd25: vec_data_24 = data_d1[199:192];
    default: vec_data_24= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_25_d1)
        5'd1: vec_data_25 = data_d1[7:0];
        5'd2: vec_data_25 = data_d1[15:8];
        5'd3: vec_data_25 = data_d1[23:16];
        5'd4: vec_data_25 = data_d1[31:24];
        5'd5: vec_data_25 = data_d1[39:32];
        5'd6: vec_data_25 = data_d1[47:40];
        5'd7: vec_data_25 = data_d1[55:48];
        5'd8: vec_data_25 = data_d1[63:56];
        5'd9: vec_data_25 = data_d1[71:64];
        5'd10: vec_data_25 = data_d1[79:72];
        5'd11: vec_data_25 = data_d1[87:80];
        5'd12: vec_data_25 = data_d1[95:88];
        5'd13: vec_data_25 = data_d1[103:96];
        5'd14: vec_data_25 = data_d1[111:104];
        5'd15: vec_data_25 = data_d1[119:112];
        5'd16: vec_data_25 = data_d1[127:120];
        5'd17: vec_data_25 = data_d1[135:128];
        5'd18: vec_data_25 = data_d1[143:136];
        5'd19: vec_data_25 = data_d1[151:144];
        5'd20: vec_data_25 = data_d1[159:152];
        5'd21: vec_data_25 = data_d1[167:160];
        5'd22: vec_data_25 = data_d1[175:168];
        5'd23: vec_data_25 = data_d1[183:176];
        5'd24: vec_data_25 = data_d1[191:184];
        5'd25: vec_data_25 = data_d1[199:192];
        5'd26: vec_data_25 = data_d1[207:200];
    default: vec_data_25= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_26_d1)
        5'd1: vec_data_26 = data_d1[7:0];
        5'd2: vec_data_26 = data_d1[15:8];
        5'd3: vec_data_26 = data_d1[23:16];
        5'd4: vec_data_26 = data_d1[31:24];
        5'd5: vec_data_26 = data_d1[39:32];
        5'd6: vec_data_26 = data_d1[47:40];
        5'd7: vec_data_26 = data_d1[55:48];
        5'd8: vec_data_26 = data_d1[63:56];
        5'd9: vec_data_26 = data_d1[71:64];
        5'd10: vec_data_26 = data_d1[79:72];
        5'd11: vec_data_26 = data_d1[87:80];
        5'd12: vec_data_26 = data_d1[95:88];
        5'd13: vec_data_26 = data_d1[103:96];
        5'd14: vec_data_26 = data_d1[111:104];
        5'd15: vec_data_26 = data_d1[119:112];
        5'd16: vec_data_26 = data_d1[127:120];
        5'd17: vec_data_26 = data_d1[135:128];
        5'd18: vec_data_26 = data_d1[143:136];
        5'd19: vec_data_26 = data_d1[151:144];
        5'd20: vec_data_26 = data_d1[159:152];
        5'd21: vec_data_26 = data_d1[167:160];
        5'd22: vec_data_26 = data_d1[175:168];
        5'd23: vec_data_26 = data_d1[183:176];
        5'd24: vec_data_26 = data_d1[191:184];
        5'd25: vec_data_26 = data_d1[199:192];
        5'd26: vec_data_26 = data_d1[207:200];
        5'd27: vec_data_26 = data_d1[215:208];
    default: vec_data_26= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_27_d1)
        5'd1: vec_data_27 = data_d1[7:0];
        5'd2: vec_data_27 = data_d1[15:8];
        5'd3: vec_data_27 = data_d1[23:16];
        5'd4: vec_data_27 = data_d1[31:24];
        5'd5: vec_data_27 = data_d1[39:32];
        5'd6: vec_data_27 = data_d1[47:40];
        5'd7: vec_data_27 = data_d1[55:48];
        5'd8: vec_data_27 = data_d1[63:56];
        5'd9: vec_data_27 = data_d1[71:64];
        5'd10: vec_data_27 = data_d1[79:72];
        5'd11: vec_data_27 = data_d1[87:80];
        5'd12: vec_data_27 = data_d1[95:88];
        5'd13: vec_data_27 = data_d1[103:96];
        5'd14: vec_data_27 = data_d1[111:104];
        5'd15: vec_data_27 = data_d1[119:112];
        5'd16: vec_data_27 = data_d1[127:120];
        5'd17: vec_data_27 = data_d1[135:128];
        5'd18: vec_data_27 = data_d1[143:136];
        5'd19: vec_data_27 = data_d1[151:144];
        5'd20: vec_data_27 = data_d1[159:152];
        5'd21: vec_data_27 = data_d1[167:160];
        5'd22: vec_data_27 = data_d1[175:168];
        5'd23: vec_data_27 = data_d1[183:176];
        5'd24: vec_data_27 = data_d1[191:184];
        5'd25: vec_data_27 = data_d1[199:192];
        5'd26: vec_data_27 = data_d1[207:200];
        5'd27: vec_data_27 = data_d1[215:208];
        5'd28: vec_data_27 = data_d1[223:216];
    default: vec_data_27= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_28_d1)
        5'd1: vec_data_28 = data_d1[7:0];
        5'd2: vec_data_28 = data_d1[15:8];
        5'd3: vec_data_28 = data_d1[23:16];
        5'd4: vec_data_28 = data_d1[31:24];
        5'd5: vec_data_28 = data_d1[39:32];
        5'd6: vec_data_28 = data_d1[47:40];
        5'd7: vec_data_28 = data_d1[55:48];
        5'd8: vec_data_28 = data_d1[63:56];
        5'd9: vec_data_28 = data_d1[71:64];
        5'd10: vec_data_28 = data_d1[79:72];
        5'd11: vec_data_28 = data_d1[87:80];
        5'd12: vec_data_28 = data_d1[95:88];
        5'd13: vec_data_28 = data_d1[103:96];
        5'd14: vec_data_28 = data_d1[111:104];
        5'd15: vec_data_28 = data_d1[119:112];
        5'd16: vec_data_28 = data_d1[127:120];
        5'd17: vec_data_28 = data_d1[135:128];
        5'd18: vec_data_28 = data_d1[143:136];
        5'd19: vec_data_28 = data_d1[151:144];
        5'd20: vec_data_28 = data_d1[159:152];
        5'd21: vec_data_28 = data_d1[167:160];
        5'd22: vec_data_28 = data_d1[175:168];
        5'd23: vec_data_28 = data_d1[183:176];
        5'd24: vec_data_28 = data_d1[191:184];
        5'd25: vec_data_28 = data_d1[199:192];
        5'd26: vec_data_28 = data_d1[207:200];
        5'd27: vec_data_28 = data_d1[215:208];
        5'd28: vec_data_28 = data_d1[223:216];
        5'd29: vec_data_28 = data_d1[231:224];
    default: vec_data_28= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_29_d1)
        5'd1: vec_data_29 = data_d1[7:0];
        5'd2: vec_data_29 = data_d1[15:8];
        5'd3: vec_data_29 = data_d1[23:16];
        5'd4: vec_data_29 = data_d1[31:24];
        5'd5: vec_data_29 = data_d1[39:32];
        5'd6: vec_data_29 = data_d1[47:40];
        5'd7: vec_data_29 = data_d1[55:48];
        5'd8: vec_data_29 = data_d1[63:56];
        5'd9: vec_data_29 = data_d1[71:64];
        5'd10: vec_data_29 = data_d1[79:72];
        5'd11: vec_data_29 = data_d1[87:80];
        5'd12: vec_data_29 = data_d1[95:88];
        5'd13: vec_data_29 = data_d1[103:96];
        5'd14: vec_data_29 = data_d1[111:104];
        5'd15: vec_data_29 = data_d1[119:112];
        5'd16: vec_data_29 = data_d1[127:120];
        5'd17: vec_data_29 = data_d1[135:128];
        5'd18: vec_data_29 = data_d1[143:136];
        5'd19: vec_data_29 = data_d1[151:144];
        5'd20: vec_data_29 = data_d1[159:152];
        5'd21: vec_data_29 = data_d1[167:160];
        5'd22: vec_data_29 = data_d1[175:168];
        5'd23: vec_data_29 = data_d1[183:176];
        5'd24: vec_data_29 = data_d1[191:184];
        5'd25: vec_data_29 = data_d1[199:192];
        5'd26: vec_data_29 = data_d1[207:200];
        5'd27: vec_data_29 = data_d1[215:208];
        5'd28: vec_data_29 = data_d1[223:216];
        5'd29: vec_data_29 = data_d1[231:224];
        5'd30: vec_data_29 = data_d1[239:232];
    default: vec_data_29= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_30_d1)
        5'd1: vec_data_30 = data_d1[7:0];
        5'd2: vec_data_30 = data_d1[15:8];
        5'd3: vec_data_30 = data_d1[23:16];
        5'd4: vec_data_30 = data_d1[31:24];
        5'd5: vec_data_30 = data_d1[39:32];
        5'd6: vec_data_30 = data_d1[47:40];
        5'd7: vec_data_30 = data_d1[55:48];
        5'd8: vec_data_30 = data_d1[63:56];
        5'd9: vec_data_30 = data_d1[71:64];
        5'd10: vec_data_30 = data_d1[79:72];
        5'd11: vec_data_30 = data_d1[87:80];
        5'd12: vec_data_30 = data_d1[95:88];
        5'd13: vec_data_30 = data_d1[103:96];
        5'd14: vec_data_30 = data_d1[111:104];
        5'd15: vec_data_30 = data_d1[119:112];
        5'd16: vec_data_30 = data_d1[127:120];
        5'd17: vec_data_30 = data_d1[135:128];
        5'd18: vec_data_30 = data_d1[143:136];
        5'd19: vec_data_30 = data_d1[151:144];
        5'd20: vec_data_30 = data_d1[159:152];
        5'd21: vec_data_30 = data_d1[167:160];
        5'd22: vec_data_30 = data_d1[175:168];
        5'd23: vec_data_30 = data_d1[183:176];
        5'd24: vec_data_30 = data_d1[191:184];
        5'd25: vec_data_30 = data_d1[199:192];
        5'd26: vec_data_30 = data_d1[207:200];
        5'd27: vec_data_30 = data_d1[215:208];
        5'd28: vec_data_30 = data_d1[223:216];
        5'd29: vec_data_30 = data_d1[231:224];
        5'd30: vec_data_30 = data_d1[239:232];
        5'd31: vec_data_30 = data_d1[247:240];
    default: vec_data_30= 8'b0;
    endcase
end

always @ (*) begin
    case(vec_sum_31_d1)
        6'd1: vec_data_31 = data_d1[7:0];
        6'd2: vec_data_31 = data_d1[15:8];
        6'd3: vec_data_31 = data_d1[23:16];
        6'd4: vec_data_31 = data_d1[31:24];
        6'd5: vec_data_31 = data_d1[39:32];
        6'd6: vec_data_31 = data_d1[47:40];
        6'd7: vec_data_31 = data_d1[55:48];
        6'd8: vec_data_31 = data_d1[63:56];
        6'd9: vec_data_31 = data_d1[71:64];
        6'd10: vec_data_31 = data_d1[79:72];
        6'd11: vec_data_31 = data_d1[87:80];
        6'd12: vec_data_31 = data_d1[95:88];
        6'd13: vec_data_31 = data_d1[103:96];
        6'd14: vec_data_31 = data_d1[111:104];
        6'd15: vec_data_31 = data_d1[119:112];
        6'd16: vec_data_31 = data_d1[127:120];
        6'd17: vec_data_31 = data_d1[135:128];
        6'd18: vec_data_31 = data_d1[143:136];
        6'd19: vec_data_31 = data_d1[151:144];
        6'd20: vec_data_31 = data_d1[159:152];
        6'd21: vec_data_31 = data_d1[167:160];
        6'd22: vec_data_31 = data_d1[175:168];
        6'd23: vec_data_31 = data_d1[183:176];
        6'd24: vec_data_31 = data_d1[191:184];
        6'd25: vec_data_31 = data_d1[199:192];
        6'd26: vec_data_31 = data_d1[207:200];
        6'd27: vec_data_31 = data_d1[215:208];
        6'd28: vec_data_31 = data_d1[223:216];
        6'd29: vec_data_31 = data_d1[231:224];
        6'd30: vec_data_31 = data_d1[239:232];
        6'd31: vec_data_31 = data_d1[247:240];
        6'd32: vec_data_31 = data_d1[255:248];
    default: vec_data_31= 8'b0;
    endcase
end



////////////////////////////////// phase II: registers //////////////////////////////////
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       valid_d2 <= 1'b0;
   end else begin
       valid_d2 <= valid_d1;
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sel_d2 <= 'b0;
   end else begin
       if ((valid_d1) == 1'b1) begin
           sel_d2 <= sel_d1;
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           sel_d2 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_00_d2 <= (vec_data_00 & {8{mask_d1[0]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_00_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_01_d2 <= (vec_data_01 & {8{mask_d1[1]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_01_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_02_d2 <= (vec_data_02 & {8{mask_d1[2]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_02_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_03_d2 <= (vec_data_03 & {8{mask_d1[3]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_03_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_04_d2 <= (vec_data_04 & {8{mask_d1[4]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_04_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_05_d2 <= (vec_data_05 & {8{mask_d1[5]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_05_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_06_d2 <= (vec_data_06 & {8{mask_d1[6]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_06_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_07_d2 <= (vec_data_07 & {8{mask_d1[7]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_07_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_08_d2 <= (vec_data_08 & {8{mask_d1[8]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_08_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_09_d2 <= (vec_data_09 & {8{mask_d1[9]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_09_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_10_d2 <= (vec_data_10 & {8{mask_d1[10]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_10_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_11_d2 <= (vec_data_11 & {8{mask_d1[11]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_11_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_12_d2 <= (vec_data_12 & {8{mask_d1[12]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_12_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_13_d2 <= (vec_data_13 & {8{mask_d1[13]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_13_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_14_d2 <= (vec_data_14 & {8{mask_d1[14]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_14_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_15_d2 <= (vec_data_15 & {8{mask_d1[15]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_15_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_16_d2 <= (vec_data_16 & {8{mask_d1[16]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_16_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_17_d2 <= (vec_data_17 & {8{mask_d1[17]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_17_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_18_d2 <= (vec_data_18 & {8{mask_d1[18]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_18_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_19_d2 <= (vec_data_19 & {8{mask_d1[19]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_19_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_20_d2 <= (vec_data_20 & {8{mask_d1[20]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_20_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_21_d2 <= (vec_data_21 & {8{mask_d1[21]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_21_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_22_d2 <= (vec_data_22 & {8{mask_d1[22]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_22_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_23_d2 <= (vec_data_23 & {8{mask_d1[23]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_23_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_24_d2 <= (vec_data_24 & {8{mask_d1[24]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_24_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_25_d2 <= (vec_data_25 & {8{mask_d1[25]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_25_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_26_d2 <= (vec_data_26 & {8{mask_d1[26]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_26_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_27_d2 <= (vec_data_27 & {8{mask_d1[27]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_27_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_28_d2 <= (vec_data_28 & {8{mask_d1[28]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_28_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_29_d2 <= (vec_data_29 & {8{mask_d1[29]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_29_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_30_d2 <= (vec_data_30 & {8{mask_d1[30]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_30_d2 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d1) == 1'b1) begin
           vec_data_31_d2 <= (vec_data_31 & {8{mask_d1[31]}});
       // VCS coverage off
       end else if ((valid_d1) == 1'b0) begin
       end else begin
           vec_data_31_d2 <= 'bx;
       // VCS coverage on
       end
end


////////////////////////////////// phase III: registers //////////////////////////////////
assign mask_d2_int8_w[0] = (|vec_data_00_d2);
assign mask_d2_int8_w[1] = (|vec_data_01_d2);
assign mask_d2_int8_w[2] = (|vec_data_02_d2);
assign mask_d2_int8_w[3] = (|vec_data_03_d2);
assign mask_d2_int8_w[4] = (|vec_data_04_d2);
assign mask_d2_int8_w[5] = (|vec_data_05_d2);
assign mask_d2_int8_w[6] = (|vec_data_06_d2);
assign mask_d2_int8_w[7] = (|vec_data_07_d2);
assign mask_d2_int8_w[8] = (|vec_data_08_d2);
assign mask_d2_int8_w[9] = (|vec_data_09_d2);
assign mask_d2_int8_w[10] = (|vec_data_10_d2);
assign mask_d2_int8_w[11] = (|vec_data_11_d2);
assign mask_d2_int8_w[12] = (|vec_data_12_d2);
assign mask_d2_int8_w[13] = (|vec_data_13_d2);
assign mask_d2_int8_w[14] = (|vec_data_14_d2);
assign mask_d2_int8_w[15] = (|vec_data_15_d2);
assign mask_d2_int8_w[16] = (|vec_data_16_d2);
assign mask_d2_int8_w[17] = (|vec_data_17_d2);
assign mask_d2_int8_w[18] = (|vec_data_18_d2);
assign mask_d2_int8_w[19] = (|vec_data_19_d2);
assign mask_d2_int8_w[20] = (|vec_data_20_d2);
assign mask_d2_int8_w[21] = (|vec_data_21_d2);
assign mask_d2_int8_w[22] = (|vec_data_22_d2);
assign mask_d2_int8_w[23] = (|vec_data_23_d2);
assign mask_d2_int8_w[24] = (|vec_data_24_d2);
assign mask_d2_int8_w[25] = (|vec_data_25_d2);
assign mask_d2_int8_w[26] = (|vec_data_26_d2);
assign mask_d2_int8_w[27] = (|vec_data_27_d2);
assign mask_d2_int8_w[28] = (|vec_data_28_d2);
assign mask_d2_int8_w[29] = (|vec_data_29_d2);
assign mask_d2_int8_w[30] = (|vec_data_30_d2);
assign mask_d2_int8_w[31] = (|vec_data_31_d2);



assign mask_d2_w = mask_d2_int8_w ;
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       valid_d3 <= 1'b0;
   end else begin
       valid_d3 <= valid_d2;
   end
end
always @(posedge nvdla_core_clk) begin
       if ((valid_d2) == 1'b1) begin
           mask_d3 <= mask_d2_w;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           mask_d3 <= 'bx;
       // VCS coverage on
       end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       sel_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           sel_d3 <= sel_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           sel_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_00_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_00_d3 <= vec_data_00_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_00_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_01_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_01_d3 <= vec_data_01_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_01_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_02_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_02_d3 <= vec_data_02_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_02_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_03_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_03_d3 <= vec_data_03_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_03_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_04_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_04_d3 <= vec_data_04_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_04_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_05_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_05_d3 <= vec_data_05_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_05_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_06_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_06_d3 <= vec_data_06_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_06_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_07_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_07_d3 <= vec_data_07_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_07_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_08_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_08_d3 <= vec_data_08_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_08_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_09_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_09_d3 <= vec_data_09_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_09_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_10_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_10_d3 <= vec_data_10_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_10_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_11_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_11_d3 <= vec_data_11_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_11_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_12_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_12_d3 <= vec_data_12_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_12_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_13_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_13_d3 <= vec_data_13_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_13_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_14_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_14_d3 <= vec_data_14_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_14_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_15_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_15_d3 <= vec_data_15_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_15_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_16_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_16_d3 <= vec_data_16_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_16_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_17_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_17_d3 <= vec_data_17_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_17_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_18_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_18_d3 <= vec_data_18_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_18_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_19_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_19_d3 <= vec_data_19_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_19_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_20_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_20_d3 <= vec_data_20_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_20_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_21_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_21_d3 <= vec_data_21_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_21_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_22_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_22_d3 <= vec_data_22_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_22_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_23_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_23_d3 <= vec_data_23_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_23_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_24_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_24_d3 <= vec_data_24_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_24_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_25_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_25_d3 <= vec_data_25_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_25_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_26_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_26_d3 <= vec_data_26_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_26_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_27_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_27_d3 <= vec_data_27_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_27_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_28_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_28_d3 <= vec_data_28_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_28_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_29_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_29_d3 <= vec_data_29_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_29_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_30_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_30_d3 <= vec_data_30_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_30_d3 <= 'bx;
       // VCS coverage on
       end
   end
end
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       vec_data_31_d3 <= 'b0;
   end else begin
       if ((valid_d2) == 1'b1) begin
           vec_data_31_d3 <= vec_data_31_d2;
       // VCS coverage off
       end else if ((valid_d2) == 1'b0) begin
       end else begin
           vec_data_31_d3 <= 'bx;
       // VCS coverage on
       end
   end
end


////////////////////////////////// output: rename //////////////////////////////////
assign output_pvld = valid_d3;
assign output_mask = mask_d3;
assign output_sel = sel_d3;
assign output_data0 = vec_data_00_d3;
assign output_data1 = vec_data_01_d3;
assign output_data2 = vec_data_02_d3;
assign output_data3 = vec_data_03_d3;
assign output_data4 = vec_data_04_d3;
assign output_data5 = vec_data_05_d3;
assign output_data6 = vec_data_06_d3;
assign output_data7 = vec_data_07_d3;
assign output_data8 = vec_data_08_d3;
assign output_data9 = vec_data_09_d3;
assign output_data10 = vec_data_10_d3;
assign output_data11 = vec_data_11_d3;
assign output_data12 = vec_data_12_d3;
assign output_data13 = vec_data_13_d3;
assign output_data14 = vec_data_14_d3;
assign output_data15 = vec_data_15_d3;
assign output_data16 = vec_data_16_d3;
assign output_data17 = vec_data_17_d3;
assign output_data18 = vec_data_18_d3;
assign output_data19 = vec_data_19_d3;
assign output_data20 = vec_data_20_d3;
assign output_data21 = vec_data_21_d3;
assign output_data22 = vec_data_22_d3;
assign output_data23 = vec_data_23_d3;
assign output_data24 = vec_data_24_d3;
assign output_data25 = vec_data_25_d3;
assign output_data26 = vec_data_26_d3;
assign output_data27 = vec_data_27_d3;
assign output_data28 = vec_data_28_d3;
assign output_data29 = vec_data_29_d3;
assign output_data30 = vec_data_30_d3;
assign output_data31 = vec_data_31_d3;



//| eperl: generated_end (DO NOT EDIT ABOVE)
endmodule // NV_NVDLA_CSC_WL_dec
