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
    regbits_t wreg_curr, wreg_rtemp;
    word_t portOut_curr, Zero_curr, npc_curr, dstore_curr, extOut_curr, portA_curr, portB_curr;

    /*word_t portOut_rtemp, npc_rtemp, dstore_rtemp, extOut_rtemp;
    logic Zero_rtemp, jaltype_rtemp, ldtype_rtemp, PCSrc_rtemp, Reg_Wen_rtemp,
            dwen_rtemp, dren_rtemp, jtype_rtemp, MemToReg_rtemp, immtype_rtemp,
            halt_rtemp, jrtype_rtemp;*/

    logic branch_rtemp, branch_curr;
    opcode_t opcode_rtemp, opcode_curr;

    funct_t funct_curr;
    regbits_t rs_curr, rt_curr;
    word_t instr_curr;
    logic [15:0] imm16_curr;

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
            eif.branch_r <= '0;
            eif.opcode_r <= opcode_t'('0);

            eif.funct_r <= funct_t'('0);
            eif.rs_r <= '0;
            eif.rt_r <= '0;
            eif.instr_r <= '0;
            eif.imm16_r <= '0;
        end
        else begin
            eif.portOut_r <= portOut_curr;
            eif.Zero_r <= Zero_curr;
            eif.npc_r <= npc_curr;
            eif.dstore_r <= dstore_curr;
            eif.extOut_r <= extOut_curr;
            eif.wreg_r <= wreg_curr;

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
            eif.branch_r <= branch_curr;
            eif.opcode_r <= opcode_curr;
            
            eif.funct_r <= funct_curr;
            eif.rs_r <= rs_curr;
            eif.rt_r <= rt_curr;
            eif.instr_r <= instr_curr;
            eif.imm16_r <= imm16_curr;
        end
    end

    always_comb begin
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
        portOut_curr = eif.portOut_r;
        Zero_curr = eif.Zero_r;
        npc_curr = eif.npc_r;
        dstore_curr = eif.dstore_r;
        extOut_curr = eif.extOut_r;

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
        branch_curr = eif.branch_r;
        opcode_curr = eif.opcode_r;
        
        funct_curr = eif.funct_r;
        rs_curr = eif.rs_r;
        rt_curr = eif.rt_r;
        instr_curr = eif.instr_r;
        imm16_curr = eif.imm16_r;

        if (huif.dstall) begin
            if (cpucif.dhit && cpucif.ihit) begin
                portOut_curr = aluif.portOut;
                Zero_curr = aluif.Zero;
                npc_curr = eif.npc;
                dstore_curr = eif.dstore;
                extOut_curr = eif.extOut;
                wreg_curr = eif.wreg;

                //control signals
                jaltype_curr = eif.jaltype;
                ldtype_curr = eif.ldtype;
                PCSrc_curr = eif.PCSrc_n;
                Reg_Wen_curr = eif.Reg_Wen;
                dwen_curr = eif.dwen;
                dren_curr = eif.dren;
                jtype_curr = eif.jtype;
                MemToReg_curr = eif.MemToReg;
                immtype_curr = eif.immtype;
                halt_curr = eif.halt;
                jrtype_curr = eif.jrtype;
                branch_curr = eif.branch;
                opcode_curr = eif.opcode;

                funct_curr = eif.funct;
                rs_curr = eif.rs;
                rt_curr = eif.rt;
                instr_curr = eif.instr;
                imm16_curr = eif.imm16;
            end
            else if (cpucif.dhit) begin
                portOut_curr = '0;
                Zero_curr = '0;
                npc_curr = '0;
                dstore_curr = '0;
                extOut_curr = '0;
                wreg_curr = '0;

                //control signals
                jaltype_curr = '0;
                ldtype_curr = '0;
                PCSrc_curr = '0;
                Reg_Wen_curr = '0;
                dwen_curr = '0;
                dren_curr = '0;
                jtype_curr = '0;
                MemToReg_curr = '0;
                immtype_curr = '0;
                halt_curr = '0;
                jrtype_curr = '0;
                branch_curr = '0;
                opcode_curr = opcode_t'('0);
                
                funct_curr = funct_t'('0);
                rs_curr = '0;
                rt_curr = '0;
                instr_curr = '0;
                imm16_curr = '0;
            end
        end
        else if (cpucif.ihit) begin
            portOut_curr = aluif.portOut;
            Zero_curr = aluif.Zero;
            npc_curr = eif.npc;
            dstore_curr = eif.dstore;
            extOut_curr = eif.extOut;
            wreg_curr = eif.wreg;

            //control signals
            jaltype_curr = eif.jaltype;
            ldtype_curr = eif.ldtype;
            PCSrc_curr = eif.PCSrc_n;
            Reg_Wen_curr = eif.Reg_Wen;
            dwen_curr = eif.dwen;
            dren_curr = eif.dren;
            jtype_curr = eif.jtype;
            MemToReg_curr = eif.MemToReg;
            immtype_curr = eif.immtype;
            halt_curr = eif.halt;
            jrtype_curr = eif.jrtype;
            branch_curr = eif.branch;
            opcode_curr = eif.opcode;

            funct_curr = eif.funct;
            rs_curr = eif.rs;
            rt_curr = eif.rt;
            instr_curr = eif.instr;
            imm16_curr = eif.imm16;
        end

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
    
    end

endmodule