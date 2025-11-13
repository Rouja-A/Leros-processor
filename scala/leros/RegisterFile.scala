package leros

import chisel3._

class RegisterFile extends Module {
  val io = IO(new Bundle {
    val adr = Input(UInt(6.W))       // 5-bit address for register
    val regWe = Input(Bool())        // Write enable signal
    val writeData = Input(UInt(8.W)) // 8-bit data to write
    val readVal = Output(UInt(8.W))  // 8-bit data read
  })

  val regFile = Mem(256, UInt(8.W)) // 256 registers, 8-bit each

  io.readVal := regFile(io.adr)    // Read data from addressed register
  when(io.regWe) {
    regFile(io.adr) := io.writeData // Write data to addressed register
  }
}

object RegisterFileMaker extends App {
  println("(Generating Verilog)")   // Print Verilog generation message
  (new chisel3.stage.ChiselStage).emitVerilog(new RegisterFile(), Array("--target-dir", "Verilog"))
}