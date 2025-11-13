module RegisterFile(
  input        clock,
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
  assign regFile_MPORT_1_en = 1'h1;
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
  input  [7:0] io_a,
  input  [7:0] io_b,
  output [7:0] io_result
);
  assign io_result = io_a + io_b; // @[ALU.scala 14:33]
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
module MemoryUnit(
  input        clock,
  input  [7:0] io_writeData,
  output [7:0] io_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:255]; // @[MemoryUnit.scala 15:24]
  wire [7:0] mem_MPORT_1_data; // @[MemoryUnit.scala 15:24]
  wire [7:0] mem_MPORT_1_addr; // @[MemoryUnit.scala 15:24]
  wire [7:0] mem_MPORT_data; // @[MemoryUnit.scala 15:24]
  wire [7:0] mem_MPORT_addr; // @[MemoryUnit.scala 15:24]
  wire  mem_MPORT_mask; // @[MemoryUnit.scala 15:24]
  wire  mem_MPORT_en; // @[MemoryUnit.scala 15:24]
  assign mem_MPORT_1_addr = 8'h0;
  assign mem_MPORT_1_data = mem[mem_MPORT_1_addr]; // @[MemoryUnit.scala 15:24]
  assign mem_MPORT_data = io_writeData;
  assign mem_MPORT_addr = 8'h0;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = 1'h0;
  assign io_data = mem_MPORT_1_data; // @[MemoryUnit.scala 22:11]
  always @(posedge clock) begin
    if(mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[MemoryUnit.scala 15:24]
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
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Datapath(
  input   clock,
  input   reset,
  output  io_zero
);
  wire  regFile_clock; // @[Datapath.scala 22:23]
  wire [7:0] regFile_io_writeData; // @[Datapath.scala 22:23]
  wire [7:0] regFile_io_readVal; // @[Datapath.scala 22:23]
  wire [7:0] alu_io_a; // @[Datapath.scala 23:19]
  wire [7:0] alu_io_b; // @[Datapath.scala 23:19]
  wire [7:0] alu_io_result; // @[Datapath.scala 23:19]
  wire  acc_clock; // @[Datapath.scala 24:19]
  wire  acc_reset; // @[Datapath.scala 24:19]
  wire [7:0] acc_io_aluIn; // @[Datapath.scala 24:19]
  wire [7:0] acc_io_accOut; // @[Datapath.scala 24:19]
  wire  acc_io_zero; // @[Datapath.scala 24:19]
  wire  mem_clock; // @[Datapath.scala 26:19]
  wire [7:0] mem_io_writeData; // @[Datapath.scala 26:19]
  wire [7:0] mem_io_data; // @[Datapath.scala 26:19]
  RegisterFile regFile ( // @[Datapath.scala 22:23]
    .clock(regFile_clock),
    .io_writeData(regFile_io_writeData),
    .io_readVal(regFile_io_readVal)
  );
  ALU alu ( // @[Datapath.scala 23:19]
    .io_a(alu_io_a),
    .io_b(alu_io_b),
    .io_result(alu_io_result)
  );
  Accumulator acc ( // @[Datapath.scala 24:19]
    .clock(acc_clock),
    .reset(acc_reset),
    .io_aluIn(acc_io_aluIn),
    .io_accOut(acc_io_accOut),
    .io_zero(acc_io_zero)
  );
  MemoryUnit mem ( // @[Datapath.scala 26:19]
    .clock(mem_clock),
    .io_writeData(mem_io_writeData),
    .io_data(mem_io_data)
  );
  assign io_zero = acc_io_zero; // @[Datapath.scala 56:11]
  assign regFile_clock = clock;
  assign regFile_io_writeData = mem_io_data; // @[Datapath.scala 41:30]
  assign alu_io_a = acc_io_accOut; // @[Datapath.scala 44:12]
  assign alu_io_b = regFile_io_readVal; // @[Datapath.scala 45:18]
  assign acc_clock = clock;
  assign acc_reset = reset;
  assign acc_io_aluIn = alu_io_result; // @[Datapath.scala 47:16]
  assign mem_clock = clock;
  assign mem_io_writeData = acc_io_accOut; // @[Datapath.scala 54:20]
endmodule
module LerosProcessor(
  input   clock,
  input   reset,
  output  io_zero
);
  wire  datapath_clock; // @[LerosProcessor.scala 10:24]
  wire  datapath_reset; // @[LerosProcessor.scala 10:24]
  wire  datapath_io_zero; // @[LerosProcessor.scala 10:24]
  Datapath datapath ( // @[LerosProcessor.scala 10:24]
    .clock(datapath_clock),
    .reset(datapath_reset),
    .io_zero(datapath_io_zero)
  );
  assign io_zero = datapath_io_zero; // @[LerosProcessor.scala 25:11]
  assign datapath_clock = clock;
  assign datapath_reset = reset;
endmodule
