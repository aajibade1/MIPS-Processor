`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "caches_if.vh"

`timescale 1 ns / 1 ns

module dcache2_tb;
    
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

    dcache2 DUT (CLK, nRST, dcif, cif);

endmodule

import cpu_types_pkg::*;

program test(input logic CLK, output logic nRST, datapath_cache_if dcif, caches_if cif);
    initial begin
        parameter PERIOD = 20;
        nRST = 1;
        dcif.dmemREN = '0;
        dcif.dmemWEN = '0;
        dcif.halt = '0;
        dcif.dmemstore = '0;
        dcif.dmemaddr = '0;

        cif.dwait = 1;
        cif.dload = '0;
        cif.ccwait = 0;
        cif.ccinv = 0;
        cif.ccsnoopaddr = '0;

        //reset dut
        reset_dut();
        #(PERIOD);

        //test0
        dcache2_tb.tb_test_case = "Read, 1st Index, 1st Frame, Miss";
        dcache2_tb.tb_test_num = 0;
        dcif.dmemREN = 1;
        dcif.dmemaddr = 32'hbeef44;
        #(60)
        cif.dload = 32'hdeadbeef;
        cif.dwait = 0;
        #(PERIOD);
        dcif.dmemREN = 0;
        cif.dwait = 1;
        #(PERIOD);
        cif.dload = 32'hdeadbeef;
        cif.dwait = 0;
        #(PERIOD);
        dcif.dmemaddr = '0;
        cif.dwait = 1;
        #(PERIOD);

        //test1
        dcache2_tb.tb_test_case = "Read, 1st Index, 2nd Frame, Miss";
        dcache2_tb.tb_test_num += 1;
        dcif.dmemREN = 1;
        dcif.dmemaddr = 32'hdead44;
        #(60)
        cif.dload = 32'hbeef;
        cif.dwait = 0;
        #(PERIOD);
        dcif.dmemREN = 0;
        cif.dwait = 1;
        #(PERIOD);
        cif.dload = 32'hbeef;
        cif.dwait = 0;
        #(PERIOD);
        dcif.dmemaddr = '0;
        cif.dwait = 1;
        #(PERIOD);

        //test2
        dcache2_tb.tb_test_case = "Write, 1st Index, 1st Frame, Miss";
        dcache2_tb.tb_test_num += 1;
        dcif.dmemWEN = 1;
        dcif.dmemaddr = 32'hbeef44;
        dcif.dmemstore = 32'hbeef;
        #(PERIOD);
        cif.dwait = 0;
        cif.dload = 32'hdead;
        #(PERIOD);
        dcif.dmemWEN = 0;
        cif.dwait = 1;
        #(PERIOD);
        cif.dwait = 0;
        #(PERIOD)
        dcif.dmemaddr = '0;
        cif.dwait = 1;
        #(PERIOD);

        //test2
        dcache2_tb.tb_test_case = "Write, 1st Index, 1st Frame, Hit";
        dcache2_tb.tb_test_num += 1;
        dcif.dmemWEN = 1;
        dcif.dmemaddr = 32'hbeef44;
        dcif.dmemstore = 32'hdead;
        #(PERIOD);
        dcif.dmemWEN = 0;
        #(PERIOD);

        //test2
        dcache2_tb.tb_test_case = "Write, 1st Index, 2st Frame, Miss";
        dcache2_tb.tb_test_num += 1;
        dcif.dmemWEN = 1;
        dcif.dmemaddr = 32'hdeed44;
        dcif.dmemstore = 32'hbeef;
        #(40);
        cif.dwait = 0;
        #(PERIOD);
        dcif.dmemWEN = 0;
        cif.dwait = 1;
        #(40)
        cif.dwait = 0;
        #(PERIOD);
        cif.dwait = 1;
        #(40)
        cif.dwait = 0;
        #(PERIOD);
        cif.dwait = 1;
        #(40)
        cif.dwait = 0;
        #(PERIOD);
        cif.dwait = 1;
        
        //test2
        dcache2_tb.tb_test_case = "Write, 1st Index, 1st Frame, Writeback";
        dcache2_tb.tb_test_num += 1;
        dcif.dmemWEN = 1;
        dcif.dmemaddr = 32'hdead44;
        dcif.dmemstore = 32'hbeef;
        #(40);
        cif.dwait = 0;
        #(PERIOD);
        dcif.dmemWEN = 0;
        cif.dwait = 1;
        #(40)
        cif.dwait = 0;
        #(PERIOD);
        cif.dwait = 1;
        #(40)
        cif.dwait = 0;
        #(PERIOD);
        cif.dwait = 1;
        #(40)
        cif.dwait = 0;
        #(PERIOD);
        cif.dwait = 1;        

        //test2
        dcache2_tb.tb_test_case = "SNOOP";
        dcache2_tb.tb_test_num += 1;
        cif.ccwait = 1;
        cif.ccinv = 0;
        cif.ccsnoopaddr = 32'hdead44;
        #(40)
        cif.dwait = 0;
        #(PERIOD)
        cif.dwait = 1;
        #(40)
        cif.dwait = 0;
        cif.ccwait = 0;
        #(PERIOD)
        cif.dwait = 1;        
        $finish;
    end
    task reset_dut();
        @(negedge CLK);
        nRST = 0;
        @(posedge CLK);
        nRST = 1;
    endtask
endprogram