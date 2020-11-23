`include "cpu_types_pkg.vh"
`include "execute_if.vh"
`include "alu_if.vh"
`include "cpu_control_if.vh"
`include "hazard_unit_if.vh"

module execute(
    input logic CLK, nRST,
    execute_if.execute eif,
    alu_if.tb aluif,
    cpu_control_if cpucif,
    hazard_unit_if huif
);
    import cpu_types_pkg::*;


    logic jaltype_curr, ldtype_curr, PCSrc_curr, Reg_Wen_curr, dwen_curr, dren_curr,
        jtype_curr, RegDst_curr, MemToReg_curr, immtype_curr, halt_curr, jrtype_curr;
    regbits_t wreg_curr, wb_rt_curr, wb_rs_curr, wb_rt_rtemp, wb_rs_rtemp;
    word_t portOut_curr, Zero_curr, npc_curr, dstore_curr, extOut_curr, wb_instr_curr, wb_pc_curr, wb_branchAddr_curr;
    funct_t wb_funct_curr, wb_funct_rtemp;
    opcode_t wb_opcode_curr, wb_opcode_rtemp;
    logic[15:0] wb_imm16_curr, wb_imm16_rtemp;

    word_t portOut_rtemp, npc_rtemp, dstore_rtemp, extOut_rtemp, wb_instr_rtemp, wb_pc_rtemp, wb_branchAddr_rtemp;
    logic Zero_rtemp, jaltype_rtemp, ldtype_rtemp, PCSrc_rtemp, Reg_Wen_rtemp,
            dwen_rtemp, dren_rtemp, jtype_rtemp, MemToReg_rtemp, immtype_rtemp,
            wreg_rtemp, halt_rtemp, jrtype_rtemp;

    logic branch_rtemp, branch_curr;

    always_ff @ (posedge CLK, negedge nRST)
    begin
        if (nRST == 0) begin
            eif.portOut_r <= '0;
            eif.Zero_r <= '0;
            eif.npc_r <= '0;
            eif.dstore_r <= '0;
            eif.extOut_r <= '0;
            eif.wreg_r <= '0;

            //control signals
            eif.jaltype_r <= '0;
            eif.ldtype_r <= '0;
            eif.PCSrc_r <= '0;
            eif.Reg_Wen_r <= '0;
            eif.dwen_r <= '0;
            eif.dren_r <= '0;
            eif.jtype_r <= '0;
            eif.MemToReg_r <= '0;
            eif.immtype_r <= '0;
            eif.halt_r <= '0;
            eif.jrtype_r <= '0;

            eif.wb_funct_r <= funct_t'(0);
            eif.wb_opcode_r <= opcode_t'(0);
            eif.wb_rs_r <= '0;
            eif.wb_rt_r <= '0;
            eif.wb_instr_r <= '0;
            eif.wb_pc_r <= '0;
            eif.wb_imm16_r <= '0;
            eif.wb_branchAddr_r <= '0;


            portOut_rtemp <= '0;
            Zero_rtemp <= '0;
            npc_rtemp <= '0;
            dstore_rtemp <= '0;
            extOut_rtemp <= '0;
            wreg_rtemp <= '0;
            jaltype_rtemp <= '0;
            ldtype_rtemp <= '0;
            PCSrc_rtemp <= '0;
            Reg_Wen_rtemp <= '0;
            dwen_rtemp <= '0;
            dren_rtemp <= '0;
            jtype_rtemp <= '0;
            MemToReg_rtemp <= '0;
            immtype_rtemp <= '0;
            halt_rtemp <= '0;
            jrtype_rtemp <= '0;

            eif.branch_r <= '0;
            branch_rtemp <= '0;
        end
        else if (eif.dhit) begin
            eif.portOut_r <= '0;
            eif.Zero_r <= '0;
            eif.npc_r <= '0;
            eif.dstore_r <= '0;
            eif.extOut_r <= '0;
            eif.wreg_r <= '0;

            eif.wb_funct_r <= funct_t'(0);
            eif.wb_opcode_r <= opcode_t'(0);
            eif.wb_rs_r <= '0;
            eif.wb_rt_r <= '0;
            eif.wb_instr_r <= '0;
            eif.wb_pc_r <= '0;
            eif.wb_imm16_r <= '0;
            eif.wb_branchAddr_r <= '0;

            //control signals
            eif.jaltype_r <= '0;
            eif.ldtype_r <= '0;
            eif.PCSrc_r <= '0;
            eif.Reg_Wen_r <= '0;
            eif.dwen_r <= '0;
            eif.dren_r <= '0;
            eif.jtype_r <= '0;
            eif.MemToReg_r <= '0;
            eif.immtype_r <= '0;
            eif.halt_r <= '0;
            eif.jrtype_r <= '0;

            //temp signals
            portOut_rtemp <= portOut_curr;
            Zero_rtemp <= Zero_curr;
            npc_rtemp <= npc_curr;
            dstore_rtemp <= dstore_curr;
            extOut_rtemp <= extOut_curr;
            wreg_rtemp <= wreg_curr;
            jaltype_rtemp <= jaltype_curr;
            ldtype_rtemp <= ldtype_curr;
            PCSrc_rtemp <= PCSrc_curr;
            Reg_Wen_rtemp <= Reg_Wen_curr;
            dwen_rtemp <= dwen_curr;
            dren_rtemp <= dren_curr;
            jtype_rtemp <= jtype_curr;
            MemToReg_rtemp <= MemToReg_curr;
            immtype_rtemp <= immtype_curr;
            halt_rtemp <= halt_curr;
            jrtype_rtemp <= jrtype_curr;

            eif.branch_r <= '0;
            branch_rtemp <= branch_curr;
        end
        else if (cpucif.ihit) begin
            eif.portOut_r <= aluif.portOut;
            eif.Zero_r <= aluif.Zero;
            eif.npc_r <= eif.npc;
            eif.dstore_r <= eif.dstore;
            eif.extOut_r <= eif.extOut;
            eif.wreg_r <= eif.wreg;

            eif.wb_funct_r <= eif.wb_funct;
            eif.wb_opcode_r <= eif.wb_opcode;
            eif.wb_rs_r <= eif.wb_rs;
            eif.wb_rt_r <= eif.wb_rt;
            eif.wb_instr_r <= eif.wb_instr;
            eif.wb_pc_r <= eif.wb_pc;
            eif.wb_imm16_r <= eif.wb_imm16;
            eif.wb_branchAddr_r <= eif.wb_branchAddr;

            //control signals
            eif.jaltype_r <= eif.jaltype;
            eif.ldtype_r <= eif.ldtype;
            eif.PCSrc_r <= eif.PCSrc_n;
            eif.Reg_Wen_r <= eif.Reg_Wen;
            eif.dwen_r <= eif.dwen;
            eif.dren_r <= eif.dren;
            eif.jtype_r <= eif.jtype;
            eif.MemToReg_r <= eif.MemToReg;
            eif.immtype_r <= eif.immtype;
            eif.halt_r <= eif.halt;
            eif.jrtype_r <= eif.jrtype;

            //temp signals
            portOut_rtemp <= aluif.portOut;
            Zero_rtemp <= aluif.Zero;
            npc_rtemp <= eif.npc;
            dstore_rtemp <= eif.dstore;
            extOut_rtemp <= eif.extOut;
            wreg_rtemp <= eif.wreg;
            jaltype_rtemp <= eif.jaltype;
            ldtype_rtemp <= eif.ldtype;
            PCSrc_rtemp <= eif.PCSrc_n;
            Reg_Wen_rtemp <= eif.Reg_Wen;
            dwen_rtemp <= eif.dwen;
            dren_rtemp <= eif.dren;
            jtype_rtemp <= eif.jtype;
            MemToReg_rtemp <= eif.MemToReg;
            immtype_rtemp <= eif.immtype;
            halt_rtemp <= eif.halt;
            jrtype_rtemp <= eif.jrtype;

            eif.branch_r <= eif.branch;
            branch_rtemp <= eif.branch;
        end
        else begin
            eif.portOut_r <= portOut_curr;
            eif.Zero_r <= Zero_curr;
            eif.npc_r <= npc_curr;
            eif.dstore_r <= dstore_curr;
            eif.extOut_r <= extOut_curr;
            eif.wreg_r <= wreg_curr;

            eif.wb_funct_r <= wb_funct_curr;
            eif.wb_opcode_r <= wb_opcode_curr;
            eif.wb_rs_r <= wb_rs_curr;
            eif.wb_rt_r <= wb_rt_curr;
            eif.wb_instr_r <= wb_instr_curr;
            eif.wb_pc_r <= wb_pc_curr;
            eif.wb_imm16_r <= wb_imm16_curr;
            eif.wb_branchAddr_r <= wb_branchAddr_curr;


            //control signals
            eif.jaltype_r <= jaltype_curr;
            eif.ldtype_r <= ldtype_curr;
            eif.PCSrc_r <= PCSrc_curr;
            eif.Reg_Wen_r <= Reg_Wen_curr;
            eif.dwen_r <= dwen_curr;
            eif.dren_r <= dren_curr;
            eif.jtype_r <= jtype_curr;
            eif.MemToReg_r <= MemToReg_curr;
            eif.immtype_r <= immtype_curr;
            eif.halt_r <= halt_curr;
            eif.jrtype_r <= jrtype_curr;
            //temp signals
            portOut_rtemp <= portOut_curr;
            Zero_rtemp <= Zero_curr;
            npc_rtemp <= npc_curr;
            dstore_rtemp <= dstore_curr;
            extOut_rtemp <= extOut_curr;
            wreg_rtemp <= wreg_curr;
            jaltype_rtemp <= jaltype_curr;
            ldtype_rtemp <= ldtype_curr;
            PCSrc_rtemp <= PCSrc_curr;
            Reg_Wen_rtemp <= Reg_Wen_curr;
            dwen_rtemp <= dwen_curr;
            dren_rtemp <= dren_curr;
            jtype_rtemp <= jtype_curr;
            MemToReg_rtemp <= MemToReg_curr;
            immtype_rtemp <= immtype_curr;
            halt_rtemp <= halt_curr;
            jrtype_rtemp <= jrtype_curr;

            eif.branch_r <= branch_curr;
            branch_rtemp <= branch_curr;
        end
    end

    always_comb begin
        if (eif.forwardA == 2'b10) begin
            aluif.portA = eif.rd_mem;
        end
        else if (eif.forwardA == 2'b01) begin
            aluif.portA = eif.rd_wb;
        end
        else begin
            aluif.portA = eif.portA;
        end

        if (eif.forwardB == 2'b10) begin
            aluif.portB = eif.rd_mem;
        end
        else if (eif.forwardB == 2'b01) begin
            aluif.portB = eif.rd_wb;
        end
        else begin
            if (eif.jrtype) aluif.portB = '0;
            else aluif.portB = eif.portB;
        end

        aluif.ALUOP = eif.ALUOP;

        //PCSrc for branch exception
        if (eif.opcode == BEQ) begin
            if (aluif.Zero) eif.PCSrc_n = 1;
            else eif.PCSrc_n = 0;
        end
        else if (eif.opcode == BNE) begin
            if (aluif.Zero) eif.PCSrc_n = 0;
            else eif.PCSrc_n = 1;
        end
        else begin
            eif.PCSrc_n = eif.PCSrc;
        end

        //ff curr values
        if (eif.dhit) begin
            portOut_curr = portOut_rtemp;
            Zero_curr = Zero_rtemp;
            npc_curr = npc_rtemp;
            dstore_curr = dstore_rtemp;
            extOut_curr = extOut_rtemp;

            //control signals
            jaltype_curr = jaltype_rtemp;
            ldtype_curr = ldtype_rtemp;
            PCSrc_curr = PCSrc_rtemp;
            Reg_Wen_curr = Reg_Wen_rtemp;
            dwen_curr = dwen_rtemp;
            dren_curr = dren_rtemp;
            jtype_curr = jtype_rtemp;
            MemToReg_curr = MemToReg_rtemp;
            immtype_curr = immtype_rtemp;
            wreg_curr = wreg_rtemp;
            halt_curr = halt_rtemp;
            jrtype_curr = jrtype_rtemp;

            wb_funct_curr = wb_funct_rtemp;
            wb_opcode_curr = wb_opcode_rtemp;
            wb_rs_curr = wb_rs_rtemp;
            wb_rt_curr = wb_rt_rtemp;
            wb_instr_curr = wb_instr_rtemp;
            wb_pc_curr = wb_pc_rtemp;
            wb_imm16_curr = wb_imm16_rtemp;
            wb_branchAddr_curr = wb_branchAddr_rtemp;

        end
        else begin
            portOut_curr = eif.portOut_r;
            Zero_curr = eif.Zero_r;
            npc_curr = eif.npc_r;
            dstore_curr = eif.dstore_r;
            extOut_curr = eif.extOut_r;

            wb_funct_curr = eif.wb_funct_r;
            wb_opcode_curr = eif.wb_opcode_r;
            wb_rs_curr = eif.wb_rs_r;
            wb_rt_curr = eif.wb_rt_r;
            wb_instr_curr = eif.wb_instr_r;
            wb_pc_curr = eif.wb_pc_r;
            wb_imm16_curr = eif.wb_imm16_r;
            wb_branchAddr_curr = eif.wb_branchAddr_r;


            //control signals
            jaltype_curr = eif.jaltype_r;
            ldtype_curr = eif.ldtype_r;
            PCSrc_curr = eif.PCSrc_r;
            Reg_Wen_curr = eif.Reg_Wen_r;
            dwen_curr = eif.dwen_r;
            dren_curr = eif.dren_r;
            jtype_curr = eif.jtype_r;
            MemToReg_curr = eif.MemToReg_r;
            immtype_curr = eif.immtype_r;
            wreg_curr = eif.wreg_r;
            halt_curr = eif.halt_r;
            jrtype_curr = eif.jrtype_r;

            branch_curr <= eif.branch_r;
        end

    end

endmodule