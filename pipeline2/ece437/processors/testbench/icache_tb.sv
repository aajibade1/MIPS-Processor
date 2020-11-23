`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "caches_if.vh"

`timescale 1 ns / 1 ns

module icache_tb;
    
    // clock period
    parameter PERIOD = 20;

    // signals
    logic CLK = 0, nRST;

    // clock
    always #(PERIOD/2) CLK++;

    caches_if cif ();
    datapath_cache_if dcif ();
    string tb_test_case;
    int tb_test_num;

    test PROG(CLK, nRST, dcif,cif);

    icache DUT (CLK, nRST, dcif, cif);

endmodule

import cpu_types_pkg::*;

program test(input logic CLK, output logic nRST, datapath_cache_if dcif, caches_if cif);
   
    initial begin
     dcif.imemREN = 1;
     dcif.dmemREN = 0;
     dcif.dmemWEN = 0;
     dcif.imemaddr = 0;
     cif.iload = 0;
     cif.iwait = 0;
     nRST = 1;
     //away from time 0
     #0.1;   
     icache_tb.tb_test_num += 1;
     icache_tb.tb_test_case = "RESET TEST CASE";
     reset_dut();

     #(5);
     dcif.imemREN = 1;
     dcif.dmemREN = 0;
     dcif.dmemWEN = 0;
     icache_tb.tb_test_num += 1;
     icache_tb.tb_test_case = "STORE IN FIRST INDEX";
     dcif.imemaddr = 32'hFFFFFFC4;
     #(10);
     cif.iload = 32'hABCDEF00;
     cif.iwait = 0;
     #(20);
     cif.iwait = 1;


     icache_tb.tb_test_num += 1;
     icache_tb.tb_test_case = "STORE IN SECOND INDEX";
     dcif.imemaddr = 32'hFFFFFFC8;
     #(10);
     cif.iload = 32'h12345678;
     cif.iwait = 0;
     #(20);
     cif.iwait = 1;

     icache_tb.tb_test_num += 1;
     icache_tb.tb_test_case = "STORE IN THIRD INDEX";
     dcif.imemaddr = 32'hFFFFFFCC;
     #(10);
     cif.iload = 32'h55551010;
     cif.iwait = 0;
     #(20);

     icache_tb.tb_test_num += 1;
     icache_tb.tb_test_case = "GET A MATCH MISS FROM FIRST INDEX";
     dcif.imemaddr = 32'hAFFFFFC4;
     cif.iload = 32'hDEAD0000;
     cif.iwait = 0;

     #(20);
     icache_tb.tb_test_num += 1;
     icache_tb.tb_test_case = "GET A MATCH HIT FROM SECOND INDEX";
     dcif.imemaddr = 32'hFFFFFFC8;
     cif.iload = 32'hDEADBEEF;
     cif.iwait = 1;

     #(20);
     icache_tb.tb_test_num += 1;
     icache_tb.tb_test_case = "DONT READ FROM THIRD INDEX";
     dcif.imemREN = 0;
     dcif.imemaddr = 32'hFFFFFFC8;
     cif.iload = 32'hDEADBEEF;
     cif.iwait = 1;
     #(20);

    end


    task reset_dut;
        begin
            @(negedge CLK);
            nRST = 0;
            @(posedge CLK);
            nRST = 1;
         end
    endtask

endprogram

