package leros

import chisel3._
import chisel3.util._

class ALU extends Module {
  val io = IO(new Bundle {
    val aluOp = Input(UInt(4.W))
    val a = Input(UInt(8.W))
    val b = Input(UInt(8.W))
    val result = Output(UInt(8.W))
  })
  io.result := MuxCase(0.U(8.W), Seq(
    (io.aluOp === 0.U) -> (io.a + io.b),         // ADD
    (io.aluOp === 1.U) -> (io.a + io.b),         // ADDI
    (io.aluOp === 2.U) -> (io.a - io.b),         // SUB
    (io.aluOp === 3.U) -> (io.a - io.b),         // SUBI
    (io.aluOp === 4.U) -> (io.a >> 1.U),         // SHR
    (io.aluOp === 5.U) -> (io.a & io.b),         // AND
    (io.aluOp === 6.U) -> (io.a & io.b),         // ANDI
    (io.aluOp === 7.U) -> (io.a | io.b),         // OR
    (io.aluOp === 8.U) -> (io.a | io.b),         // ORI
    (io.aluOp === 9.U) -> (io.a ^ io.b),         // XOR
    (io.aluOp === 10.U) -> (io.a ^ io.b),    // XORI
    (io.aluOp === 11.U) -> (io.b)
  ))
}

object ALUMaker extends App {
  println("(Generating Verilog file for ALU)")
  (new chisel3.stage.ChiselStage).emitVerilog(new ALU(), Array("--target-dir", "Verilog"))
}