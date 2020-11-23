`include "cpu_types_pkg.vh"
`include "memory_if.vh"
`include "cpu_control_if.vh"
`include "hazard_unit_if.vh"
module memory(
    input logic CLK, nRST,
    memory_if.mem mif,
    cpu_control_if cpucif,
    hazard_unit_if huif
);
    import cpu_types_pkg::*;
    

    logic jaltype_curr, ldtype_curr, PCSrc_curr, Reg_Wen_curr, jtype_curr, RegDst_curr,
        immtype_curr, halt_curr, jrtype_curr;
    word_t memReg_curr, memReg_nCurr, npc_curr, extOut_curr;//, memReg_n;
    regbits_t wreg_curr;
    
    funct_t funct_curr;
    regbits_t rs_curr, rt_curr;
    word_t instr_curr, dstore_curr, portO_curr;
    logic [15:0] imm16_curr;
    /*logic jaltype_rtemp, ldtype_rtemp, PCSrc_rtemp, Reg_Wen_rtemp, jtype_rtemp, RegDst_rtemp,
        immtype_rtemp, halt_rtemp, jrtype_rtemp;
    word_t memReg_rtemp, npc_rtemp, extOut_rtemp;
    regbits_t wreg_rtemp;
    opcode_t opcode_rtemp;*/

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
            mif.opcode_r <= opcode_t'('0);
            
            mif.funct_r <= funct_t'('0);
            mif.rs_r <= '0;
            mif.rt_r <= '0;
            mif.instr_r <= '0;
            mif.dstore_r <= '0;
            mif.imm16_r <= '0;
            mif.portO_r <= '0;
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
            mif.opcode_r <= mif.opcode_curr;
            
            mif.funct_r <= funct_curr;
            mif.rs_r <= rs_curr;
            mif.rt_r <= rt_curr;
            mif.instr_r <= instr_curr;
            mif.dstore_r <= dstore_curr;
            mif.imm16_r <= imm16_curr;
            mif.portO_r <= portO_curr;
        end
    end
    
    always_comb begin
        if (mif.MemToReg && cpucif.dhit) mif.memReg_n = mif.dmemload;
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
        immtype_curr = mif.immtype_r;
        halt_curr = mif.halt_r;
        jrtype_curr = mif.jrtype_r;
        mif.opcode_curr = mif.opcode_r;
        
        funct_curr = mif.funct_r;
        rs_curr = mif.rs_r;
        rt_curr = mif.rt_r;
        instr_curr = mif.instr_r;
        dstore_curr = mif.dstore_r;
        imm16_curr = mif.imm16_r;
        portO_curr = mif.portO_r;

        if (huif.dstall) begin
            if (cpucif.dhit) begin
                memReg_curr = mif.memReg_n;
                npc_curr = mif.npc;
                extOut_curr = mif.extOut;
                wreg_curr = mif.wreg;

                //control signals
                jaltype_curr = mif.jaltype;
                ldtype_curr = mif.ldtype;
                PCSrc_curr = mif.PCSrc;
                Reg_Wen_curr = mif.Reg_Wen;
                jtype_curr = mif.jtype;
                //mif.RegDst_r <= mif.RegDst;
                immtype_curr = mif.immtype;
                halt_curr = mif.halt;
                jrtype_curr = mif.jrtype;
                mif.opcode_curr = mif.opcode;
                
                funct_curr = mif.funct;
                rs_curr = mif.rs;
                rt_curr = mif.rt;
                instr_curr = mif.instr;
                dstore_curr = mif.dstore;
                imm16_curr = mif.imm16;
                portO_curr = mif.dmemaddr;   
                
            end
        end
        else if (cpucif.ihit) begin
            memReg_curr = mif.memReg_n;
            npc_curr = mif.npc;
            extOut_curr = mif.extOut;
            wreg_curr = mif.wreg;

            //control signals
            jaltype_curr = mif.jaltype;
            ldtype_curr = mif.ldtype;
            PCSrc_curr = mif.PCSrc;
            Reg_Wen_curr = mif.Reg_Wen;
            jtype_curr = mif.jtype;
            //mif.RegDst_r <= mif.RegDst;
            immtype_curr = mif.immtype;
            halt_curr = mif.halt;
            jrtype_curr = mif.jrtype;
            mif.opcode_curr = mif.opcode;
            
            funct_curr = mif.funct;
            rs_curr = mif.rs;
            rt_curr = mif.rt;
            instr_curr = mif.instr;
            dstore_curr = mif.dstore;
            imm16_curr = mif.imm16;
            portO_curr = mif.dmemaddr; 
        end
    end

endmodule