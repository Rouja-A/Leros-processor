module BindsTo_0_InstructionRegister(
  input         clock,
  input         reset,
  input  [15:0] io_instrIn,
  output [15:0] io_instrOut
);

initial begin
  $readmemh("resources/instructions.txt", InstructionRegister.mem);
end
                      endmodule

bind InstructionRegister BindsTo_0_InstructionRegister BindsTo_0_InstructionRegister_Inst(.*);