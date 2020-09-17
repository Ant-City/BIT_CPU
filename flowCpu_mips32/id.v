`timescale 1ns / 1ps
`include "defines.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: BIT
// Engineer: Lixiang
// 
// Create Date: 09/14/2020 01:21:06 PM
// Design Name: 
// Module Name: id
// Project Name: flowCPU_mips
// Target Devices: 
// Tool Versions: 
// Description: this module is for storing the Inst and InstAddr and pass them on 
// at next clk
// 
// Dependencies: 
// 
// Revision: 0.1
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module id(
    input rst,
    input clk,

    input wire[`InstAddrBus]    pc_i,
    input wire[`InstBus]        inst_i,

    input wire[`RegBus]         reg_data1_i,
    input wire[`RegBus]         reg_data2_i,

    output reg                  en_reg_read1_o,
    output reg                  en_reg_read2_o,
    output reg[`RegAddrBus]     reg_addr1_o,
    output reg[`RegAddrBus]     reg_addr2_o,

    output reg[`AluOpBus]       aluop_o,
    output reg[`AluSelBus]      alusel_o,
    output reg[`RegBus]         reg1_o,
    output reg[`RegBus]         reg2_o,
    output reg[`RegAddrBus]     wd_o,
    output reg                  wreg_o,

    //处于执行阶段指令的运算结果
    input wire ex_wreg_i,
    input wire[`RegBus] ex_wdata_i,
    input wire[`RegAddrBus] ex_wd_i,
    //处于访存阶段指令的晕眩结果
    input wire mem_wreg_i,
    input wire[`RegBus] mem_wdata_i,
    input wire[`RegAddrBus] mem_wd_i


);
    wire[5:0] op = inst_i[31:26];
    wire[5:0] funcode = inst_i[5:0];
    wire[4:0] sa = inst_i[10:6];
    wire[4:0] rt = inst_i[20:16];

    reg[`RegBus] imm;
    reg instValid;

    always @(*) begin
        if(rst == `RESETABLE) begin
            aluop_o  <= `EXE_NOP_OP;
            alusel_o <= `EXE_RES_NOP;
            wd_o <= `NOPRegAddr;
            wreg_o <= `UNWRITEABLE;
            en_reg_read1_o <= 1'b0;
            en_reg_read2_o <= 1'b0;
            reg_addr1_o <= `NOPRegAddr;
            reg_addr2_o <= `NOPRegAddr;
            imm <= 32'h0;
            instValid <= `InstValid;
        end else begin
            
            aluop_o  <= `EXE_NOP_OP;
            alusel_o <= `EXE_RES_NOP;
            wd_o <= inst_i[15:11];
            wreg_o <= `UNWRITEABLE;
            en_reg_read1_o <= 1'b0;
            en_reg_read2_o <= 1'b0;
            reg_addr1_o <= inst_i[25:21];
            reg_addr2_o <= inst_i[20:16];
            imm <= 32'h0;
            instValid <= `InstValid;
            
             case(op)
                `EXE_SPECIAL_INST: begin
                    case(sa)
                        5'b00000: begin
                            case(funcode)
                                `EXE_OR: begin
                                    
                                end
                                `EXE_AND: begin
                                    
                                end
                                `EXE_XOR: begin
                                    
                                end
                                `EXE_NOR: begin
                                    
                                end
                                `EXE_SLLV:begin
                                    
                                end
                                `EXE_SRLV: begin
                                    
                                end
                                `EXE_SRAV: begin
                                    
                                end
                                default: begin
                                end
                            endcase
                        end
                        default: begin
                        end
                    endcase  
                end

                `EXE_ORI: begin
                    wreg_o <= `WRITEABLE;
                    aluop_o <= `EXE_OR_OP;
                    alusel_o <= `EXE_RES_LOGIC;
                    en_reg_read1_o <= 1'b1;
                    en_reg_read2_o <= 1'b0;
                    imm <= {16'h0, inst_i[15:0]};
                    wd_o <= inst_i[20:16];
                    instValid <= `InstValid;
                end
                `EXE_ANDI: begin
                    wreg_o <= `WRITEABLE;
                    aluop_o <= `EXE_AND_OP;
                    alusel_o <= `EXE_RES_LOGIC;
                    en_reg_read1_o <= 1'b1;
                    en_reg_read2_o <= 1'b0;
                    imm <= {16'h0, inst_i[15:0]};
                    wd_o <= inst_i[20:16];
                    instValid <= `InstValid;
                end
                `EXE_XORI: begin
                    wreg_o <= `WRITEABLE;
                    aluop_o <= `EXE_XOR_OP;
                    alusel_o <= `EXE_RES_LOGIC;
                    en_reg_read1_o <= 1'b1;
                    en_reg_read2_o <= 1'b0;
                    imm <= {16'h0, inst_i[15:0]};
                    wd_o <= inst_i[20:16];
                    instValid <= `InstValid;
                end
                `EXE_LUI: begin
                    wreg_o <= `WRITEABLE;
                    aluop_o <= `EXE_OR_OP;
                    alusel_o <= `EXE_RES_LOGIC;
                    en_reg_read1_o <= 1'b1;
                    en_reg_read2_o <= 1'b0;
                    imm <= { inst_i[15:0], 16'h0};
                    wd_o <= inst_i[20:16];
                    instValid <= `InstValid;
                end                                                
                default: begin
                end
             endcase //case op
            if(inst_i[31:21] == 11'b00000000000) begin
                if(funcode == `EXE_SLL) begin
                    wreg_o <= `WRITEABLE;
                    aluop_o <= `EXE__SLL_OP;
                    alusel_o <= `EXE_RES_SHIFT;
                    en_reg_read1_o <= 1'b0;
                    en_reg_read2_o <= 1'b1;
                    imm[4:0] <= inst_i[10:6];
                    wd_o <= inst_i[15:11];
                    instValid <= `InstValid;

                end else if(funcode == `EXE_SRL) begin
                    wreg_o <= `WRITEABLE;
                    aluop_o <= `EXE__SRL_OP;
                    alusel_o <= `EXE_RES_SHIFT;
                    en_reg_read1_o <= 1'b0;
                    en_reg_read2_o <= 1'b1;
                    imm[4:0] <= inst_i[10:6];
                    wd_o <= inst_i[15:11];
                    instValid <= `InstValid;
                end else if(funcode == `EXE_SRA) begin
                    wreg_o <= `WRITEABLE;
                    aluop_o <= `EXE__SRA_OP;
                    alusel_o <= `EXE_RES_SHIFT;
                    en_reg_read1_o <= 1'b0;
                    en_reg_read2_o <= 1'b1;
                    imm[4:0] <= inst_i[10:6];
                    wd_o <= inst_i[15:11];
                    instValid <= `InstValid;
                end

            end
        end
    end

    always @(*) begin
        if(rst == `RESETABLE) begin
            reg1_o <= `ZEROWORD;
        //执行阶段数据前推
        end else if(en_reg_read1_o == 1'b1 && ex_wreg_i == 1'b1 && ex_wdata_i == reg_addr1_o) begin
            reg1_o <= ex_wdata_i;
        //访存阶段数据前推
        end else if(en_reg_read1_o == 1'b1 && mem_wreg_i == 1'b1 && mem_wdata_i == reg_addr1_o) begin
            reg1_o <= mem_wdata_i;
        end else if(en_reg_read1_o == 1'b1) begin
            reg1_o <= reg_data1_i;
        end else if(en_reg_read1_o == 1'b0) begin
            reg1_o <= imm;
        end else begin
            reg1_o <= `ZEROWORD;
        end
    end

    always @(*) begin
        if(rst == `RESETABLE) begin
            reg2_o <= `ZEROWORD;
        //执行阶段数据前推
        end else if(en_reg_read2_o == 1'b1 && ex_wreg_i == 1'b1 && ex_wdata_i == reg_addr2_o) begin
            reg2_o <= ex_wdata_i;
        //访存阶段数据前推
        end else if(en_reg_read2_o == 1'b1 && mem_wreg_i == 1'b1 && mem_wdata_i == reg_addr2_o) begin
            reg2_o <= mem_wdata_i;
        end else if(en_reg_read2_o == 1'b1) begin
            reg2_o <= reg_data1_i;
        end else if(en_reg_read2_o == 1'b0) begin
            reg2_o <= imm;
        end else begin
            reg2_o <= `ZEROWORD;
        end
    end
    
endmodule