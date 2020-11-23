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
<<<<<<< HEAD
    word_t iaddr_curr, npc_curr, iaddr_rtemp, npc_rtemp, branchAddr_curr, branchAddr;
    
=======
    word_t iaddr_curr, npc_curr, iaddr_rtemp, npc_rtemp;
    logic branch_rtemp, branch_curr;
>>>>>>> 0d61f9aff977b9283da6a8b07b059d15e49c1590
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
<<<<<<< HEAD
            fif.branchAddr_r <= '0;
=======
            branch_rtemp <= '0;
>>>>>>> 0d61f9aff977b9283da6a8b07b059d15e49c1590
        end
        else if (huif.flush) begin
            fif.instr_r <= '0;
            fif.npc_r <= '0;
<<<<<<< HEAD
            fif.branchAddr_r <= '0;
=======
            fif.branch_r <= '0;
>>>>>>> 0d61f9aff977b9283da6a8b07b059d15e49c1590

            iaddr_rtemp <= '0;
            npc_rtemp <= '0; 
            branch_rtemp <= '0;
        end
        else if (cpucif.ihit && ~huif.flush && ~huif.stall) begin
            fif.instr_r <= fif.imemload;
            fif.npc_r <= pcif.npc_r; 
<<<<<<< HEAD
            fif.branchAddr_r <= branchAddr;
=======
            fif.branch_r <= fif.branch;
>>>>>>> 0d61f9aff977b9283da6a8b07b059d15e49c1590

            iaddr_rtemp <= fif.imemload;
            npc_rtemp <= pcif.npc_r;
            branch_rtemp <= fif.branch;
        end
        else begin
            fif.instr_r <= iaddr_curr;
<<<<<<< HEAD
            fif.npc_r <= npc_curr; 
            fif.branchAddr_r <= branchAddr_curr;
=======
            fif.npc_r <= npc_curr;
            fif.branch_r <= branch_curr;
>>>>>>> 0d61f9aff977b9283da6a8b07b059d15e49c1590

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
<<<<<<< HEAD
        
        pcif.halttype = huif.halttype;
        branchAddr_curr = fif.branchAddr_r;
=======
        branch_curr = branch_rtemp;
>>>>>>> 0d61f9aff977b9283da6a8b07b059d15e49c1590

        pcif.halttype = huif.halttype;
        
        //always taken
        opcode = opcode_t'('0);
        funct = funct_t'('0);
        fif.branchTarget = '0;
        fif.branch = '0;
        fif.immtype = '0;
        branchAddr = '0;


        if (cpucif.ihit) begin
            opcode = opcode_t'(fif.imemload[31:26]);
            funct = funct_t'(fif.imemload[5:0]);
        end

        if (opcode == J || opcode == JAL) 
        begin
            fif.branch = 1;
            fif.immtype = 1;
            fif.branchTarget = {6'b0, fif.imemload[25:0]};   
            branchAddr = {pcif.npc[31:28], fif.branchTarget[25:0], 2'b00};  
        end
        else if (opcode == BEQ || opcode == BNE) 
        begin
            fif.branch = 1;
            fif.immtype = 0;
            fif.branchTarget = {16'b0, fif.imemload[15:0]};
            branchAddr = (fif.branchTarget << 2) + pcif.npc;
        end
    end

endmodule