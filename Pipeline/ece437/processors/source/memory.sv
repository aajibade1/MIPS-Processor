`include "cpu_types_pkg.vh"
`include "memory_if.vh"
`include "cpu_control_if.vh"
`include "hazard_unit_if.vh"
module memory(
    input logic CLK, nRST,
    memory_if.mem mif,
    cpu_control_if cpucif,
    hazard_unit_if huif,
    pc_if pcif
);
    import cpu_types_pkg::*;
    

    logic jaltype_curr, ldtype_curr, PCSrc_curr, Reg_Wen_curr, jtype_curr, RegDst_curr,
        immtype_curr, halt_curr;
    word_t memReg_curr, npc_curr, extOut_curr, dstore_curr;//, memReg_n;
    regbits_t wreg_curr;
    word_t wb_instr_curr, wb_pc_curr,wb_branchAddr_curr, wb_portout_curr;
    logic[15:0] wb_imm16_curr;
    funct_t wb_funct_curr;
    opcode_t wb_opcode_curr;
    regbits_t wb_rs_curr, wb_rt_curr;


    always_ff @ (posedge CLK, negedge nRST)
    begin
        if (nRST == 0) begin
            mif.memReg_r <= '0;
            mif.npc_r <= '0;
            mif.extOut_r <= '0;
            mif.wreg_r <= '0;
            
            //control signals
            mif.jaltype_r <= '0;
            mif.ldtype_r <= '0;
            mif.PCSrc_r <= '0;
            mif.Reg_Wen_r <= '0;
            mif.jtype_r <= '0;
            //mif.RegDst_r <= '0;
            mif.immtype_r <= '0;
            mif.halt_r <= '0;
            mif.dstore_r <= '0;
            mif.wb_funct_r <= funct_t'('0);
            mif.wb_opcode_r <= opcode_t'('0);
            mif.wb_rs_r <= '0;
            mif.wb_rt_r <= '0;
            mif.wb_instr_r <= '0;
            mif.wb_pc_r <= '0;
            mif.wb_portout_r <= '0;
            mif.wb_imm16_r <= '0;
            mif.wb_branchAddr_r <= '0;
        end
        else if (cpucif.ihit || mif.dhit) begin 
            mif.memReg_r <= mif.memReg_n;
            mif.npc_r <= mif.npc;
            mif.extOut_r <= mif.extOut;
            mif.wreg_r <= mif.wreg;

            //control signals
            mif.jaltype_r <= mif.jaltype;
            mif.ldtype_r <= mif.ldtype;
            mif.PCSrc_r <= mif.PCSrc;
            mif.Reg_Wen_r <= mif.Reg_Wen;
            mif.jtype_r <= mif.jtype;
            //mif.RegDst_r <= mif.RegDst;
            mif.immtype_r <= mif.immtype;
            mif.halt_r <= mif.halt;
            mif.dstore_r <= mif.dstore;
            mif.wb_funct_r <= mif.wb_funct;
            mif.wb_opcode_r <= mif.wb_opcode;
            mif.wb_rs_r <= mif.wb_rs;
            mif.wb_rt_r <= mif.wb_rt;
            mif.wb_instr_r <= mif.wb_instr;
            mif.wb_pc_r <= mif.wb_pc;
            mif.wb_portout_r <= mif.wb_portout;
            mif.wb_imm16_r <= mif.wb_imm16;
            mif.wb_branchAddr_r <= mif.wb_branchAddr;
        end
        else begin
            mif.memReg_r <= memReg_curr;
            mif.npc_r <= npc_curr;
            mif.extOut_r <= extOut_curr;
            mif.wreg_r <= wreg_curr;

            //control signals
            mif.jaltype_r <= jaltype_curr;
            mif.ldtype_r <= ldtype_curr;
            mif.PCSrc_r <= PCSrc_curr;
            mif.Reg_Wen_r <= Reg_Wen_curr;
            mif.jtype_r <= jtype_curr;
            //mif.RegDst_r <= RegDst_curr;
            mif.immtype_r <= immtype_curr;
            mif.halt_r <= halt_curr;
            mif.dstore_r <= dstore_curr;
            mif.wb_funct_r <= wb_funct_curr;
            mif.wb_opcode_r <= wb_opcode_curr;
            mif.wb_rs_r <= wb_rs_curr;
            mif.wb_rt_r <= wb_rt_curr;
            mif.wb_instr_r <= wb_instr_curr;
            mif.wb_pc_r <= wb_pc_curr;
            mif.wb_portout_r <= wb_portout_curr;
            mif.wb_imm16_r <= wb_imm16_curr;
            mif.wb_branchAddr_r <= wb_branchAddr_curr;
        end
    end
    
    always_comb begin
        if (mif.MemToReg && mif.dhit) mif.memReg_n = mif.dmemload;
        else mif.memReg_n = mif.dmemaddr;

        //ff curr values
        memReg_curr = mif.memReg_r;
        npc_curr = mif.npc_r;
        extOut_curr = mif.extOut_r;
        wreg_curr = mif.wreg_r;

        //control signals
        jaltype_curr = mif.jaltype_r;
        ldtype_curr = mif.ldtype_r;
        PCSrc_curr = mif.PCSrc_r;
        Reg_Wen_curr = mif.Reg_Wen_r;
        jtype_curr = mif.jtype_r;
        //RegDst_curr = mif.RegDst_r;
        immtype_curr = mif.immtype_r;
        halt_curr = mif.halt_r;
        dstore_curr = mif.dstore_r;
        wb_funct_curr = mif.wb_funct_r;
        wb_opcode_curr = mif.wb_opcode_r;
        wb_rs_curr = mif.wb_rs_r;
        wb_rt_curr = mif.wb_rt_r;
        wb_instr_curr = mif.wb_instr_r;
        wb_pc_curr = mif.wb_pc_r;
        wb_portout_curr = mif.wb_portout_r;
        wb_imm16_curr = mif.wb_imm16_r;
        wb_branchAddr_curr = mif.wb_branchAddr_r;
        /*pcif.jtype = mif.jtype;
        pcif.PCSrc = mif.PCSrc;
        pcif.immAddr = mif.extOut;
        pcif.aluAddr = memReg_n;
        pcif.immtype = mif.immtype;
        pcif.npc = mif.npc;*/
        mif.wbEN = cpucif.ihit || mif.dhit;

    end

endmodule