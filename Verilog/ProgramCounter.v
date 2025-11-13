module ProgramCounter(
  input         clock,
  input         reset,
  input         io_pcWrite,
  input         io_pcSel,
  input         io_pcAdrSel,
  input  [7:0]  io_imm,
  input  [7:0]  io_acc,
  output [15:0] io_pcOut,
  output [7:0]  io_pcPlus2
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] pc; // @[ProgramCounter.scala 16:19]
  wire [15:0] _T_1 = pc + 16'h2; // @[ProgramCounter.scala 19:21]
  wire [15:0] _GEN_1 = {{8{io_imm[7]}},io_imm}; // @[ProgramCounter.scala 21:61]
  wire [15:0] _T_7 = $signed(pc) + $signed(_GEN_1); // @[ProgramCounter.scala 21:71]
  assign io_pcOut = pc; // @[ProgramCounter.scala 17:12]
  assign io_pcPlus2 = _T_1[7:0]; // @[ProgramCounter.scala 19:27]
  always @(posedge clock) begin
    if (reset) begin // @[ProgramCounter.scala 16:19]
      pc <= 16'h0; // @[ProgramCounter.scala 16:19]
    end else if (io_pcWrite) begin // @[ProgramCounter.scala 20:20]
      if (io_pcSel) begin // @[ProgramCounter.scala 21:14]
        if (io_pcAdrSel) begin // @[ProgramCounter.scala 21:28]
          pc <= {{8'd0}, io_acc};
        end else begin
          pc <= _T_7;
        end
      end else begin
        pc <= _T_1;
      end
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
  pc = _RAND_0[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
