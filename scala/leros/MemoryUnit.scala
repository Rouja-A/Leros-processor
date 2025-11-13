package leros

import chisel3._
import chisel3.util._
import chisel3.util.experimental._

class MemoryUnit extends Module {
  val io = IO(new Bundle {
    val adr = Input(UInt(8.W))
    val memWe = Input(Bool())
    val writeData = Input(UInt(8.W))
    val data = Output(UInt(8.W))
  })

  // Use combinational memory
  val mem = Mem(256, UInt(8.W))

  // Write logic (still synchronous to clock)
  when (io.memWe) {
    mem.write(io.adr, io.writeData)
  }

  // Combinational read: directly read from memory without register
  io.data := mem.read(io.adr)

  // Preload memory
  loadMemoryFromFile(mem, "mem_data.hex")
}

object MemoryUnitMaker extends App {
  println("(Generating Verilog file for MemoryUnit)")
  (new chisel3.stage.ChiselStage).emitVerilog(new MemoryUnit(), Array("--target-dir", "Verilog"))
}
