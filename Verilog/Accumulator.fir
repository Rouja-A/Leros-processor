;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Accumulator : 
  module Accumulator : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip aluIn : UInt<8>, accOut : UInt<8>, zero : UInt<1>}
    
    reg acc : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[Accumulator.scala 12:20]
    acc <= io.aluIn @[Accumulator.scala 13:7]
    io.accOut <= acc @[Accumulator.scala 14:13]
    node _T = eq(acc, UInt<1>("h00")) @[Accumulator.scala 15:18]
    io.zero <= _T @[Accumulator.scala 15:11]
    
