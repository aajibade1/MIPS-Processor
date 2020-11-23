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
        immtype_curr, halt_curr, jrtype_curr;
    word_t memReg_curr, npc_curr, extOut_curr;//, memReg_n;
    regbits_t wreg_curr;

    logic jaltype_rtemp, ldtype_rtemp, PCSrc_rtemp, Reg_Wen_rtemp, jtype_rtemp, RegDst_rtemp,
        immtype_rtemp, halt_rtemp, jrtype_rtemp;
    word_t memReg_rtemp, npc_rtemp, extOut_rtemp;
    regbits_t wreg_rtemp;
    opcode_t opcode_rtemp;

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
            mif.jrtype_r <= '0;

            memReg_rtemp <= '0;
            npc_rtemp <= '0;
            extOut_rtemp <= '0;
            wreg_rtemp <= '0;
            
            //control signals
            jaltype_rtemp <= '0;
            ldtype_rtemp <= '0;
            PCSrc_rtemp <= '0;
            Reg_Wen_rtemp <= '0;
            jtype_rtemp <= '0;
            //mif.RegDst_r <= '0;
            immtype_rtemp <= '0;
            halt_rtemp <= '0;
            jrtype_rtemp <= '0;

            mif.opcode_r <= opcode_t'('0);
            opcode_rtemp <= opcode_t'('0);
        end
        else if (cpucif.ihit && ~huif.dstall) begin 
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
            mif.jrtype_r <= mif.jrtype;

            memReg_rtemp <= mif.memReg_n;
            npc_rtemp <= mif.npc;
            extOut_rtemp <= mif.extOut;
            wreg_rtemp <= mif.wreg;
            
            //control signals
            jaltype_rtemp <= mif.jaltype;
            ldtype_rtemp <= mif.ldtype;
            PCSrc_rtemp <= mif.PCSrc;
            Reg_Wen_rtemp <= mif.Reg_Wen;
            jtype_rtemp <= mif.jtype;
            //mif.RegDst_r <= mif.RegDst;
            immtype_rtemp <= mif.immtype;
            halt_rtemp <= mif.halt;
            jrtype_rtemp <= mif.jrtype;

            mif.opcode_r <= mif.opcode;
            opcode_rtemp <= mif.opcode;
        end
        else if (cpucif.dhit) begin 
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
            mif.jrtype_r <= mif.jrtype;

            memReg_rtemp <= mif.memReg_n;
            npc_rtemp <= mif.npc;
            extOut_rtemp <= mif.extOut;
            wreg_rtemp <= mif.wreg;
            
            //control signals
            jaltype_rtemp <= mif.jaltype;
            ldtype_rtemp <= mif.ldtype;
            PCSrc_rtemp <= mif.PCSrc;
            Reg_Wen_rtemp <= mif.Reg_Wen;
            jtype_rtemp <= mif.jtype;
            //mif.RegDst_r <= mif.RegDst;
            immtype_rtemp <= mif.immtype;
            halt_rtemp <= mif.halt;
            jrtype_rtemp <= mif.jrtype;

            mif.opcode_r <= mif.opcode;
            opcode_rtemp <= mif.opcode;
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
            mif.jrtype_r <= jrtype_curr;

            memReg_rtemp <= memReg_curr;
            npc_rtemp <= npc_curr;
            extOut_rtemp <= extOut_curr;
            wreg_rtemp <= wreg_curr;

            //control signals
            jaltype_rtemp <= jaltype_curr;
            ldtype_rtemp <= ldtype_curr;
            PCSrc_rtemp <= PCSrc_curr;
            Reg_Wen_rtemp <= Reg_Wen_curr;
            jtype_rtemp <= jtype_curr;
            //mif.RegDst_r <= RegDst_curr;
            immtype_rtemp <= immtype_curr;
            halt_rtemp <= halt_curr;
            jrtype_rtemp <= jrtype_curr;

            mif.opcode_r <= mif.opcode_curr;
            opcode_rtemp <= mif.opcode_curr;
        end
    end
    
    always_comb begin
        if (mif.MemToReg && cpucif.dhit) mif.memReg_n = mif.dmemload;
        else mif.memReg_n = mif.dmemaddr;

        //ff curr values
        memReg_curr = memReg_rtemp;
        npc_curr = npc_rtemp;
        extOut_curr = extOut_rtemp;
        wreg_curr = wreg_rtemp;

        //control signals
        jaltype_curr = jaltype_rtemp;
        ldtype_curr = ldtype_rtemp;
        PCSrc_curr = PCSrc_rtemp;
        Reg_Wen_curr = Reg_Wen_rtemp;
        jtype_curr = jtype_rtemp;
        immtype_curr = immtype_rtemp;
        halt_curr <= halt_rtemp;
        jrtype_curr <= jrtype_rtemp;
        
        mif.opcode_curr = opcode_rtemp;
    end

endmodule