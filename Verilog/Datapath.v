module RegisterFile(
  input        clock,
  input        io_regWe,
  input  [7:0] io_writeData,
  output [7:0] io_readVal
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] regFile [0:31]; // @[RegisterFile.scala 12:20]
  wire [7:0] regFile_MPORT_data; // @[RegisterFile.scala 12:20]
  wire [4:0] regFile_MPORT_addr; // @[RegisterFile.scala 12:20]
  wire [7:0] regFile_MPORT_1_data; // @[RegisterFile.scala 12:20]
  wire [4:0] regFile_MPORT_1_addr; // @[RegisterFile.scala 12:20]
  wire  regFile_MPORT_1_mask; // @[RegisterFile.scala 12:20]
  wire  regFile_MPORT_1_en; // @[RegisterFile.scala 12:20]
  assign regFile_MPORT_addr = 5'h0;
  assign regFile_MPORT_data = regFile[regFile_MPORT_addr]; // @[RegisterFile.scala 12:20]
  assign regFile_MPORT_1_data = io_writeData;
  assign regFile_MPORT_1_addr = 5'h0;
  assign regFile_MPORT_1_mask = 1'h1;
  assign regFile_MPORT_1_en = io_regWe;
  assign io_readVal = regFile_MPORT_data; // @[RegisterFile.scala 13:14]
  always @(posedge clock) begin
    if(regFile_MPORT_1_en & regFile_MPORT_1_mask) begin
      regFile[regFile_MPORT_1_addr] <= regFile_MPORT_1_data; // @[RegisterFile.scala 12:20]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regFile[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ALU(
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
module Accumulator(
  input        clock,
  input        reset,
  input  [7:0] io_aluIn,
  output [7:0] io_accOut,
  output       io_zero
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] acc; // @[Accumulator.scala 11:20]
  assign io_accOut = acc; // @[Accumulator.scala 13:13]
  assign io_zero = acc == 8'h0; // @[Accumulator.scala 14:18]
  always @(posedge clock) begin
    if (reset) begin // @[Accumulator.scala 11:20]
      acc <= 8'h0; // @[Accumulator.scala 11:20]
    end else begin
      acc <= io_aluIn; // @[Accumulator.scala 12:7]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  acc = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AddressRegister(
  input        clock,
  input        reset,
  input        io_arEn,
  input  [7:0] io_acc,
  output [7:0] io_arOut
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] ar; // @[AddressRegister.scala 11:19]
  assign io_arOut = ar; // @[AddressRegister.scala 15:12]
  always @(posedge clock) begin
    if (reset) begin // @[AddressRegister.scala 11:19]
      ar <= 8'h0; // @[AddressRegister.scala 11:19]
    end else if (io_arEn) begin // @[AddressRegister.scala 12:17]
      ar <= io_acc; // @[AddressRegister.scala 13:8]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  ar = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MemoryUnit(
  input        clock,
  input  [7:0] io_adr,
  input        io_memWe,
  input  [7:0] io_writeData,
  output [7:0] io_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem [0:255]; // @[MemoryUnit.scala 15:24]
  wire [7:0] mem_MPORT_1_data; // @[MemoryUnit.scala 15:24]
  wire [7:0] mem_MPORT_1_addr; // @[MemoryUnit.scala 15:24]
  wire [7:0] mem_MPORT_data; // @[MemoryUnit.scala 15:24]
  wire [7:0] mem_MPORT_addr; // @[MemoryUnit.scala 15:24]
  wire  mem_MPORT_mask; // @[MemoryUnit.scala 15:24]
  wire  mem_MPORT_en; // @[MemoryUnit.scala 15:24]
  reg  mem_MPORT_1_en_pipe_0;
  reg [7:0] mem_MPORT_1_addr_pipe_0;
  assign mem_MPORT_1_addr = mem_MPORT_1_addr_pipe_0;
  assign mem_MPORT_1_data = mem[mem_MPORT_1_addr]; // @[MemoryUnit.scala 15:24]
  assign mem_MPORT_data = io_writeData;
  assign mem_MPORT_addr = io_adr;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_memWe;
  assign io_data = mem_MPORT_1_data; // @[MemoryUnit.scala 22:11]
  always @(posedge clock) begin
    if(mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[MemoryUnit.scala 15:24]
    end
    mem_MPORT_1_en_pipe_0 <= ~io_memWe;
    if (~io_memWe) begin
      mem_MPORT_1_addr_pipe_0 <= io_adr;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_MPORT_1_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_MPORT_1_addr_pipe_0 = _RAND_2[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Datapath(
  input         clock,
  input         reset,
  input         io_pcSel,
  input         io_pcAdrSel,
  input         io_regWe,
  input         io_srcBSel,
  input  [3:0]  io_aluOp,
  input         io_arEn,
  input         io_memWe,
  input         io_regWsel,
  input  [15:0] io_instr,
  input         io_instrWrite,
  output        io_zero,
  output [15:0] io_instrOut
);
  wire  regFile_clock; // @[Datapath.scala 24:23]
  wire  regFile_io_regWe; // @[Datapath.scala 24:23]
  wire [7:0] regFile_io_writeData; // @[Datapath.scala 24:23]
  wire [7:0] regFile_io_readVal; // @[Datapath.scala 24:23]
  wire [3:0] alu_io_aluOp; // @[Datapath.scala 25:19]
  wire [7:0] alu_io_a; // @[Datapath.scala 25:19]
  wire [7:0] alu_io_b; // @[Datapath.scala 25:19]
  wire [7:0] alu_io_result; // @[Datapath.scala 25:19]
  wire  acc_clock; // @[Datapath.scala 26:19]
  wire  acc_reset; // @[Datapath.scala 26:19]
  wire [7:0] acc_io_aluIn; // @[Datapath.scala 26:19]
  wire [7:0] acc_io_accOut; // @[Datapath.scala 26:19]
  wire  acc_io_zero; // @[Datapath.scala 26:19]
  wire  ar_clock; // @[Datapath.scala 27:18]
  wire  ar_reset; // @[Datapath.scala 27:18]
  wire  ar_io_arEn; // @[Datapath.scala 27:18]
  wire [7:0] ar_io_acc; // @[Datapath.scala 27:18]
  wire [7:0] ar_io_arOut; // @[Datapath.scala 27:18]
  wire  mem_clock; // @[Datapath.scala 28:19]
  wire [7:0] mem_io_adr; // @[Datapath.scala 28:19]
  wire  mem_io_memWe; // @[Datapath.scala 28:19]
  wire [7:0] mem_io_writeData; // @[Datapath.scala 28:19]
  wire [7:0] mem_io_data; // @[Datapath.scala 28:19]
  wire [9:0] _T_7 = {{2'd0}, ar_io_arOut}; // @[Datapath.scala 54:30]
  RegisterFile regFile ( // @[Datapath.scala 24:23]
    .clock(regFile_clock),
    .io_regWe(regFile_io_regWe),
    .io_writeData(regFile_io_writeData),
    .io_readVal(regFile_io_readVal)
  );
  ALU alu ( // @[Datapath.scala 25:19]
    .io_aluOp(alu_io_aluOp),
    .io_a(alu_io_a),
    .io_b(alu_io_b),
    .io_result(alu_io_result)
  );
  Accumulator acc ( // @[Datapath.scala 26:19]
    .clock(acc_clock),
    .reset(acc_reset),
    .io_aluIn(acc_io_aluIn),
    .io_accOut(acc_io_accOut),
    .io_zero(acc_io_zero)
  );
  AddressRegister ar ( // @[Datapath.scala 27:18]
    .clock(ar_clock),
    .reset(ar_reset),
    .io_arEn(ar_io_arEn),
    .io_acc(ar_io_acc),
    .io_arOut(ar_io_arOut)
  );
  MemoryUnit mem ( // @[Datapath.scala 28:19]
    .clock(mem_clock),
    .io_adr(mem_io_adr),
    .io_memWe(mem_io_memWe),
    .io_writeData(mem_io_writeData),
    .io_data(mem_io_data)
  );
  assign io_zero = acc_io_zero; // @[Datapath.scala 58:11]
  assign io_instrOut = 16'h2000; // @[Datapath.scala 59:15]
  assign regFile_clock = clock;
  assign regFile_io_regWe = io_regWe; // @[Datapath.scala 42:20]
  assign regFile_io_writeData = io_regWsel ? acc_io_accOut : mem_io_data; // @[Datapath.scala 43:30]
  assign alu_io_aluOp = io_aluOp; // @[Datapath.scala 45:16]
  assign alu_io_a = acc_io_accOut; // @[Datapath.scala 46:12]
  assign alu_io_b = io_srcBSel ? 8'h0 : regFile_io_readVal; // @[Datapath.scala 47:18]
  assign acc_clock = clock;
  assign acc_reset = reset;
  assign acc_io_aluIn = alu_io_result; // @[Datapath.scala 49:16]
  assign ar_clock = clock;
  assign ar_reset = reset;
  assign ar_io_arEn = io_arEn; // @[Datapath.scala 51:14]
  assign ar_io_acc = acc_io_accOut; // @[Datapath.scala 52:13]
  assign mem_clock = clock;
  assign mem_io_adr = _T_7[7:0]; // @[Datapath.scala 54:14]
  assign mem_io_memWe = io_memWe; // @[Datapath.scala 55:16]
  assign mem_io_writeData = acc_io_accOut; // @[Datapath.scala 56:20]
endmodule
