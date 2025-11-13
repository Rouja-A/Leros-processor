module RegisterFile(
  input        clock,
  input        reset,
  input  [4:0] io_adr,
  input        io_regWe,
  input  [7:0] io_writeData,
  output [7:0] io_readVal
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] regFile [0:255]; // @[RegisterFile.scala 13:20]
  wire [7:0] regFile_MPORT_data; // @[RegisterFile.scala 13:20]
  wire [7:0] regFile_MPORT_addr; // @[RegisterFile.scala 13:20]
  wire [7:0] regFile_MPORT_1_data; // @[RegisterFile.scala 13:20]
  wire [7:0] regFile_MPORT_1_addr; // @[RegisterFile.scala 13:20]
  wire  regFile_MPORT_1_mask; // @[RegisterFile.scala 13:20]
  wire  regFile_MPORT_1_en; // @[RegisterFile.scala 13:20]
  assign regFile_MPORT_addr = {{3'd0}, io_adr};
  assign regFile_MPORT_data = regFile[regFile_MPORT_addr]; // @[RegisterFile.scala 13:20]
  assign regFile_MPORT_1_data = io_writeData;
  assign regFile_MPORT_1_addr = {{3'd0}, io_adr};
  assign regFile_MPORT_1_mask = 1'h1;
  assign regFile_MPORT_1_en = io_regWe;
  assign io_readVal = regFile_MPORT_data; // @[RegisterFile.scala 15:14]
  always @(posedge clock) begin
    if(regFile_MPORT_1_en & regFile_MPORT_1_mask) begin
      regFile[regFile_MPORT_1_addr] <= regFile_MPORT_1_data; // @[RegisterFile.scala 13:20]
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
    regFile[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
