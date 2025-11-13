package leros

import chisel3._

class ProgramCounter extends Module {
  val io = IO(new Bundle {
    val pcWrite = Input(Bool())      // Enable PC update
    val pcSel = Input(Bool())        // Select source for PC update
    val pcAdrSel = Input(Bool())     // Select between acc or imm
    val imm = Input(SInt(8.W))       // 8-bit signed immediate
    val acc = Input(UInt(8.W))       // 8-bit accumulator input
    val pcOut = Output(UInt(8.W))    // Current PC value
    val pcPlus2 = Output(UInt(8.W))  // PC + 2 value
  })

  val pc = RegInit(0.U(8.W))       // 8-bit PC register

  io.pcOut := pc                   // Output current PC
  io.pcPlus2 := (pc + 2.U)(7, 0)   // Output PC + 2 (lower 8 bits)

  when(io.pcWrite) {               // Update PC when enabled
    pc := Mux(io.pcSel,            // Choose between jump or increment
      Mux(io.pcAdrSel, io.acc,     // Choose acc or PC + imm
        (pc.asSInt + io.imm).asUInt),
      pc + 2.U)
  }
}

object ProgramCounterMaker extends App {
  println("(Generating Verilog)")  // Print Verilog generation message
  (new chisel3.stage.ChiselStage).emitVerilog(new ProgramCounter(), Array("--target-dir", "Verilog"))
}