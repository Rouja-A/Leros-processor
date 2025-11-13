package leros

import chisel3._
import chisel3.iotesters.{Driver, PeekPokeTester}

class LerosProcessorTester(c: LerosProcessor) extends PeekPokeTester(c) {
  println("Starting LerosProcessor VCD test...") // Start test message

  // Run simulation for 50 cycles
  for (i <- 0 until 100) {
    step(1) // Advance one clock cycle
    val pc = peek(c.io.pc) // Read PC value
    val instr = peek(c.io.instrOut) // Read instruction output
    val acc = peek(c.io.accOut) // Read accumulator output
    println(s"Cycle $i: PC=$pc, Acc=$acc instr=$instr") // Log values
  }
}

object LerosProcessorMain extends App {
  // Execute simulation with VCD output
  Driver.execute(Array(
    "--generate-vcd-output", "on", // Enable VCD output
    "--target-dir", "test_run_dir/leros.LerosProcessorMain" // Output directory
  ), () => new LerosProcessor) {
    c => new LerosProcessorTester(c) // Instantiate tester
  }
}