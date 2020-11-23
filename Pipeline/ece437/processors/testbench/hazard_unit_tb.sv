`include "cpu_types_pkg.vh"
`include "hazard_unit_if.vh"
`include "decoder_if.vh"
`include "execute_if.vh"
`include "decode_if.vh"
`include "memory_if.vh"

module hazard_unit_tb;

    hazard_unit_if huif();
    decoder_if dcif();
    decode_if dif();
    execute_if eif();
    memory_if mif();
    
    string test_case;
    int test_num;

    parameter PERIOD = 20;
    // signals
   // logic CLK = 1, nRST;
    // clock
   // always #(PERIOD/2) CLK++;

    test PROG(huif, dcif, dif, eif);

    hazard_unit DUT (huif, dcif, dif, eif, mif);
endmodule

program test(
    hazard_unit_if.tb tbif,
    decoder_if tbdcif,
    decode_if  tbdif,
    execute_if tbeif
);
     import cpu_types_pkg::*;

    initial begin
        tbeif.PCSrc_n = 0;
        tbeif.PCSrc_r = 0;
        tbdif.Reg_Wen_r = 0;
        tbeif.Reg_Wen_r = 0;
        tbdif.wreg_r = '0;
        tbdcif.rs = '0;
        tbdcif.rt = '0;
        tbeif.wreg_r = '0;
        tbif.ihit = 0;

        //all zeros, no hazards
        hazard_unit_tb.test_case = "Reset";
        hazard_unit_tb.test_num = 0;

        tbeif.PCSrc_n = 0;
        tbdif.Reg_Wen_r = 0;
        tbeif.Reg_Wen_r = 0;
        #(2)
        if(tbif.flush == 0 && tbif.stall == 0) begin
            $display("Passed 1");
        end else begin
            $display("Failed 1");
        end

        //raw hazards
        hazard_unit_tb.test_case = "RAW Hazard";
        hazard_unit_tb.test_num = 1;
        tbeif.PCSrc_n = 0;
        tbdif.Reg_Wen_r = 1;
        tbdif.wreg_r = 5'h03;
        tbdcif.rs = 5'h03;
        tbdcif.rt = '0;
        tbdcif.instr[31:26] = LW;
        #(2)
        if(tbif.flush == 0 && tbif.stall == 1) begin
            $display("Passed 1");
        end else begin
            $display("Failed 1");
        end

        //branch hazards
        hazard_unit_tb.test_case = "Branch Hazards";
        hazard_unit_tb.test_num = 2;
        tbeif.PCSrc_n = 1;
        tbeif.PCSrc_r = 1;
        #(2)
        if(tbif.flush == 1 && tbif.stall == 1) begin
            $display("Passed 1");
        end else begin
            $display("Failed 1");
        end

        //jump hazards
        hazard_unit_tb.test_case = "Jump Hazard";
        hazard_unit_tb.test_num = 3;  
        tbeif.PCSrc_n = 1;
        tbdif.Reg_Wen_r = 0;
        tbeif.Reg_Wen_r = 0;
        #(2)
        if(tbif.flush == 1 && tbif.stall == 1) begin
            $display("Passed 1");
        end else begin
            $display("Failed 1");
        end     

    end

endprogram