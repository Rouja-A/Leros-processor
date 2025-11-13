;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit RegisterFile : 
  module RegisterFile : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip adr : UInt<5>, flip regWe : UInt<1>, flip writeData : UInt<8>, readVal : UInt<8>}
    
    cmem regFile : UInt<8>[256] @[RegisterFile.scala 13:20]
    infer mport MPORT = regFile[io.adr], clock @[RegisterFile.scala 15:24]
    io.readVal <= MPORT @[RegisterFile.scala 15:14]
    when io.regWe : @[RegisterFile.scala 16:18]
      infer mport MPORT_1 = regFile[io.adr], clock @[RegisterFile.scala 17:12]
      MPORT_1 <= io.writeData @[RegisterFile.scala 17:21]
      skip @[RegisterFile.scala 16:18]
    
