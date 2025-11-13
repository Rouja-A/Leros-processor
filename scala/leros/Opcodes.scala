package leros

import chisel3._

object Opcodes {
  val NOP    = "b00000000".U(8.W) // NOP
  val ADD    = "b00001000".U(8.W) // ADD/ADDI
  val SUB    = "b00001100".U(8.W) // SUB/SUBI
  val SHR    = "b00010000".U(8.W) // SHR
  val AND    = "b00100010".U(8.W) // AND/ANDI
  val OR     = "b00100100".U(8.W) // OR/ORI
  val XOR    = "b00100110".U(8.W) // XOR/XORI
  val Ld     = "b00100000".U(8.W) // Ld/LdI
  val Str    = "b00110000".U(8.W) // Str
  val JAL    = "b01000000".U(8.W) // JAL
  val LdAddr = "b01010000".U(8.W) // LdAddr
  val LdInd  = "b01100000".U(8.W) // LdInd
  val StrInd = "b01110000".U(8.W) // StrInd
  val Br     = "b10000000".U(8.W) // Br
  val BrZ    = "b10010000".U(8.W) // BrZ
  val BrLT   = "b10100000".U(8.W) // BrLT
}