package leros

import chisel3._

class Accumulator extends Module {
  val io = IO(new Bundle {
    val aluIn = Input(UInt(8.W))   // 8-bit input
    val enable = Input(Bool())     // Enable signal
    val accOut = Output(UInt(8.W)) // 8-bit output
    val zero = Output(Bool())      // Zero flag
  })

  val acc = RegInit(0.U(8.W))    // 8-bit register

  when(io.enable) {
    acc := io.aluIn              // Update register
  }

  io.accOut := acc               // Output register value
  io.zero := acc === 0.U         // Check if zero
}

object AccumulatorMaker extends App {
  println("(Generating Verilog)")
  (new chisel3.stage.ChiselStage).emitVerilog(new Accumulator(), Array("--target-dir", "Verilog"))
}
