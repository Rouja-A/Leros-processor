package leros

import chisel3._

class Controller extends Module {
  val io = IO(new Bundle {
    val instr = Input(UInt(16.W))     // 16-bit instruction
    val zero = Input(Bool())          // Zero flag
    val accNegative = Input(Bool())   // Accumulator negative flag
    val pcSel = Output(Bool())        // PC source select
    val pcAdrSel = Output(Bool())     // PC address source
    val regWe = Output(Bool())        // Register write enable
    val srcBSel = Output(UInt(2.W))   // ALU B input source
    val aluOp = Output(UInt(4.W))     // ALU operation
    val arEn = Output(Bool())         // Address register enable
    val memWe = Output(Bool())        // Memory write enable
    val regWsel = Output(Bool())      // Register write source
    val instrWrite = Output(Bool())   // Instruction write enable
    val accEn = Output(Bool())        // Accumulator enable
  })

  val opcode = io.instr(15, 8)       // Extract opcode
  val imm = io.instr(7, 0).asSInt    // Extract immediate

  // Default outputs
  io.pcSel := false.B
  io.pcAdrSel := false.B
  io.regWe := false.B
  io.srcBSel := 0.U
  io.aluOp := 0.U
  io.arEn := false.B
  io.memWe := false.B
  io.regWsel := false.B
  io.instrWrite := false.B
  io.accEn := false.B

  // Decode instructions
  when(io.instr === 0.U) {
    // NOP
  } .elsewhen((opcode & "b11111110".U) === (Opcodes.ADD & "b11111110".U)) {
    when(opcode(0) === 0.U) {
      io.aluOp := 0.U // ADD
      io.srcBSel := 0.U
      io.accEn := true.B
    } .otherwise {
      io.aluOp := 1.U // ADDI
      io.srcBSel := 1.U
    }
    io.accEn := true.B
  } .elsewhen((opcode & "b11111110".U) === (Opcodes.SUB & "b11111110".U)) {
    when(opcode(0) === 0.U) {
      io.aluOp := 2.U // SUB
      io.srcBSel := 0.U
    } .otherwise {
      io.aluOp := 3.U // SUBI
      io.srcBSel := 1.U
    }
    io.accEn := true.B
  } .elsewhen((opcode & "b11111000".U) === (Opcodes.SHR & "b11111000".U)) {
    io.aluOp := 4.U // SHR
    io.srcBSel := 0.U
    io.accEn := true.B
  } .elsewhen(opcode === Opcodes.AND) {
    io.aluOp := 5.U // AND
    io.srcBSel := 0.U
    io.accEn := true.B
  } .elsewhen((opcode & "b11111110".U) === (Opcodes.AND & "b11111110".U)) {
    when(opcode(0) === 1.U) {
      io.aluOp := 6.U // ANDI
      io.srcBSel := 1.U
      io.accEn := true.B
    }
  } .elsewhen(opcode === Opcodes.OR) {
    io.aluOp := 7.U // OR
    io.srcBSel := 0.U
    io.accEn := true.B
  } .elsewhen((opcode & "b11111110".U) === (Opcodes.OR & "b11111110".U)) {
    when(opcode(0) === 1.U) {
      io.aluOp := 8.U // ORI
      io.srcBSel := 1.U
      io.accEn := true.B
    }
  } .elsewhen(opcode === Opcodes.XOR) {
    io.aluOp := 9.U // XOR
    io.srcBSel := 0.U
    io.accEn := true.B
  } .elsewhen((opcode & "b11111110".U) === (Opcodes.XOR & "b11111110".U)) {
    when(opcode(0) === 1.U) {
      io.aluOp := 10.U // XORI
      io.srcBSel := 1.U
      io.accEn := true.B
    }
  } .elsewhen(opcode === Opcodes.Ld) {
    io.regWsel := false.B // Ld
    io.srcBSel := 0.U
    io.accEn := true.B
  } .elsewhen((opcode & "b11111110".U) === (Opcodes.Ld & "b11111110".U)) {
    when(opcode(0) === 1.U) {
      io.regWsel := false.B // LdI
      io.srcBSel := 1.U
      io.aluOp := 11.U
      io.accEn := true.B
    }
  } .elsewhen((opcode & "b11111100".U) === (Opcodes.LdInd & "b11111100".U)) {
    io.regWsel := true.B // LdInd
    io.srcBSel := 2.U
    io.aluOp := 11.U
    io.accEn := true.B
  } .elsewhen((opcode & "b11111000".U) === (Opcodes.Str & "b11111000".U)) {
    io.regWe := true.B // Str
    io.regWsel := true.B
    io.srcBSel := 0.U
  } .elsewhen((opcode & "b11111000".U) === (Opcodes.JAL & "b11111000".U)) {
    io.pcSel := true.B // JAL
    io.pcAdrSel := true.B
    io.regWe := true.B
    io.regWsel := false.B
    io.srcBSel := 0.U
    io.accEn := true.B
  } .elsewhen((opcode & "b11111000".U) === (Opcodes.LdAddr & "b11111000".U)) {
    io.arEn := true.B // LdAddr
    io.srcBSel := 0.U
  } .elsewhen((opcode & "b11111100".U) === (Opcodes.StrInd & "b11111100".U)) {
    io.memWe := true.B // StrInd
    io.srcBSel := 0.U
  } .elsewhen((opcode & "b11110000".U) === (Opcodes.Br & "b11110000".U)) {
    io.pcSel := true.B // Br
    io.pcAdrSel := false.B
    io.srcBSel := 0.U
  } .elsewhen((opcode & "b11110000".U) === (Opcodes.BrZ & "b11110000".U)) {
    io.pcSel := io.zero // BrZ
    io.pcAdrSel := false.B
    io.srcBSel := 0.U
  } .elsewhen((opcode & "b11110000".U) === (Opcodes.BrLT & "b11110000".U)) {
    io.pcSel := io.accNegative // BrLT
    io.pcAdrSel := false.B
    io.srcBSel := 0.U
  }
}

object ControllerMaker extends App {
  println("(Generating Verilog file for Controller)")
  (new chisel3.stage.ChiselStage).emitVerilog(new Controller(), Array("--target-dir", "Verilog"))
}