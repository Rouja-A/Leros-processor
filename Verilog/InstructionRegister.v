module InstructionRegister(
  input         clock,
  input         reset,
  input  [7:0]  io_addr,
  input  [15:0] io_instrIn,
  input         io_instrWrite,
  output [15:0] io_instrOut
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] mem [0:255]; // @[InstructionRegister.scala 15:24]
  wire [15:0] mem_memReadData_data; // @[InstructionRegister.scala 15:24]
  wire [7:0] mem_memReadData_addr; // @[InstructionRegister.scala 15:24]
  wire [15:0] mem_MPORT_data; // @[InstructionRegister.scala 15:24]
  wire [7:0] mem_MPORT_addr; // @[InstructionRegister.scala 15:24]
  wire  mem_MPORT_mask; // @[InstructionRegister.scala 15:24]
  wire  mem_MPORT_en; // @[InstructionRegister.scala 15:24]
  wire [15:0] mem_MPORT_1_data; // @[InstructionRegister.scala 15:24]
  wire [7:0] mem_MPORT_1_addr; // @[InstructionRegister.scala 15:24]
  wire  mem_MPORT_1_mask; // @[InstructionRegister.scala 15:24]
  wire  mem_MPORT_1_en; // @[InstructionRegister.scala 15:24]
  reg  mem_memReadData_en_pipe_0;
  reg [7:0] mem_memReadData_addr_pipe_0;
  reg  initDone; // @[InstructionRegister.scala 28:25]
  reg [7:0] initIndex; // @[InstructionRegister.scala 29:26]
  wire [15:0] _GEN_1 = 8'h1 == initIndex ? 16'h1005 : 16'h1003; // @[]
  wire [15:0] _GEN_2 = 8'h2 == initIndex ? 16'h1007 : _GEN_1; // @[]
  wire [15:0] _GEN_3 = 8'h3 == initIndex ? 16'h1002 : _GEN_2; // @[]
  wire [15:0] _GEN_4 = 8'h4 == initIndex ? 16'h1001 : _GEN_3; // @[]
  wire [15:0] _GEN_5 = 8'h5 == initIndex ? 16'h0 : _GEN_4; // @[]
  wire [15:0] _GEN_6 = 8'h6 == initIndex ? 16'h0 : _GEN_5; // @[]
  wire [15:0] _GEN_7 = 8'h7 == initIndex ? 16'h0 : _GEN_6; // @[]
  wire [15:0] _GEN_8 = 8'h8 == initIndex ? 16'h0 : _GEN_7; // @[]
  wire [15:0] _GEN_9 = 8'h9 == initIndex ? 16'h0 : _GEN_8; // @[]
  wire [15:0] _GEN_10 = 8'ha == initIndex ? 16'h0 : _GEN_9; // @[]
  wire [15:0] _GEN_11 = 8'hb == initIndex ? 16'h0 : _GEN_10; // @[]
  wire [15:0] _GEN_12 = 8'hc == initIndex ? 16'h0 : _GEN_11; // @[]
  wire [15:0] _GEN_13 = 8'hd == initIndex ? 16'h0 : _GEN_12; // @[]
  wire [15:0] _GEN_14 = 8'he == initIndex ? 16'h0 : _GEN_13; // @[]
  wire [15:0] _GEN_15 = 8'hf == initIndex ? 16'h0 : _GEN_14; // @[]
  wire [15:0] _GEN_16 = 8'h10 == initIndex ? 16'h0 : _GEN_15; // @[]
  wire [15:0] _GEN_17 = 8'h11 == initIndex ? 16'h0 : _GEN_16; // @[]
  wire [15:0] _GEN_18 = 8'h12 == initIndex ? 16'h0 : _GEN_17; // @[]
  wire [15:0] _GEN_19 = 8'h13 == initIndex ? 16'h0 : _GEN_18; // @[]
  wire [15:0] _GEN_20 = 8'h14 == initIndex ? 16'h0 : _GEN_19; // @[]
  wire [15:0] _GEN_21 = 8'h15 == initIndex ? 16'h0 : _GEN_20; // @[]
  wire [15:0] _GEN_22 = 8'h16 == initIndex ? 16'h0 : _GEN_21; // @[]
  wire [15:0] _GEN_23 = 8'h17 == initIndex ? 16'h0 : _GEN_22; // @[]
  wire [15:0] _GEN_24 = 8'h18 == initIndex ? 16'h0 : _GEN_23; // @[]
  wire [15:0] _GEN_25 = 8'h19 == initIndex ? 16'h0 : _GEN_24; // @[]
  wire [15:0] _GEN_26 = 8'h1a == initIndex ? 16'h0 : _GEN_25; // @[]
  wire [15:0] _GEN_27 = 8'h1b == initIndex ? 16'h0 : _GEN_26; // @[]
  wire [15:0] _GEN_28 = 8'h1c == initIndex ? 16'h0 : _GEN_27; // @[]
  wire [15:0] _GEN_29 = 8'h1d == initIndex ? 16'h0 : _GEN_28; // @[]
  wire [15:0] _GEN_30 = 8'h1e == initIndex ? 16'h0 : _GEN_29; // @[]
  wire [15:0] _GEN_31 = 8'h1f == initIndex ? 16'h0 : _GEN_30; // @[]
  wire [15:0] _GEN_32 = 8'h20 == initIndex ? 16'h0 : _GEN_31; // @[]
  wire [15:0] _GEN_33 = 8'h21 == initIndex ? 16'h0 : _GEN_32; // @[]
  wire [15:0] _GEN_34 = 8'h22 == initIndex ? 16'h0 : _GEN_33; // @[]
  wire [15:0] _GEN_35 = 8'h23 == initIndex ? 16'h0 : _GEN_34; // @[]
  wire [15:0] _GEN_36 = 8'h24 == initIndex ? 16'h0 : _GEN_35; // @[]
  wire [15:0] _GEN_37 = 8'h25 == initIndex ? 16'h0 : _GEN_36; // @[]
  wire [15:0] _GEN_38 = 8'h26 == initIndex ? 16'h0 : _GEN_37; // @[]
  wire [15:0] _GEN_39 = 8'h27 == initIndex ? 16'h0 : _GEN_38; // @[]
  wire [15:0] _GEN_40 = 8'h28 == initIndex ? 16'h0 : _GEN_39; // @[]
  wire [15:0] _GEN_41 = 8'h29 == initIndex ? 16'h0 : _GEN_40; // @[]
  wire [15:0] _GEN_42 = 8'h2a == initIndex ? 16'h0 : _GEN_41; // @[]
  wire [15:0] _GEN_43 = 8'h2b == initIndex ? 16'h0 : _GEN_42; // @[]
  wire [15:0] _GEN_44 = 8'h2c == initIndex ? 16'h0 : _GEN_43; // @[]
  wire [15:0] _GEN_45 = 8'h2d == initIndex ? 16'h0 : _GEN_44; // @[]
  wire [15:0] _GEN_46 = 8'h2e == initIndex ? 16'h0 : _GEN_45; // @[]
  wire [15:0] _GEN_47 = 8'h2f == initIndex ? 16'h0 : _GEN_46; // @[]
  wire [15:0] _GEN_48 = 8'h30 == initIndex ? 16'h0 : _GEN_47; // @[]
  wire [15:0] _GEN_49 = 8'h31 == initIndex ? 16'h0 : _GEN_48; // @[]
  wire [15:0] _GEN_50 = 8'h32 == initIndex ? 16'h0 : _GEN_49; // @[]
  wire [15:0] _GEN_51 = 8'h33 == initIndex ? 16'h0 : _GEN_50; // @[]
  wire [15:0] _GEN_52 = 8'h34 == initIndex ? 16'h0 : _GEN_51; // @[]
  wire [15:0] _GEN_53 = 8'h35 == initIndex ? 16'h0 : _GEN_52; // @[]
  wire [15:0] _GEN_54 = 8'h36 == initIndex ? 16'h0 : _GEN_53; // @[]
  wire [15:0] _GEN_55 = 8'h37 == initIndex ? 16'h0 : _GEN_54; // @[]
  wire [15:0] _GEN_56 = 8'h38 == initIndex ? 16'h0 : _GEN_55; // @[]
  wire [15:0] _GEN_57 = 8'h39 == initIndex ? 16'h0 : _GEN_56; // @[]
  wire [15:0] _GEN_58 = 8'h3a == initIndex ? 16'h0 : _GEN_57; // @[]
  wire [15:0] _GEN_59 = 8'h3b == initIndex ? 16'h0 : _GEN_58; // @[]
  wire [15:0] _GEN_60 = 8'h3c == initIndex ? 16'h0 : _GEN_59; // @[]
  wire [15:0] _GEN_61 = 8'h3d == initIndex ? 16'h0 : _GEN_60; // @[]
  wire [15:0] _GEN_62 = 8'h3e == initIndex ? 16'h0 : _GEN_61; // @[]
  wire [15:0] _GEN_63 = 8'h3f == initIndex ? 16'h0 : _GEN_62; // @[]
  wire [15:0] _GEN_64 = 8'h40 == initIndex ? 16'h0 : _GEN_63; // @[]
  wire [15:0] _GEN_65 = 8'h41 == initIndex ? 16'h0 : _GEN_64; // @[]
  wire [15:0] _GEN_66 = 8'h42 == initIndex ? 16'h0 : _GEN_65; // @[]
  wire [15:0] _GEN_67 = 8'h43 == initIndex ? 16'h0 : _GEN_66; // @[]
  wire [15:0] _GEN_68 = 8'h44 == initIndex ? 16'h0 : _GEN_67; // @[]
  wire [15:0] _GEN_69 = 8'h45 == initIndex ? 16'h0 : _GEN_68; // @[]
  wire [15:0] _GEN_70 = 8'h46 == initIndex ? 16'h0 : _GEN_69; // @[]
  wire [15:0] _GEN_71 = 8'h47 == initIndex ? 16'h0 : _GEN_70; // @[]
  wire [15:0] _GEN_72 = 8'h48 == initIndex ? 16'h0 : _GEN_71; // @[]
  wire [15:0] _GEN_73 = 8'h49 == initIndex ? 16'h0 : _GEN_72; // @[]
  wire [15:0] _GEN_74 = 8'h4a == initIndex ? 16'h0 : _GEN_73; // @[]
  wire [15:0] _GEN_75 = 8'h4b == initIndex ? 16'h0 : _GEN_74; // @[]
  wire [15:0] _GEN_76 = 8'h4c == initIndex ? 16'h0 : _GEN_75; // @[]
  wire [15:0] _GEN_77 = 8'h4d == initIndex ? 16'h0 : _GEN_76; // @[]
  wire [15:0] _GEN_78 = 8'h4e == initIndex ? 16'h0 : _GEN_77; // @[]
  wire [15:0] _GEN_79 = 8'h4f == initIndex ? 16'h0 : _GEN_78; // @[]
  wire [15:0] _GEN_80 = 8'h50 == initIndex ? 16'h0 : _GEN_79; // @[]
  wire [15:0] _GEN_81 = 8'h51 == initIndex ? 16'h0 : _GEN_80; // @[]
  wire [15:0] _GEN_82 = 8'h52 == initIndex ? 16'h0 : _GEN_81; // @[]
  wire [15:0] _GEN_83 = 8'h53 == initIndex ? 16'h0 : _GEN_82; // @[]
  wire [15:0] _GEN_84 = 8'h54 == initIndex ? 16'h0 : _GEN_83; // @[]
  wire [15:0] _GEN_85 = 8'h55 == initIndex ? 16'h0 : _GEN_84; // @[]
  wire [15:0] _GEN_86 = 8'h56 == initIndex ? 16'h0 : _GEN_85; // @[]
  wire [15:0] _GEN_87 = 8'h57 == initIndex ? 16'h0 : _GEN_86; // @[]
  wire [15:0] _GEN_88 = 8'h58 == initIndex ? 16'h0 : _GEN_87; // @[]
  wire [15:0] _GEN_89 = 8'h59 == initIndex ? 16'h0 : _GEN_88; // @[]
  wire [15:0] _GEN_90 = 8'h5a == initIndex ? 16'h0 : _GEN_89; // @[]
  wire [15:0] _GEN_91 = 8'h5b == initIndex ? 16'h0 : _GEN_90; // @[]
  wire [15:0] _GEN_92 = 8'h5c == initIndex ? 16'h0 : _GEN_91; // @[]
  wire [15:0] _GEN_93 = 8'h5d == initIndex ? 16'h0 : _GEN_92; // @[]
  wire [15:0] _GEN_94 = 8'h5e == initIndex ? 16'h0 : _GEN_93; // @[]
  wire [15:0] _GEN_95 = 8'h5f == initIndex ? 16'h0 : _GEN_94; // @[]
  wire [15:0] _GEN_96 = 8'h60 == initIndex ? 16'h0 : _GEN_95; // @[]
  wire [15:0] _GEN_97 = 8'h61 == initIndex ? 16'h0 : _GEN_96; // @[]
  wire [15:0] _GEN_98 = 8'h62 == initIndex ? 16'h0 : _GEN_97; // @[]
  wire [15:0] _GEN_99 = 8'h63 == initIndex ? 16'h0 : _GEN_98; // @[]
  wire [15:0] _GEN_100 = 8'h64 == initIndex ? 16'h0 : _GEN_99; // @[]
  wire [15:0] _GEN_101 = 8'h65 == initIndex ? 16'h0 : _GEN_100; // @[]
  wire [15:0] _GEN_102 = 8'h66 == initIndex ? 16'h0 : _GEN_101; // @[]
  wire [15:0] _GEN_103 = 8'h67 == initIndex ? 16'h0 : _GEN_102; // @[]
  wire [15:0] _GEN_104 = 8'h68 == initIndex ? 16'h0 : _GEN_103; // @[]
  wire [15:0] _GEN_105 = 8'h69 == initIndex ? 16'h0 : _GEN_104; // @[]
  wire [15:0] _GEN_106 = 8'h6a == initIndex ? 16'h0 : _GEN_105; // @[]
  wire [15:0] _GEN_107 = 8'h6b == initIndex ? 16'h0 : _GEN_106; // @[]
  wire [15:0] _GEN_108 = 8'h6c == initIndex ? 16'h0 : _GEN_107; // @[]
  wire [15:0] _GEN_109 = 8'h6d == initIndex ? 16'h0 : _GEN_108; // @[]
  wire [15:0] _GEN_110 = 8'h6e == initIndex ? 16'h0 : _GEN_109; // @[]
  wire [15:0] _GEN_111 = 8'h6f == initIndex ? 16'h0 : _GEN_110; // @[]
  wire [15:0] _GEN_112 = 8'h70 == initIndex ? 16'h0 : _GEN_111; // @[]
  wire [15:0] _GEN_113 = 8'h71 == initIndex ? 16'h0 : _GEN_112; // @[]
  wire [15:0] _GEN_114 = 8'h72 == initIndex ? 16'h0 : _GEN_113; // @[]
  wire [15:0] _GEN_115 = 8'h73 == initIndex ? 16'h0 : _GEN_114; // @[]
  wire [15:0] _GEN_116 = 8'h74 == initIndex ? 16'h0 : _GEN_115; // @[]
  wire [15:0] _GEN_117 = 8'h75 == initIndex ? 16'h0 : _GEN_116; // @[]
  wire [15:0] _GEN_118 = 8'h76 == initIndex ? 16'h0 : _GEN_117; // @[]
  wire [15:0] _GEN_119 = 8'h77 == initIndex ? 16'h0 : _GEN_118; // @[]
  wire [15:0] _GEN_120 = 8'h78 == initIndex ? 16'h0 : _GEN_119; // @[]
  wire [15:0] _GEN_121 = 8'h79 == initIndex ? 16'h0 : _GEN_120; // @[]
  wire [15:0] _GEN_122 = 8'h7a == initIndex ? 16'h0 : _GEN_121; // @[]
  wire [15:0] _GEN_123 = 8'h7b == initIndex ? 16'h0 : _GEN_122; // @[]
  wire [15:0] _GEN_124 = 8'h7c == initIndex ? 16'h0 : _GEN_123; // @[]
  wire [15:0] _GEN_125 = 8'h7d == initIndex ? 16'h0 : _GEN_124; // @[]
  wire [15:0] _GEN_126 = 8'h7e == initIndex ? 16'h0 : _GEN_125; // @[]
  wire [15:0] _GEN_127 = 8'h7f == initIndex ? 16'h0 : _GEN_126; // @[]
  wire [15:0] _GEN_128 = 8'h80 == initIndex ? 16'h0 : _GEN_127; // @[]
  wire [15:0] _GEN_129 = 8'h81 == initIndex ? 16'h0 : _GEN_128; // @[]
  wire [15:0] _GEN_130 = 8'h82 == initIndex ? 16'h0 : _GEN_129; // @[]
  wire [15:0] _GEN_131 = 8'h83 == initIndex ? 16'h0 : _GEN_130; // @[]
  wire [15:0] _GEN_132 = 8'h84 == initIndex ? 16'h0 : _GEN_131; // @[]
  wire [15:0] _GEN_133 = 8'h85 == initIndex ? 16'h0 : _GEN_132; // @[]
  wire [15:0] _GEN_134 = 8'h86 == initIndex ? 16'h0 : _GEN_133; // @[]
  wire [15:0] _GEN_135 = 8'h87 == initIndex ? 16'h0 : _GEN_134; // @[]
  wire [15:0] _GEN_136 = 8'h88 == initIndex ? 16'h0 : _GEN_135; // @[]
  wire [15:0] _GEN_137 = 8'h89 == initIndex ? 16'h0 : _GEN_136; // @[]
  wire [15:0] _GEN_138 = 8'h8a == initIndex ? 16'h0 : _GEN_137; // @[]
  wire [15:0] _GEN_139 = 8'h8b == initIndex ? 16'h0 : _GEN_138; // @[]
  wire [15:0] _GEN_140 = 8'h8c == initIndex ? 16'h0 : _GEN_139; // @[]
  wire [15:0] _GEN_141 = 8'h8d == initIndex ? 16'h0 : _GEN_140; // @[]
  wire [15:0] _GEN_142 = 8'h8e == initIndex ? 16'h0 : _GEN_141; // @[]
  wire [15:0] _GEN_143 = 8'h8f == initIndex ? 16'h0 : _GEN_142; // @[]
  wire [15:0] _GEN_144 = 8'h90 == initIndex ? 16'h0 : _GEN_143; // @[]
  wire [15:0] _GEN_145 = 8'h91 == initIndex ? 16'h0 : _GEN_144; // @[]
  wire [15:0] _GEN_146 = 8'h92 == initIndex ? 16'h0 : _GEN_145; // @[]
  wire [15:0] _GEN_147 = 8'h93 == initIndex ? 16'h0 : _GEN_146; // @[]
  wire [15:0] _GEN_148 = 8'h94 == initIndex ? 16'h0 : _GEN_147; // @[]
  wire [15:0] _GEN_149 = 8'h95 == initIndex ? 16'h0 : _GEN_148; // @[]
  wire [15:0] _GEN_150 = 8'h96 == initIndex ? 16'h0 : _GEN_149; // @[]
  wire [15:0] _GEN_151 = 8'h97 == initIndex ? 16'h0 : _GEN_150; // @[]
  wire [15:0] _GEN_152 = 8'h98 == initIndex ? 16'h0 : _GEN_151; // @[]
  wire [15:0] _GEN_153 = 8'h99 == initIndex ? 16'h0 : _GEN_152; // @[]
  wire [15:0] _GEN_154 = 8'h9a == initIndex ? 16'h0 : _GEN_153; // @[]
  wire [15:0] _GEN_155 = 8'h9b == initIndex ? 16'h0 : _GEN_154; // @[]
  wire [15:0] _GEN_156 = 8'h9c == initIndex ? 16'h0 : _GEN_155; // @[]
  wire [15:0] _GEN_157 = 8'h9d == initIndex ? 16'h0 : _GEN_156; // @[]
  wire [15:0] _GEN_158 = 8'h9e == initIndex ? 16'h0 : _GEN_157; // @[]
  wire [15:0] _GEN_159 = 8'h9f == initIndex ? 16'h0 : _GEN_158; // @[]
  wire [15:0] _GEN_160 = 8'ha0 == initIndex ? 16'h0 : _GEN_159; // @[]
  wire [15:0] _GEN_161 = 8'ha1 == initIndex ? 16'h0 : _GEN_160; // @[]
  wire [15:0] _GEN_162 = 8'ha2 == initIndex ? 16'h0 : _GEN_161; // @[]
  wire [15:0] _GEN_163 = 8'ha3 == initIndex ? 16'h0 : _GEN_162; // @[]
  wire [15:0] _GEN_164 = 8'ha4 == initIndex ? 16'h0 : _GEN_163; // @[]
  wire [15:0] _GEN_165 = 8'ha5 == initIndex ? 16'h0 : _GEN_164; // @[]
  wire [15:0] _GEN_166 = 8'ha6 == initIndex ? 16'h0 : _GEN_165; // @[]
  wire [15:0] _GEN_167 = 8'ha7 == initIndex ? 16'h0 : _GEN_166; // @[]
  wire [15:0] _GEN_168 = 8'ha8 == initIndex ? 16'h0 : _GEN_167; // @[]
  wire [15:0] _GEN_169 = 8'ha9 == initIndex ? 16'h0 : _GEN_168; // @[]
  wire [15:0] _GEN_170 = 8'haa == initIndex ? 16'h0 : _GEN_169; // @[]
  wire [15:0] _GEN_171 = 8'hab == initIndex ? 16'h0 : _GEN_170; // @[]
  wire [15:0] _GEN_172 = 8'hac == initIndex ? 16'h0 : _GEN_171; // @[]
  wire [15:0] _GEN_173 = 8'had == initIndex ? 16'h0 : _GEN_172; // @[]
  wire [15:0] _GEN_174 = 8'hae == initIndex ? 16'h0 : _GEN_173; // @[]
  wire [15:0] _GEN_175 = 8'haf == initIndex ? 16'h0 : _GEN_174; // @[]
  wire [15:0] _GEN_176 = 8'hb0 == initIndex ? 16'h0 : _GEN_175; // @[]
  wire [15:0] _GEN_177 = 8'hb1 == initIndex ? 16'h0 : _GEN_176; // @[]
  wire [15:0] _GEN_178 = 8'hb2 == initIndex ? 16'h0 : _GEN_177; // @[]
  wire [15:0] _GEN_179 = 8'hb3 == initIndex ? 16'h0 : _GEN_178; // @[]
  wire [15:0] _GEN_180 = 8'hb4 == initIndex ? 16'h0 : _GEN_179; // @[]
  wire [15:0] _GEN_181 = 8'hb5 == initIndex ? 16'h0 : _GEN_180; // @[]
  wire [15:0] _GEN_182 = 8'hb6 == initIndex ? 16'h0 : _GEN_181; // @[]
  wire [15:0] _GEN_183 = 8'hb7 == initIndex ? 16'h0 : _GEN_182; // @[]
  wire [15:0] _GEN_184 = 8'hb8 == initIndex ? 16'h0 : _GEN_183; // @[]
  wire [15:0] _GEN_185 = 8'hb9 == initIndex ? 16'h0 : _GEN_184; // @[]
  wire [15:0] _GEN_186 = 8'hba == initIndex ? 16'h0 : _GEN_185; // @[]
  wire [15:0] _GEN_187 = 8'hbb == initIndex ? 16'h0 : _GEN_186; // @[]
  wire [15:0] _GEN_188 = 8'hbc == initIndex ? 16'h0 : _GEN_187; // @[]
  wire [15:0] _GEN_189 = 8'hbd == initIndex ? 16'h0 : _GEN_188; // @[]
  wire [15:0] _GEN_190 = 8'hbe == initIndex ? 16'h0 : _GEN_189; // @[]
  wire [15:0] _GEN_191 = 8'hbf == initIndex ? 16'h0 : _GEN_190; // @[]
  wire [15:0] _GEN_192 = 8'hc0 == initIndex ? 16'h0 : _GEN_191; // @[]
  wire [15:0] _GEN_193 = 8'hc1 == initIndex ? 16'h0 : _GEN_192; // @[]
  wire [15:0] _GEN_194 = 8'hc2 == initIndex ? 16'h0 : _GEN_193; // @[]
  wire [15:0] _GEN_195 = 8'hc3 == initIndex ? 16'h0 : _GEN_194; // @[]
  wire [15:0] _GEN_196 = 8'hc4 == initIndex ? 16'h0 : _GEN_195; // @[]
  wire [15:0] _GEN_197 = 8'hc5 == initIndex ? 16'h0 : _GEN_196; // @[]
  wire [15:0] _GEN_198 = 8'hc6 == initIndex ? 16'h0 : _GEN_197; // @[]
  wire [15:0] _GEN_199 = 8'hc7 == initIndex ? 16'h0 : _GEN_198; // @[]
  wire [15:0] _GEN_200 = 8'hc8 == initIndex ? 16'h0 : _GEN_199; // @[]
  wire [15:0] _GEN_201 = 8'hc9 == initIndex ? 16'h0 : _GEN_200; // @[]
  wire [15:0] _GEN_202 = 8'hca == initIndex ? 16'h0 : _GEN_201; // @[]
  wire [15:0] _GEN_203 = 8'hcb == initIndex ? 16'h0 : _GEN_202; // @[]
  wire [15:0] _GEN_204 = 8'hcc == initIndex ? 16'h0 : _GEN_203; // @[]
  wire [15:0] _GEN_205 = 8'hcd == initIndex ? 16'h0 : _GEN_204; // @[]
  wire [15:0] _GEN_206 = 8'hce == initIndex ? 16'h0 : _GEN_205; // @[]
  wire [15:0] _GEN_207 = 8'hcf == initIndex ? 16'h0 : _GEN_206; // @[]
  wire [15:0] _GEN_208 = 8'hd0 == initIndex ? 16'h0 : _GEN_207; // @[]
  wire [15:0] _GEN_209 = 8'hd1 == initIndex ? 16'h0 : _GEN_208; // @[]
  wire [15:0] _GEN_210 = 8'hd2 == initIndex ? 16'h0 : _GEN_209; // @[]
  wire [15:0] _GEN_211 = 8'hd3 == initIndex ? 16'h0 : _GEN_210; // @[]
  wire [15:0] _GEN_212 = 8'hd4 == initIndex ? 16'h0 : _GEN_211; // @[]
  wire [15:0] _GEN_213 = 8'hd5 == initIndex ? 16'h0 : _GEN_212; // @[]
  wire [15:0] _GEN_214 = 8'hd6 == initIndex ? 16'h0 : _GEN_213; // @[]
  wire [15:0] _GEN_215 = 8'hd7 == initIndex ? 16'h0 : _GEN_214; // @[]
  wire [15:0] _GEN_216 = 8'hd8 == initIndex ? 16'h0 : _GEN_215; // @[]
  wire [15:0] _GEN_217 = 8'hd9 == initIndex ? 16'h0 : _GEN_216; // @[]
  wire [15:0] _GEN_218 = 8'hda == initIndex ? 16'h0 : _GEN_217; // @[]
  wire [15:0] _GEN_219 = 8'hdb == initIndex ? 16'h0 : _GEN_218; // @[]
  wire [15:0] _GEN_220 = 8'hdc == initIndex ? 16'h0 : _GEN_219; // @[]
  wire [15:0] _GEN_221 = 8'hdd == initIndex ? 16'h0 : _GEN_220; // @[]
  wire [15:0] _GEN_222 = 8'hde == initIndex ? 16'h0 : _GEN_221; // @[]
  wire [15:0] _GEN_223 = 8'hdf == initIndex ? 16'h0 : _GEN_222; // @[]
  wire [15:0] _GEN_224 = 8'he0 == initIndex ? 16'h0 : _GEN_223; // @[]
  wire [15:0] _GEN_225 = 8'he1 == initIndex ? 16'h0 : _GEN_224; // @[]
  wire [15:0] _GEN_226 = 8'he2 == initIndex ? 16'h0 : _GEN_225; // @[]
  wire [15:0] _GEN_227 = 8'he3 == initIndex ? 16'h0 : _GEN_226; // @[]
  wire [15:0] _GEN_228 = 8'he4 == initIndex ? 16'h0 : _GEN_227; // @[]
  wire [15:0] _GEN_229 = 8'he5 == initIndex ? 16'h0 : _GEN_228; // @[]
  wire [15:0] _GEN_230 = 8'he6 == initIndex ? 16'h0 : _GEN_229; // @[]
  wire [15:0] _GEN_231 = 8'he7 == initIndex ? 16'h0 : _GEN_230; // @[]
  wire [15:0] _GEN_232 = 8'he8 == initIndex ? 16'h0 : _GEN_231; // @[]
  wire [15:0] _GEN_233 = 8'he9 == initIndex ? 16'h0 : _GEN_232; // @[]
  wire [15:0] _GEN_234 = 8'hea == initIndex ? 16'h0 : _GEN_233; // @[]
  wire [15:0] _GEN_235 = 8'heb == initIndex ? 16'h0 : _GEN_234; // @[]
  wire [15:0] _GEN_236 = 8'hec == initIndex ? 16'h0 : _GEN_235; // @[]
  wire [15:0] _GEN_237 = 8'hed == initIndex ? 16'h0 : _GEN_236; // @[]
  wire [15:0] _GEN_238 = 8'hee == initIndex ? 16'h0 : _GEN_237; // @[]
  wire [15:0] _GEN_239 = 8'hef == initIndex ? 16'h0 : _GEN_238; // @[]
  wire [15:0] _GEN_240 = 8'hf0 == initIndex ? 16'h0 : _GEN_239; // @[]
  wire [15:0] _GEN_241 = 8'hf1 == initIndex ? 16'h0 : _GEN_240; // @[]
  wire [15:0] _GEN_242 = 8'hf2 == initIndex ? 16'h0 : _GEN_241; // @[]
  wire [15:0] _GEN_243 = 8'hf3 == initIndex ? 16'h0 : _GEN_242; // @[]
  wire [15:0] _GEN_244 = 8'hf4 == initIndex ? 16'h0 : _GEN_243; // @[]
  wire [15:0] _GEN_245 = 8'hf5 == initIndex ? 16'h0 : _GEN_244; // @[]
  wire [15:0] _GEN_246 = 8'hf6 == initIndex ? 16'h0 : _GEN_245; // @[]
  wire [15:0] _GEN_247 = 8'hf7 == initIndex ? 16'h0 : _GEN_246; // @[]
  wire [15:0] _GEN_248 = 8'hf8 == initIndex ? 16'h0 : _GEN_247; // @[]
  wire [15:0] _GEN_249 = 8'hf9 == initIndex ? 16'h0 : _GEN_248; // @[]
  wire [15:0] _GEN_250 = 8'hfa == initIndex ? 16'h0 : _GEN_249; // @[]
  wire [15:0] _GEN_251 = 8'hfb == initIndex ? 16'h0 : _GEN_250; // @[]
  wire [15:0] _GEN_252 = 8'hfc == initIndex ? 16'h0 : _GEN_251; // @[]
  wire [15:0] _GEN_253 = 8'hfd == initIndex ? 16'h0 : _GEN_252; // @[]
  wire [15:0] _GEN_254 = 8'hfe == initIndex ? 16'h0 : _GEN_253; // @[]
  wire [7:0] _T_3 = initIndex + 8'h1; // @[InstructionRegister.scala 36:30]
  wire  _GEN_256 = initIndex == 8'hff | initDone; // @[InstructionRegister.scala 33:37 InstructionRegister.scala 34:16 InstructionRegister.scala 28:25]
  reg [15:0] instrReg; // @[InstructionRegister.scala 41:25]
  assign mem_memReadData_addr = mem_memReadData_addr_pipe_0;
  assign mem_memReadData_data = mem[mem_memReadData_addr]; // @[InstructionRegister.scala 15:24]
  assign mem_MPORT_data = 8'hff == initIndex ? 16'h0 : _GEN_254;
  assign mem_MPORT_addr = initIndex;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = ~initDone;
  assign mem_MPORT_1_data = io_instrIn;
  assign mem_MPORT_1_addr = io_addr;
  assign mem_MPORT_1_mask = 1'h1;
  assign mem_MPORT_1_en = io_instrWrite & initDone;
  assign io_instrOut = instrReg; // @[InstructionRegister.scala 50:15]
  always @(posedge clock) begin
    if(mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[InstructionRegister.scala 15:24]
    end
    if(mem_MPORT_1_en & mem_MPORT_1_mask) begin
      mem[mem_MPORT_1_addr] <= mem_MPORT_1_data; // @[InstructionRegister.scala 15:24]
    end
    mem_memReadData_en_pipe_0 <= ~io_instrWrite;
    if (~io_instrWrite) begin
      mem_memReadData_addr_pipe_0 <= io_addr;
    end
    if (reset) begin // @[InstructionRegister.scala 28:25]
      initDone <= 1'h0; // @[InstructionRegister.scala 28:25]
    end else if (~initDone) begin // @[InstructionRegister.scala 31:19]
      initDone <= _GEN_256;
    end
    if (reset) begin // @[InstructionRegister.scala 29:26]
      initIndex <= 8'h0; // @[InstructionRegister.scala 29:26]
    end else if (~initDone) begin // @[InstructionRegister.scala 31:19]
      if (!(initIndex == 8'hff)) begin // @[InstructionRegister.scala 33:37]
        initIndex <= _T_3; // @[InstructionRegister.scala 36:17]
      end
    end
    if (reset) begin // @[InstructionRegister.scala 41:25]
      instrReg <= 16'h0; // @[InstructionRegister.scala 41:25]
    end else if (io_instrWrite & initDone) begin // @[InstructionRegister.scala 43:35]
      instrReg <= io_instrIn; // @[InstructionRegister.scala 45:14]
    end else begin
      instrReg <= mem_memReadData_data; // @[InstructionRegister.scala 47:14]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 256; initvar = initvar+1)
    mem[initvar] = _RAND_0[15:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  mem_memReadData_en_pipe_0 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  mem_memReadData_addr_pipe_0 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  initDone = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  initIndex = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  instrReg = _RAND_5[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
