`include "cpu_types_pkg.vh"
`include "fetch_if.vh"
`include "cpu_control_if.vh"
`include "pc_if.vh"
`include "hazard_unit_if.vh"

module fetch (
    input logic CLK, nRST,
    fetch_if.fetch fif,
    cpu_control_if cpucif,
    hazard_unit_if huif,
    pc_if pcif
);
    import cpu_types_pkg::*;
    word_t iaddr_curr, npc_curr, iaddr_rtemp, npc_rtemp;
    logic branch_rtemp, branch_curr;
    opcode_t opcode;
    funct_t funct;
    
    always_ff @ (posedge CLK, negedge nRST)
    begin
        if (nRST == 0) begin
            fif.instr_r <= '0;
            fif.npc_r <= '0;
            fif.branch_r <= '0;

            iaddr_rtemp <= '0;
            npc_rtemp <= '0;
            branch_rtemp <= '0;
        end
        else if (huif.flush) begin
            fif.instr_r <= '0;
            fif.npc_r <= '0;
            fif.branch_r <= '0;

            iaddr_rtemp <= '0;
            npc_rtemp <= '0; 
            branch_rtemp <= '0;
        end
        else if (cpucif.ihit && ~huif.flush && ~huif.stall && ~huif.dstall) begin
            fif.instr_r <= fif.imemload;
            fif.npc_r <= pcif.npc_r; 
            fif.branch_r <= fif.branch;

            iaddr_rtemp <= fif.imemload;
            npc_rtemp <= pcif.npc_r;
            branch_rtemp <= fif.branch;
        end
        else if (cpucif.ihit && cpucif.dhit) begin
            fif.instr_r <= fif.imemload;
            fif.npc_r <= pcif.npc_r; 
            fif.branch_r <= fif.branch;

            iaddr_rtemp <= fif.imemload;
            npc_rtemp <= pcif.npc_r;
            branch_rtemp <= fif.branch;
        end
        else begin
            fif.instr_r <= iaddr_curr;
            fif.npc_r <= npc_curr;
            fif.branch_r <= branch_curr;

            iaddr_rtemp <= iaddr_curr;
            npc_rtemp <= npc_curr;
            branch_rtemp <= branch_curr;
        end
        
    end
 
    always_comb begin
        fif.iren = cpucif.iren;
        fif.iaddr = pcif.PCOut;
        
        iaddr_curr = iaddr_rtemp;
        npc_curr = npc_rtemp;
        branch_curr = branch_rtemp;

        pcif.halttype = huif.halttype;
        
        //always taken
        opcode = opcode_t'('0);
        funct = funct_t'('0);
        fif.branchTarget = '0;
        fif.branch = '0;
        fif.immtype = '0;

        if (cpucif.ihit) begin
            opcode = opcode_t'(fif.imemload[31:26]);
            funct = funct_t'(fif.imemload[5:0]);
        end

        if (opcode == J || opcode == JAL) 
        begin
            fif.branch = 1;
            fif.immtype = 1;
            fif.branchTarget = {6'b0, fif.imemload[25:0]};        
        end
        else if (opcode == BEQ || opcode == BNE) 
        begin
            fif.branch = 1;
            fif.immtype = 0;
            fif.branchTarget = {16'b0, fif.imemload[15:0]};
        end
    end

endmodule