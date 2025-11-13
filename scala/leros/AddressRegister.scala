package leros

import chisel3._

class AddressRegister extends Module {
  val io = IO(new Bundle {
    val arEn = Input(Bool())      // Enable signal
    val acc = Input(UInt(8.W))    // 8-bit input
    val arOut = Output(UInt(8.W)) // 8-bit output
  })
  val ar = RegInit(0.U(8.W))    // 8-bit register
  when(io.arEn) {
    ar := io.acc                // Update register
  }
  io.arOut := ar               // Output register value
}

object AddressRegisterMaker extends App {
  println("(Generating Verilog)")
  (new chisel3.stage.ChiselStage).emitVerilog(new AddressRegister(), Array("--target-dir", "Verilog"))
}