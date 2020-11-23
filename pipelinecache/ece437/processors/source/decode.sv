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
    word_t  rdat1_curr, rdat2_curr, bdat_curr, bdat_n, extOut_curr, npc_curr;
    logic jaltype_curr, ldtype_curr, PCSrc_curr, Reg_Wen_curr, dwen_curr,
        dren_curr, jtype_curr, MemToReg_curr, jrtype_curr, immtype_curr,
        halt_curr, PCSrc_n, alutype_curr;
    logic branch_curr;
    aluop_t ALUOP_curr;
    opcode_t opcode_curr;
    
    funct_t funct_curr;
    word_t instr_curr;
    logic [15:0] imm16_curr;

    //word_t rdat1_rtemp, rdat2_rtemp, bdat_rtemp, extOut_rtemp;

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
            dif.branch_r <= '0;

            dif.funct_r <= funct_t'('0);
            dif.instr_r <= '0;
            dif.imm16_r <= '0;
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
            dif.branch_r <= branch_curr;
            
            dif.funct_r <= funct_curr;
            dif.instr_r <= instr_curr;
            dif.imm16_r <= imm16_curr;
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
        funct_curr = dif.funct_r;
        instr_curr = dif.instr_r;
        imm16_curr = dif.imm16_r;

        if (huif.dstall) begin
            if (cpucif.dhit && cpucif.ihit) begin
                if (huif.stall) begin
                    rdat1_curr = '0;
                    rdat2_curr = '0;
                    bdat_curr = '0;
                    extOut_curr = '0;
                    npc_curr = '0;
                    wreg_curr = '0;
                    rs_curr = '0;
                    rt_curr = '0;
                    opcode_curr = opcode_t'('0);
                    //control unit signals
                    jaltype_curr = '0;
                    ldtype_curr = '0;
                    PCSrc_curr = '0;
                    Reg_Wen_curr = '0;
                    dwen_curr = '0;
                    dren_curr = '0;
                    jtype_curr = '0;
                    MemToReg_curr = '0;
                    ALUOP_curr = aluop_t'('0);
                    jrtype_curr = '0;
                    immtype_curr = '0;
                    halt_curr = '0;
                    alutype_curr = '0;
                    branch_curr = '0;

                    funct_curr = funct_t'('0);
                    instr_curr = '0;
                    imm16_curr = '0;
                end
                else begin
                    rdat1_curr = rfif.rdat1;
                    rdat2_curr = rfif.rdat2;
                    bdat_curr = bdat_n;
                    extOut_curr = exif.imm32;
                    npc_curr = dif.npc;
                    wreg_curr = wreg_n;
                    opcode_curr = dcif.opcode;
                    rs_curr = dcif.rs;
                    rt_curr = dcif.rt;
                    //control unit signals
                    jaltype_curr = cpucif.jaltype;
                    ldtype_curr = cpucif.ldtype;
                    PCSrc_curr = cpucif.PCSrc;
                    Reg_Wen_curr = cpucif.Reg_Wen;
                    dwen_curr = cpucif.dwen;
                    dren_curr = cpucif.dren;
                    jtype_curr = cpucif.jtype;
                    MemToReg_curr = cpucif.MemToReg;
                    ALUOP_curr = cpucif.ALUOP;
                    jrtype_curr = cpucif.jrtype;
                    immtype_curr = cpucif.immtype;
                    halt_curr = cpucif.halt;
                    alutype_curr = cpucif.alutype;
                    branch_curr = dif.branch;

                    funct_curr = dcif.funct;
                    instr_curr = dif.instr;
                    imm16_curr = dcif.imm16;
                end
            end
        end
        else if (cpucif.ihit) begin
            if (huif.stall || huif.flush) begin
                rdat1_curr = '0;
                    rdat2_curr = '0;
                    bdat_curr = '0;
                    extOut_curr = '0;
                    npc_curr = '0;
                    wreg_curr = '0;
                    rs_curr = '0;
                    rt_curr = '0;
                    opcode_curr = opcode_t'('0);
                    //control unit signals
                    jaltype_curr = '0;
                    ldtype_curr = '0;
                    PCSrc_curr = '0;
                    Reg_Wen_curr = '0;
                    dwen_curr = '0;
                    dren_curr = '0;
                    jtype_curr = '0;
                    MemToReg_curr = '0;
                    ALUOP_curr = aluop_t'('0);
                    jrtype_curr = '0;
                    immtype_curr = '0;
                    halt_curr = '0;
                    alutype_curr = '0;
                    branch_curr = '0;

                    funct_curr = funct_t'('0);
                    instr_curr = '0;
                    imm16_curr = '0;
            end
            else begin
                rdat1_curr = rfif.rdat1;
                rdat2_curr = rfif.rdat2;
                bdat_curr = bdat_n;
                extOut_curr = exif.imm32;
                npc_curr = dif.npc;
                wreg_curr = wreg_n;
                opcode_curr = dcif.opcode;
                rs_curr = dcif.rs;
                rt_curr = dcif.rt;
                //control unit signals
                jaltype_curr = cpucif.jaltype;
                ldtype_curr = cpucif.ldtype;
                PCSrc_curr = cpucif.PCSrc;
                Reg_Wen_curr = cpucif.Reg_Wen;
                dwen_curr = cpucif.dwen;
                dren_curr = cpucif.dren;
                jtype_curr = cpucif.jtype;
                MemToReg_curr = cpucif.MemToReg;
                ALUOP_curr = cpucif.ALUOP;
                jrtype_curr = cpucif.jrtype;
                immtype_curr = cpucif.immtype;
                halt_curr = cpucif.halt;
                alutype_curr = cpucif.alutype;
                branch_curr = dif.branch;

                funct_curr = dcif.funct;
                instr_curr = dif.instr;
                imm16_curr = dcif.imm16;
            end
        end
    end

endmodule