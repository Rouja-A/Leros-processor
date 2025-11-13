package leros

import Chisel.MuxCase
import chisel3._

class Datapath extends Module {
  val io = IO(new Bundle {
    val pcSel = Input(Bool())        // Select PC source
    val pcAdrSel = Input(Bool())     // Select PC address source
    val regWe = Input(Bool())        // Register file write enable
    val srcBSel = Input(UInt(2.W))   // ALU B input source
    val aluOp = Input(UInt(4.W))     // ALU operation
    val arEn = Input(Bool())         // Address register enable
    val memWe = Input(Bool())        // Memory write enable
    val regWsel = Input(Bool())      // Register write data source
    val zero = Output(Bool())        // Zero flag
    val accNegative = Output(Bool()) // Accumulator negative flag
    val instrOut = Output(UInt(16.W)) // Instruction output
    val accOut = Output(UInt(16.W))  // Accumulator output
    val PC = Output(UInt(8.W))       // Program counter output
    val accEn = Input(Bool())        // Accumulator enable
  })

  // Instantiate submodules
  val instrReg = Module(new InstructionRegister)
  instrReg.suggestName("InstructionRegister")
  val pc = Module(new ProgramCounter)
  val regFile = Module(new RegisterFile)
  val alu = Module(new ALU)
  val acc = Module(new Accumulator)
  val ar = Module(new AddressRegister)
  val mem = Module(new MemoryUnit)

  // Instruction register connections
  instrReg.io.addr := pc.io.pcOut
  val instr = instrReg.io.instrOut
  val imm = instr(7, 0).asSInt
  val adr = instr(7, 0)(5, 0)

  // Program counter connections
  pc.io.pcWrite := true.B
  pc.io.pcSel := io.pcSel
  pc.io.pcAdrSel := io.pcAdrSel
  pc.io.imm := imm
  pc.io.acc := acc.io.accOut
  io.PC := pc.io.pcOut

  // Register file connections
  regFile.io.adr := adr
  regFile.io.regWe := io.regWe
  regFile.io.writeData := Mux(io.regWsel, acc.io.accOut, mem.io.data)

  // ALU connections
  alu.io.aluOp := io.aluOp
  alu.io.a := acc.io.accOut
  alu.io.b := MuxCase(regFile.io.readVal, Seq(
    (io.srcBSel === 0.U) -> regFile.io.readVal,
    (io.srcBSel === 1.U) -> imm.asUInt,
    (io.srcBSel === 2.U) -> mem.io.data
  ))

  // Accumulator connections
  acc.io.aluIn := alu.io.result
  acc.io.enable := io.accEn
  io.accOut := acc.io.accOut
  io.accNegative := acc.io.accOut(7) // Sign bit for negative check

  // Address register connections
  ar.io.arEn := io.arEn
  ar.io.acc := acc.io.accOut

  // Memory unit connections
  mem.io.adr := (ar.io.arOut + (imm << 1).asUInt).asUInt
  mem.io.memWe := io.memWe
  mem.io.writeData := acc.io.accOut

  // Output connections
  io.zero := acc.io.zero
  io.instrOut := instrReg.io.instrOut
}

object DatapathMaker extends App {
  println("(Generating Verilog)") // Print Verilog generation message
  (new chisel3.stage.ChiselStage).emitVerilog(new Datapath(), Array("--target-dir", "Verilog"))
}