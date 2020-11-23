`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "caches_if.vh"

`timescale 1 ns / 1 ns

module dcache_tb;
    
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

    dcache DUT (CLK, nRST, dcif, cif);

endmodule

import cpu_types_pkg::*;

program test(input logic CLK, output logic nRST, datapath_cache_if dcif, caches_if cif);
   
    initial begin
        nRST = 1;
        dcif.dmemREN = '0;
        dcif.dmemWEN = '0;
        dcif.halt = '0;
        dcif.dmemstore = '0;
        dcif.dmemaddr = '0;

        cif.dwait = 1;
        cif.dload = '0;
        //away from time 0
        #(20);   
        dcache_tb.tb_test_num += 1;
        dcache_tb.tb_test_case = "RESET TEST CASE";
        reset_dut();

        #(20);
        dcif.dmemREN = 1;
        dcif.dmemaddr = 32'hbeef44;
        #(20);
        dcif.dmemREN = 0;
        //dcif.dmemaddr = 32'h0;
        dcache_tb.tb_test_num += 1;
        dcache_tb.tb_test_case = "READ IN FIRST INDEX AND MISS";
        #(60)
        cif.dload = 32'hdeadbeef;
        cif.dwait = 0;
        #(20);
        cif.dwait = 1;
        #(20)
        cif.dload = 32'hdeadbeef;
        cif.dwait = 0;
        #(20)
        cif.dwait = 1;
        
        #(20);
        dcif.dmemREN = 1;
        dcif.dmemaddr = 32'hdead44;
        #(20);
        dcif.dmemREN = 0;
        dcif.dmemaddr = 32'h0;
        dcache_tb.tb_test_num += 1;
        dcache_tb.tb_test_case = "READ IN FIRST INDEX and DIFFERENT frame and MISS";
        #(60)
        cif.dload = 32'hbeef;
        cif.dwait = 0;
        #(20);
        cif.dwait = 1;
        #(20)
        cif.dload = 32'hbeef;
        cif.dwait = 0;
        #(20);
        cif.dwait = 1;
        #(20)

        #(20);
        dcif.dmemREN = 1;
        dcif.dmemaddr = 32'hbeef08;
        #(20);
        dcif.dmemREN = 0;
        dcif.dmemaddr = 32'h0;
        dcache_tb.tb_test_num += 1;
        dcache_tb.tb_test_case = "READ IN SECOND INDEX AND MISS";
        #(60)
        cif.dload = 32'hbeefdead;
        cif.dwait = 0;
        #(20);
        cif.dwait = 1;
        #(20)
        cif.dload = 32'hbeef;
        cif.dwait = 0;
        #(20);
        cif.dwait = 1;
        #(20)

        #(20);
        dcif.dmemREN = 1;
        dcif.dmemaddr = 32'hbeef10;
        #(20);
        dcif.dmemREN = 0;
        dcif.dmemaddr = 32'h0;
        dcache_tb.tb_test_num += 1;
        dcache_tb.tb_test_case = "READ IN THIRD INDEX AND MISS";
        #(60)
        cif.dload = 32'hdeadbeef;
        cif.dwait = 0;
        #(20);
        cif.dwait = 1;
        #(20)
        cif.dload = 32'hdeadbeef;
        cif.dwait = 0;
        #(20);
        cif.dwait = 1;
        #(20)

        #(20);
        dcif.dmemREN = 1;
        dcif.dmemaddr = 32'hbeef44;
        #(20);
        dcif.dmemREN = 0;
        dcif.dmemaddr = 32'h0;
        dcache_tb.tb_test_num += 1;
        dcache_tb.tb_test_case = "READ IN FIRST INDEX AND HIT";
        #(60)
        cif.dload = 32'hbeef;
        cif.dwait = 0;
        #(20);
        cif.dwait = 1;
        #(40)

        #(20);
        dcif.dmemWEN = 1;
        dcif.dmemaddr = 32'hdeef44;
        dcif.dmemstore = 32'hbeef;
        #(20);
        dcif.dmemWEN = 0;
        dcif.dmemaddr = 32'h0;
        dcache_tb.tb_test_num += 1;
        dcache_tb.tb_test_case = "Write dirty block in first index";
        #(60)
        cif.dwait = 0;
        #(20);
        cif.dwait = 1;
        #(40)

        #(20);
        dcif.dmemWEN = 1;
        dcif.dmemaddr = 32'hdeef44;
        #(20);
        dcif.dmemWEN = 0;
        dcif.dmemaddr = 32'h0;
        dcif.dmemstore = 32'hbeef;
        dcache_tb.tb_test_num += 1;
        dcache_tb.tb_test_case = "Write Hit";
        #(60)
        cif.dwait = 0;
        #(20);
        cif.dwait = 1;
        #(40)

        #(20);
        dcif.dmemWEN = 1;
        dcif.dmemaddr = 32'h24f044;
        #(20);
        dcif.dmemWEN = 0;
        dcif.dmemaddr = 32'h0;
        dcif.dmemstore = 32'hbeef;
        dcache_tb.tb_test_num += 1;
        dcache_tb.tb_test_case = "Write dirty block in first index, different frame";
        #(60)
        cif.dwait = 0;
        #(20);
        cif.dwait = 1;
        #(40)

        #(20);
        dcif.dmemWEN = 1;
        dcif.dmemaddr = 32'hdeed44;
        #(20);
        dcif.dmemWEN = 0;
        dcif.dmemaddr = 32'h0;
        dcif.dmemstore = 32'hbeef;
        dcache_tb.tb_test_num += 1;
        dcache_tb.tb_test_case = "Write dirty block to mem and in first index";
        #(60)
        cif.dwait = 0;
        #(20);
        cif.dwait = 1;
        #(40)
        cif.dwait = 0;
        #(20);
        cif.dwait = 1;
        #(40)

        dcache_tb.tb_test_num += 1;
        dcache_tb.tb_test_case = "Halt";
        dcif.halt = 1;
        #(20);
        cif.dwait = 0;
        #(20)
        cif.dwait = 1;
        #(200);
        dcif.halt = 0;
        
        $finish;
    end

    task reset_dut();
        @(negedge CLK);
        nRST = 0;
        @(posedge CLK);
        nRST = 1;
    endtask
endprogram
