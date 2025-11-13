module BindsTo_0_MemoryUnit(
  input        clock,
  input  [7:0] io_adr,
  input        io_memWe,
  input  [7:0] io_writeData,
  output [7:0] io_data
);

initial begin
  $readmemh("mem_data.hex", MemoryUnit.mem);
end
                      endmodule

bind MemoryUnit BindsTo_0_MemoryUnit BindsTo_0_MemoryUnit_Inst(.*);