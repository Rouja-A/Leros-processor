module ALU(
  input        clock,
  input        reset,
  input  [3:0] io_aluOp,
  input  [7:0] io_a,
  input  [7:0] io_b,
  output [7:0] io_result
);
  wire  _T = io_aluOp == 4'h0; // @[ALU.scala 14:15]
  wire [7:0] _T_2 = io_a + io_b; // @[ALU.scala 14:33]
  wire  _T_3 = io_aluOp == 4'h1; // @[ALU.scala 15:15]
  wire  _T_6 = io_aluOp == 4'h2; // @[ALU.scala 16:15]
  wire [7:0] _T_8 = io_a - io_b; // @[ALU.scala 16:33]
  wire  _T_9 = io_aluOp == 4'h3; // @[ALU.scala 17:15]
  wire  _T_12 = io_aluOp == 4'h4; // @[ALU.scala 18:15]
  wire [7:0] _T_13 = {{1'd0}, io_a[7:1]}; // @[ALU.scala 18:33]
  wire  _T_14 = io_aluOp == 4'h5; // @[ALU.scala 19:15]
  wire [7:0] _T_15 = io_a & io_b; // @[ALU.scala 19:33]
  wire  _T_16 = io_aluOp == 4'h6; // @[ALU.scala 20:15]
  wire  _T_18 = io_aluOp == 4'h7; // @[ALU.scala 21:15]
  wire [7:0] _T_19 = io_a | io_b; // @[ALU.scala 21:33]
  wire  _T_20 = io_aluOp == 4'h8; // @[ALU.scala 22:15]
  wire  _T_22 = io_aluOp == 4'h9; // @[ALU.scala 23:15]
  wire [7:0] _T_23 = io_a ^ io_b; // @[ALU.scala 23:33]
  wire  _T_24 = io_aluOp == 4'ha; // @[ALU.scala 24:15]
  wire [7:0] _T_26 = _T_24 ? _T_23 : 8'h0; // @[Mux.scala 98:16]
  wire [7:0] _T_27 = _T_22 ? _T_23 : _T_26; // @[Mux.scala 98:16]
  wire [7:0] _T_28 = _T_20 ? _T_19 : _T_27; // @[Mux.scala 98:16]
  wire [7:0] _T_29 = _T_18 ? _T_19 : _T_28; // @[Mux.scala 98:16]
  wire [7:0] _T_30 = _T_16 ? _T_15 : _T_29; // @[Mux.scala 98:16]
  wire [7:0] _T_31 = _T_14 ? _T_15 : _T_30; // @[Mux.scala 98:16]
  wire [7:0] _T_32 = _T_12 ? _T_13 : _T_31; // @[Mux.scala 98:16]
  wire [7:0] _T_33 = _T_9 ? _T_8 : _T_32; // @[Mux.scala 98:16]
  wire [7:0] _T_34 = _T_6 ? _T_8 : _T_33; // @[Mux.scala 98:16]
  wire [7:0] _T_35 = _T_3 ? _T_2 : _T_34; // @[Mux.scala 98:16]
  assign io_result = _T ? _T_2 : _T_35; // @[Mux.scala 98:16]
endmodule
