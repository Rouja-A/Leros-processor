;buildInfoPackage: chisel3, version: 3.4.2, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit AddressRegister : 
  module AddressRegister : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip arEn : UInt<1>, flip acc : UInt<8>, arOut : UInt<8>}
    
    reg ar : UInt<8>, clock with : (reset => (reset, UInt<8>("h00"))) @[AddressRegister.scala 12:19]
    when io.arEn : @[AddressRegister.scala 13:17]
      ar <= io.acc @[AddressRegister.scala 14:8]
      skip @[AddressRegister.scala 13:17]
    io.arOut <= ar @[AddressRegister.scala 16:12]
    
