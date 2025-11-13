module Controller(
  input         clock,
  input         reset,
  input  [15:0] io_instr,
  input         io_zero,
  output        io_pcSel,
  output        io_pcAdrSel,
  output        io_regWe,
  output        io_srcBSel,
  output [3:0]  io_aluOp,
  output        io_arEn,
  output        io_memWe,
  output        io_regWsel,
  output        io_instrWrite
);
  wire [7:0] opcode = io_instr[15:8]; // @[Controller.scala 21:24]
  wire [7:0] _T_1 = opcode & 8'hfe; // @[Controller.scala 35:16]
  wire  _T_5 = ~opcode[0]; // @[Controller.scala 36:20]
  wire  _GEN_0 = ~opcode[0] ? 1'h0 : 1'h1; // @[Controller.scala 36:29 Controller.scala 36:40 Controller.scala 37:29]
  wire  _GEN_1 = _T_1 == 8'h8 & _GEN_0; // @[Controller.scala 35:68 Controller.scala 28:12]
  wire [1:0] _GEN_2 = _T_5 ? 2'h2 : 2'h3; // @[Controller.scala 40:29 Controller.scala 40:40 Controller.scala 41:29]
  wire  _GEN_3 = _T_5 ? _GEN_1 : 1'h1; // @[Controller.scala 40:29 Controller.scala 41:48]
  wire [1:0] _GEN_4 = _T_1 == 8'hc ? _GEN_2 : {{1'd0}, _GEN_1}; // @[Controller.scala 39:68]
  wire  _GEN_5 = _T_1 == 8'hc ? _GEN_3 : _GEN_1; // @[Controller.scala 39:68]
  wire [7:0] _T_11 = opcode & 8'hf8; // @[Controller.scala 43:16]
  wire [2:0] _GEN_6 = _T_11 == 8'h10 ? 3'h4 : {{1'd0}, _GEN_4}; // @[Controller.scala 43:68 Controller.scala 44:14]
  wire [2:0] _GEN_7 = opcode == 8'h22 ? 3'h5 : _GEN_6; // @[Controller.scala 46:32 Controller.scala 47:14]
  wire [2:0] _GEN_8 = opcode[0] ? 3'h6 : _GEN_7; // @[Controller.scala 50:29 Controller.scala 50:40]
  wire  _GEN_9 = opcode[0] | _GEN_5; // @[Controller.scala 50:29 Controller.scala 50:59]
  wire [2:0] _GEN_10 = _T_1 == 8'h22 ? _GEN_8 : _GEN_7; // @[Controller.scala 49:68]
  wire  _GEN_11 = _T_1 == 8'h22 ? _GEN_9 : _GEN_5; // @[Controller.scala 49:68]
  wire [2:0] _GEN_12 = opcode == 8'h24 ? 3'h7 : _GEN_10; // @[Controller.scala 52:31 Controller.scala 53:14]
  wire [3:0] _GEN_13 = opcode[0] ? 4'h8 : {{1'd0}, _GEN_12}; // @[Controller.scala 56:29 Controller.scala 56:40]
  wire  _GEN_14 = opcode[0] | _GEN_11; // @[Controller.scala 56:29 Controller.scala 56:59]
  wire [3:0] _GEN_15 = _T_1 == 8'h24 ? _GEN_13 : {{1'd0}, _GEN_12}; // @[Controller.scala 55:67]
  wire  _GEN_16 = _T_1 == 8'h24 ? _GEN_14 : _GEN_11; // @[Controller.scala 55:67]
  wire [3:0] _GEN_17 = opcode == 8'h26 ? 4'h9 : _GEN_15; // @[Controller.scala 58:32 Controller.scala 59:14]
  wire [3:0] _GEN_18 = opcode[0] ? 4'ha : _GEN_17; // @[Controller.scala 62:29 Controller.scala 62:40]
  wire  _GEN_19 = opcode[0] | _GEN_16; // @[Controller.scala 62:29 Controller.scala 62:60]
  wire  _GEN_21 = _T_1 == 8'h26 ? _GEN_19 : _GEN_16; // @[Controller.scala 61:68]
  wire  _T_32 = opcode == 8'h20; // @[Controller.scala 64:15]
  wire  _GEN_24 = opcode[0] | _T_32; // @[Controller.scala 68:29 Controller.scala 68:40]
  wire  _GEN_26 = opcode[0] | _GEN_21; // @[Controller.scala 68:29 Controller.scala 68:85]
  wire  _GEN_27 = _T_1 == 8'h20 ? _GEN_24 : _T_32; // @[Controller.scala 67:67]
  wire  _T_40 = _T_11 == 8'h30; // @[Controller.scala 70:33]
  wire  _GEN_30 = _T_11 == 8'h30 | _GEN_27; // @[Controller.scala 70:68 Controller.scala 71:14]
  wire  _T_43 = _T_11 == 8'h40; // @[Controller.scala 73:33]
  wire  _GEN_33 = _T_11 == 8'h40 | _GEN_30; // @[Controller.scala 73:68 Controller.scala 74:57]
  wire  _GEN_34 = _T_11 == 8'h40 ? 1'h0 : _T_40; // @[Controller.scala 73:68 Controller.scala 74:79]
  wire [7:0] _T_47 = opcode & 8'hfc; // @[Controller.scala 79:16]
  wire [7:0] _T_53 = opcode & 8'hf0; // @[Controller.scala 85:16]
  wire  _GEN_39 = _T_53 == 8'h80 | _T_43; // @[Controller.scala 85:67 Controller.scala 86:14]
  wire  _GEN_40 = _T_53 == 8'h80 ? 1'h0 : _T_43; // @[Controller.scala 85:67 Controller.scala 86:37]
  assign io_pcSel = _T_53 == 8'h90 ? io_zero : _GEN_39; // @[Controller.scala 88:68 Controller.scala 89:14]
  assign io_pcAdrSel = _T_53 == 8'h90 ? 1'h0 : _GEN_40; // @[Controller.scala 88:68 Controller.scala 89:38]
  assign io_regWe = _T_47 == 8'h60 | _GEN_33; // @[Controller.scala 79:70 Controller.scala 80:14]
  assign io_srcBSel = _T_1 == 8'h20 ? _GEN_26 : _GEN_21; // @[Controller.scala 67:67]
  assign io_aluOp = _T_1 == 8'h26 ? _GEN_18 : _GEN_17; // @[Controller.scala 61:68]
  assign io_arEn = _T_11 == 8'h50; // @[Controller.scala 76:33]
  assign io_memWe = _T_47 == 8'h70; // @[Controller.scala 82:33]
  assign io_regWsel = _T_47 == 8'h60 | _GEN_34; // @[Controller.scala 79:70 Controller.scala 80:36]
  assign io_instrWrite = 1'h1; // @[Controller.scala 32:17]
endmodule
