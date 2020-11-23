`include "cpu_types_pkg.vh"
`include "decode_if.vh"
`include "cpu_control_if.vh"
`include "register_file_if.vh"
`include "decoder_if.vh"
`include "extender_if.vh"
`include "hazard_unit_if.vh"
module decode(
    input logic CLK, nRST,
    decode_if.decode dif,
    cpu_control_if cpucif,
    register_file_if rfif,
    decoder_if dcif,
    extender_if exif,
    hazard_unit_if huif
);
    import cpu_types_pkg::*;

    regbits_t wreg_n, wreg_curr, rs_curr, rt_curr;
    word_t  rdat1_curr, rdat2_curr, bdat_curr, bdat_n, extOut_curr, npc_curr, pc_curr, branchAddr_curr;
    logic jaltype_curr, ldtype_curr, PCSrc_curr, Reg_Wen_curr, dwen_curr,
        dren_curr, jtype_curr, MemToReg_curr, jrtype_curr, immtype_curr,
        halt_curr, PCSrc_n, alutype_curr, instr_curr;
    logic branch_curr;
    aluop_t ALUOP_curr;
    opcode_t opcode_curr;
    funct_t funct_curr;
    logic [15:0] imm16_curr;

    word_t rdat1_rtemp, rdat2_rtemp, bdat_rtemp, extOut_rtemp;

    always_ff @ (posedge CLK, negedge nRST)
    begin
        if (nRST == 0) begin
            dif.rdat1_r <= '0;
            dif.rdat2_r <= '0;
            dif.bdat_r <= '0;
            dif.extOut_r <= '0;
            dif.npc_r <= '0;
            dif.wreg_r <= '0;
            dif.rs_r <= '0;
            dif.rt_r <= '0;
            dif.opcode_r <= opcode_t'('0);
            dif.funct_r <= funct_t'(0);
            dif.imm16_r <= '0;
            dif.instr_r <= '0;
            dif.pc_r <= '0;
            //control unit signals
            dif.jaltype_r <= '0;
            dif.ldtype_r <= '0;
            dif.PCSrc_r <= '0;
            dif.Reg_Wen_r <= '0;
            dif.dwen_r <= '0;
            dif.dren_r <= '0;
            dif.jtype_r <= '0;
            dif.MemToReg_r <= '0;
            dif.ALUOP_r <= aluop_t'('0);
            dif.jrtype_r <= '0;
            dif.immtype_r <= '0;
            dif.halt_r <= '0;
            dif.alutype_r <= '0;
            dif.branchAddr_r <= '0;

            dif.branch_r <= '0;
        end
        else if (cpucif.ihit) begin
            //non-control unit signals
            if (huif.stall) begin
                dif.rdat1_r <= '0;
                dif.rdat2_r <= '0;
                dif.bdat_r <= '0;
                dif.extOut_r <= '0;
                dif.npc_r <= '0;
                dif.wreg_r <= '0;
                dif.rs_r <= '0;
                dif.rt_r <= '0;
                dif.opcode_r <= opcode_t'('0);
                dif.funct_r <= funct_t'(0);
                dif.instr_r <= '0;
                dif.pc_r <= '0;
                //control unit signals
                dif.jaltype_r <= '0;
                dif.ldtype_r <= '0;
                dif.PCSrc_r <= '0;
                dif.Reg_Wen_r <= '0;
                dif.dwen_r <= '0;
                dif.dren_r <= '0;
                dif.jtype_r <= '0;
                dif.MemToReg_r <= '0;
                dif.ALUOP_r <= aluop_t'('0);
                dif.jrtype_r <= '0;
                dif.immtype_r <= '0;
                dif.halt_r <= '0;
                dif.alutype_r <= '0;
                dif.imm16_r <= '0;
                dif.branchAddr_r <= '0;

                dif.branch_r <= '0;
            end
            else begin
                dif.rdat1_r <= rfif.rdat1;
                dif.rdat2_r <= rfif.rdat2;
                dif.bdat_r <= bdat_n;
                dif.extOut_r <= exif.imm32;
                dif.npc_r <= dif.npc;
                dif.wreg_r <= wreg_n;
                dif.opcode_r <= dcif.opcode;
                dif.funct_r <= dcif.funct;
                dif.rs_r <= dcif.rs;
                dif.rt_r <= dcif.rt;
                dif.imm16_r <= dcif.imm16;
                dif.instr_r <= dif.instr;
                dif.pc_r <= dif.pc;
                dif.branchAddr_r <= dif.branchAddr;
                //control unit signals
                dif.jaltype_r <= cpucif.jaltype;
                dif.ldtype_r <= cpucif.ldtype;
                dif.PCSrc_r <= cpucif.PCSrc;
                dif.Reg_Wen_r <= cpucif.Reg_Wen;
                dif.dwen_r <= cpucif.dwen;
                dif.dren_r <= cpucif.dren;
                dif.jtype_r <= cpucif.jtype;
                dif.MemToReg_r <= cpucif.MemToReg;
                dif.ALUOP_r <= cpucif.ALUOP;
                dif.jrtype_r <= cpucif.jrtype;
                dif.immtype_r <= cpucif.immtype;
                dif.halt_r <= cpucif.halt;
                dif.alutype_r <= cpucif.alutype;

                dif.branch_r <= dif.branch;
            end
        end
        else begin
            dif.rdat1_r <= rdat1_curr;
            dif.rdat2_r <= rdat2_curr;
            dif.bdat_r <= bdat_curr;
            dif.extOut_r <= extOut_curr;
            dif.npc_r <= npc_curr;
            dif.wreg_r <= wreg_curr;
            dif.rs_r <= rs_curr;
            dif.rt_r <= rt_curr;
            dif.opcode_r <= opcode_curr;
            dif.funct_r <= funct_curr;
            dif.imm16_r <= imm16_curr;
            dif.pc_r <= pc_curr;
            //control unit signals
            dif.jaltype_r <= jaltype_curr;
            dif.ldtype_r <= ldtype_curr;
            dif.PCSrc_r <= PCSrc_curr;
            dif.Reg_Wen_r <= Reg_Wen_curr;
            dif.dwen_r <= dwen_curr;
            dif.dren_r <= dren_curr;
            dif.jtype_r <= jtype_curr;
            dif.MemToReg_r <= MemToReg_curr;
            dif.ALUOP_r <= ALUOP_curr;
            dif.jrtype_r <= jrtype_curr;
            dif.immtype_r <= immtype_curr;
            dif.halt_r <= halt_curr;
            dif.alutype_r <= alutype_curr;
            dif.instr_r <= instr_curr;
            dif.branchAddr_r <= dif.branchAddr;

            dif.branch_r <= branch_curr;
        end
    end

    always_comb begin

        //decoder
        dcif.instr = dif.instr;
        if (cpucif.jaltype) wreg_n = 31;
        else begin
            if (cpucif.RegDst) wreg_n = dcif.rt;
            else wreg_n = dcif.rd;
        end

        //decoder to rf
        if (cpucif.jrtype) begin
            rfif.rsel1 = 31;
        end
        else begin
            rfif.rsel1 = dcif.rs;
        end

        rfif.rsel2 = dcif.rt;

        //rf
        if (cpucif.alutype) begin
            bdat_n = exif.imm32;
        end
        else begin
            bdat_n = rfif.rdat2;
        end

        //extender
        exif.ExtOp = cpucif.ExtOp;
        exif.immtype = cpucif.immtype;
        exif.imm16 = dcif.imm16;
        exif.imm26 = dcif.imm26;

        //ff curr values
        //non-control unit signals
        rdat1_curr = dif.rdat1_r;
        rdat2_curr = dif.rdat2_r;
        bdat_curr = dif.bdat_r;
        extOut_curr = dif.extOut_r;
        npc_curr = dif.npc_r;
        wreg_curr = dif.wreg_r;
        rs_curr = dif.rs_r;
        rt_curr = dif.rt_r;
        opcode_curr = dif.opcode_r;
        funct_curr = dif.funct_r;
        imm16_curr = dif.imm16_r;
        instr_curr = dif.instr_r;
        pc_curr = dif.pc_r;
        branchAddr_curr = dif.branchAddr_r;
        //control unit signals
        jaltype_curr = dif.jaltype_r;
        ldtype_curr = dif.ldtype_r;
        PCSrc_curr = dif.PCSrc_r;
        Reg_Wen_curr = dif.Reg_Wen_r;
        dwen_curr = dif.dwen_r;
        dren_curr = dif.dren_r;
        jtype_curr = dif.jtype_r;
        MemToReg_curr = dif.MemToReg_r;
        ALUOP_curr = dif.ALUOP_r;
        jrtype_curr = dif.jrtype_r;
        immtype_curr = dif.immtype_r;
        halt_curr = dif.halt_r;
        alutype_curr = dif.alutype_r;
        branch_curr = dif.branch_r;
    end

endmodule