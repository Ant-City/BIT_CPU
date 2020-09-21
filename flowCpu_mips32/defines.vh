
`define READENABLE 1'b1
`define READDISABLE 1'b0
`define WRITEABLE 1'b1
`define UNWRITEABLE 1'b0
`define EXTENDSIGNAL_SIZE 1:0

`define RESETABLE 1'b1
`define RESETUNABLE 1'b0
`define ChipEnable 1'b1
`define ChipDisable 1'b0
`define AluOpBus 7:0
`define AluSelBus 2:0
`define InstValid 1'b0
`define InstInvalid 1'b1

`define BRANCH 1'b1
`define NOTBRANCH 1'b0
`define InDelaySlot 1'b1
`define NotInDelaySlot 1'b0

`define ZEROWORD 32'h00000000

`define INSTRLENGTH 31:0
`define DATALENGTH 31:0 
`define ADDRLENGTH 31:0
`define ALUCONTROL_SIZE 4:0
`define INSTR_INDEX 25:0

`define INSTR_MEM_NUM 16
`define DATA_MEM_NUM 16

`define INSTRSIZE 31:0
`define PCSIZE 31:0

`define OP_SIZE 5:0
`define R_SIZE 4:0
`define IMI_SIZE 15:0
//`define SIG_IMI_SIZE 31:0

`define ALUCONTROL_SIZE 4:0

/****** instruction related ******/
`define EXE_AND 6'b100100//funcode
`define EXE_OR  6'b100101//funcode
`define EXE_XOR 6'b100110//funcode
`define EXE_NOR 6'b100111//funcode
`define EXE_ANDI 6'b001100
`define EXE_ORI 6'b001101
`define EXE_XORI 6'b001110
`define EXE_LUI 6'b001111
`define EXE_NOP 6'b000000

`define EXE_SLL  6'b000000//funcode
`define EXE_SLLV 6'b000100//funcode
`define EXE_SRL  6'b000010//funcode
`define EXE_SRLV 6'b000110//funcode
`define EXE_SRA  6'b000011//funcode
`define EXE_SRAV 6'b000111//funcode

`define EXE_SYNC 6'b001111//funcode
`define EXE_PREF 6'b110011

`define EXE_MOVN 6'b001010
`define EXE_MOVZ 6'b001011
`define EXE_MFHI 6'b010000
`define EXE_MTHI 6'b010001
`define EXE_MFLO 6'b010010
`define EXE_MTLO 6'b010011

`define EXE_SLT 6'b101010
`define EXE_SLTU 6'b101011
`define EXE_SLTI 6'b001010
`define EXE_SLTIU 6'b001011
`define EXE_ADD 6'b100000
`define EXE_ADDU 6'b100001
`define EXE_SUB 6'b100010
`define EXE_SUBU 6'b100011
`define EXE_ADDI 6'b001000
`define EXE_ADDIU 6'b001001
`define EXE_CLZ 6'b100000
`define EXE_CLO 6'b100001

`define EXE_MULT 6'b011000
`define EXE_MULTU 6'b011001
`define EXE_MUL 6'b000010

`define EXE_J 6'b000010
`define EXE_JAL 6'b000011
`define EXE_JALR 6'b001001
`define EXE_JR 6'b001000
`define EXE_BEQ 6'b000100
`define EXE_BGEZ 5'b00001 //[20:15]
`define EXE_BGEZAL 5'b10001
`define EXE_BGTZ 6'b000111
`define EXE_BLEZ 6'b000110
`define EXE_BLTZ 5'b00000
`define EXE_BLTZAL 5'b10000
`define EXE_BNE 6'b000101


`define EXE_SPECIAL_INST 6'b000000//funcode
`define EXE_REGIMM_INST 6'b000001
`define EXE_SPECIAL2_INST 6'b011100

//AluOp 

`define EXE_NOP_OP 8'b00000000
`define EXE_AND_OP 8'b00000001
`define EXE_OR_OP  8'b00000010
`define EXE_NOR_OP 8'b00000011
`define EXE_XOR_OP 8'b00000100

`define EXE_SLL_OP 8'b00000101
`define EXE_SRL_OP 8'b00000110
`define EXE_SRA_OP 8'b00000111

`define EXE_MFHI_OP 8'b00001000
`define EXE_MFLO_OP 8'b00001001
`define EXE_MTHI_OP 8'b00001010
`define EXE_MTLO_OP 8'b00001011
`define EXE_MOVZ_OP 8'b00001100
`define EXE_MOVN_OP 8'b00001101

`define EXE_ADD_OP 8'b00010000
`define EXE_ADDU_OP 8'b00010001
`define EXE_ADDI_OP 8'b00010010
`define EXE_ADDIU_OP 8'b00010011
`define EXE_SUB_OP 8'b00010100
`define EXE_SUBU_OP 8'b00010101
`define EXE_SLT_OP 8'b00010110
`define EXE_SLTU_OP 8'b00010111
`define EXE_CLZ_OP 8'b00011000
`define EXE_CLO_OP 8'b00011001
`define EXE_MUL_OP 8'b00011010
`define EXE_MULT_OP 8'b00011011
`define EXE_MULTU_OP 8'b00011100



//AluSel
`define EXE_RES_LOGIC 3'b001
`define EXE_RES_SHIFT 3'b010
`define EXE_RES_MOVE 3'b011
`define EXE_RES_ARITHMETIC 3'b100
`define EXE_RES_MUL 3'b101
`define EXE_RES_NOP 3'b000


/****** instruction ROM related ******/
`define InstAddrBus 31:0
`define InstBus     31:0
`define InstMemNum  131071
`define InstMemNumLog2 17

/****** regfile related ******/
`define RegAddrBus 4:0
`define RegBus  31:0
`define DoubleRegBus 63:0
`define RegWidth 32
`define RegNum 32
`define RegNumLog2 5
`define NOPRegAddr 5'b00000



`define REGNUM 32
// opcode
`define OP_ALL_ZERO 6'b000000
`define OP_LW 6'b100011
`define OP_ORI 6'b001101
`define OP_REGIMM 6'b000001
`define OP_LW 6'b100011
`define OP_ORI 6'b001101
`define OP_ADDI 6'b001000
`define OP_ADDIU 6'b001001
`define OP_ALL_ZERO 6'b000000
`define OP_SLTI 6'b001010
`define OP_SLTIU 6'b001011
`define OP_BEQ 6'b000100
`define OP_BNE 6'b000101
`define OP_BGTZ 6'b000111
`define OP_BLEZ 6'b000110
`define OP_J 6'b000010
`define OP_JAL 6'b000011
`define OP_ANDI 6'b001100  
`define OP_XORI 6'b001110  
`define OP_LUI 6'b001111  
/*****  load and store instr  *******/
`define OP_LB  6'b100000 
`define OP_LBU 6'b100100
`define OP_LH 6'b100001
`define OP_LHU 6'b100101
`define OP_LW 6'b100011
`define OP_SB 6'b101000
`define OP_SH 6'b101001
`define OP_SW 6'b101011
`define OP_LWL 6'b100010
`define OP_LWR 6'b100110
`define OP_SWL 6'b101010
`define OP_SWR 6'b101110
`define OP_CP0 6'b010000
// opcode over
`define FUNC_ADD 6'b100000
`define FUNC_ADDU 6'b100001
`define FUNC_SRAV 6'b000111

// ALU code
`define ALU_ADD 5'b00010
`define ALU_ADD_OVERFLOW 5'b10010
`define ALU_SUB 5'b00110
`define ALU_OR 5'b00001
`define ALU_NONE 5'b00000
`define ALU_SRAV 5'b00011
// ALU code over
