package leros

import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile

class InstructionRegister extends Module {
  val io = IO(new Bundle {
    val addr = Input(UInt(8.W))   // byte address of instruction start
    val instrOut = Output(UInt(16.W))
  })

  val mem = Mem(256, UInt(8.W))  // byte-addressed memory

  loadMemoryFromFile(mem, "instructions2.mem") // each line = 8-bit byte

  // read two consecutive bytes (big endian)
  val highByte = mem(io.addr)
  val lowByte = mem(io.addr + 1.U)
  when (!reset.asBool) {
    printf(p"Addr: 0x${Binary(io.addr)} High: 0x${Binary(highByte)} Low: 0x${Binary(lowByte)} Instr: 0x${Hexadecimal(io.instrOut)}\n")
  }

  io.instrOut := Cat(highByte, lowByte)  // combine to 16-bit instruction (big endian)
}


object InstructionRegisterMaker extends App {
  println("(Generating Verilog file for InstructionRegister)")
  (new chisel3.stage.ChiselStage).emitVerilog(new InstructionRegister(), Array("--target-dir", "Verilog"))
}
