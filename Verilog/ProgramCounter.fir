;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit ProgramCounter : 
  module ProgramCounter : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip pcWrite : UInt<1>, flip pcSel : UInt<1>, flip pcAdrSel : UInt<1>, flip imm : SInt<8>, flip acc : UInt<8>, pcOut : UInt<16>, pcPlus2 : UInt<8>}
    
    reg pc : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[ProgramCounter.scala 16:19]
    io.pcOut <= pc @[ProgramCounter.scala 17:12]
    node _T = add(pc, UInt<2>("h02")) @[ProgramCounter.scala 19:21]
    node _T_1 = tail(_T, 1) @[ProgramCounter.scala 19:21]
    node _T_2 = bits(_T_1, 7, 0) @[ProgramCounter.scala 19:27]
    io.pcPlus2 <= _T_2 @[ProgramCounter.scala 19:14]
    when io.pcWrite : @[ProgramCounter.scala 20:20]
      node _T_3 = asSInt(pc) @[ProgramCounter.scala 21:54]
      node _T_4 = add(_T_3, io.imm) @[ProgramCounter.scala 21:61]
      node _T_5 = tail(_T_4, 1) @[ProgramCounter.scala 21:61]
      node _T_6 = asSInt(_T_5) @[ProgramCounter.scala 21:61]
      node _T_7 = asUInt(_T_6) @[ProgramCounter.scala 21:71]
      node _T_8 = mux(io.pcAdrSel, io.acc, _T_7) @[ProgramCounter.scala 21:28]
      node _T_9 = add(pc, UInt<2>("h02")) @[ProgramCounter.scala 21:83]
      node _T_10 = tail(_T_9, 1) @[ProgramCounter.scala 21:83]
      node _T_11 = mux(io.pcSel, _T_8, _T_10) @[ProgramCounter.scala 21:14]
      pc <= _T_11 @[ProgramCounter.scala 21:8]
      skip @[ProgramCounter.scala 20:20]
    
