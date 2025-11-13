package leros

import chisel3._

class LerosProcessor extends Module {
  val io = IO(new Bundle {
    val zero = Output(Bool())        // Zero flag output
    val accOut = Output(UInt(16.W))  // Accumulator output
    val pc = Output(UInt(8.W))       // Program counter output
    val instrOut = Output(UInt(16.W)) // Instruction output
  })

  // Instantiate modules
  val datapath = Module(new Datapath)
  val controller = Module(new Controller)

  // Connect Controller to Datapath
  controller.io.instr := datapath.io.instrOut
  controller.io.zero := datapath.io.zero
  controller.io.accNegative := datapath.io.accNegative // Connect negative flag

  // Connect Datapath to Controller
  datapath.io.pcSel := controller.io.pcSel
  datapath.io.pcAdrSel := controller.io.pcAdrSel
  datapath.io.regWe := controller.io.regWe
  datapath.io.srcBSel := controller.io.srcBSel
  datapath.io.aluOp := controller.io.aluOp
  datapath.io.arEn := controller.io.arEn
  datapath.io.memWe := controller.io.memWe
  datapath.io.regWsel := controller.io.regWsel
  datapath.io.accEn := controller.io.accEn

  // Connect outputs
  io.zero := datapath.io.zero
  io.accOut := datapath.io.accOut
  io.pc := datapath.io.PC
  io.instrOut := datapath.io.instrOut
}

object LerosProcessorMaker extends App {
  println("(Generating Verilog)") // Print Verilog generation message
  (new chisel3.stage.ChiselStage).emitVerilog(new LerosProcessor(), Array("--target-dir", "Verilog"))
}