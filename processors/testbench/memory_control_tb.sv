`include "cache_control_if.vh"
`include "cpu_ram_if.vh"
`include "cpu_types_pkg.vh"
`include "caches_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module memory_control_tb;

  parameter PERIOD = 20;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  cpu_ram_if ramif ();
  caches_if cacheif0 ();
  caches_if cacheif1 ();
  cache_control_if #(.CPUS(1)) ccif (cacheif0, cacheif1);
  // test program
  test PROG (CLK, nRST, cacheif0, ccif);
  // DUT
  memory_control DUT(CLK, nRST, ccif);
  ram RDUT (CLK, nRST, ramif.ram);

  assign ramif.ramaddr = ccif.ramaddr;
  assign ramif.ramstore = ccif.ramstore;
  assign ramif.ramREN = ccif.ramREN;
  assign ramif.ramWEN = ccif.ramWEN;
  assign ccif.ramstate = ramif.ramstate;
  assign ccif.ramload = ramif.ramload;

endmodule

program test (input logic CLK, output logic rst, caches_if cif0,cache_control_if ccif);

  //test bench debug signals
  integer tb_test_num;
  string tb_test_case;

  initial begin
     tb_test_num = -1;
     tb_test_case = "TB init";
     cif0.dWEN = '0;
     cif0.dREN = '0;
     cif0.daddr = '0;
     cif0.iaddr = '0;
     cif0.dstore = '0;
     cif0.iREN = '0;
     rst = 1'b0;
     @(negedge CLK);
     rst = 1'b1;

     //away from time 0
     #0.1;

     reset_dut();
    /****************************************
    //Test 1 - Write data to ram
    ****************************************/
    @(negedge CLK);
    tb_test_num += 1;
    tb_test_case = "Write to ram check";
    cif0.dWEN = '1;
    cif0.daddr = 32'h00000000;
    cif0.dstore = 32'h00000005;
    #(50);
    cif0.daddr = 32'h00000004;
    cif0.dstore = 32'h0000000F;
    #(50)
    cif0.dWEN = '0;

    /****************************************
    //Test 2 - read data from ram
    ****************************************/
    @(negedge CLK);
    tb_test_num += 1;
    tb_test_case = "Read from RAM";
    cif0.dWEN = '0;
    cif0.dREN = '1;
    cif0.daddr = 32'h00000004;
    cif0.dstore = 32'h000000FF;
    #(50);

    /****************************************
    //Test 3 - load intr from ram
    ****************************************/
    @(negedge CLK);
    tb_test_num += 1;
    tb_test_case = "Load instr to ram";
    cif0.dWEN = '0;
    cif0.daddr = 32'h00000008;
    cif0.dstore = 32'h00000000;
    cif0.dREN = '0;
    cif0.iREN = '1;
    cif0.iaddr = 32'h00000004;
    #(50);
    cif0.iREN = '0;

    /****************************************
    //Test 4 - Data read priority
    ****************************************/
    @(negedge CLK);
    tb_test_num += 1;
    tb_test_case = "Data read and instr read High";
    cif0.dWEN = '0;
    cif0.daddr = 32'h00000008;
    cif0.dstore = 32'h0000000C;
    cif0.dREN = '1;
    cif0.iREN = '1;
    cif0.iaddr = 32'h00000004;
    #(50);
    cif0.iREN = '0;

    /****************************************
    //Test 5 - Data write priority
    ****************************************/
    @(negedge CLK);
    tb_test_num += 1;
    tb_test_case = "Data write and instr read High";
    cif0.dWEN = '1;
    cif0.daddr = 32'h00000400;
    cif0.dstore = 32'hABCDEF12;;
    cif0.dREN = '0;
    cif0.iREN = '1;
    cif0.iaddr = 32'h00000004;
    #(50);
    cif0.iREN = '0;

    /****************************************
    //Test 6 - Fetch after write
    ****************************************/
    @(negedge CLK);
    tb_test_num += 1;
    tb_test_case = "Fetch Instr After Write";
    cif0.dWEN = '0;
    cif0.daddr = 32'h00000008;
    cif0.dstore = 32'hABCDEF15;
    cif0.dREN = '0;
    cif0.iREN = '1;
    cif0.iaddr = 32'h00000400;
    #(50);
    dump_memory();
    $finish;     
  end

    task reset_dut;
        begin
            @(negedge CLK);
            rst = 0;
            @(posedge CLK);
            rst = 1;
         end
    endtask

    task automatic dump_memory();
     string filename = "memcpu.hex";
     int memfd;

     cif0.daddr = 0;
     cif0.dWEN = 0;
     cif0.dREN = 0;

     memfd = $fopen(filename,"w");
     if (memfd)
       $display("Starting memory dump.");
     else
       begin $display("Failed to open %s.",filename); $finish; end

     for (int unsigned i = 0; memfd && i < 16384; i++)
     begin
       int chksum = 0;
       bit [7:0][7:0] values;
       string ihex;

       cif0.daddr = i << 2;
       cif0.dREN = 1;
       repeat (4) @(posedge CLK);
       if (cif0.dload === 0)
         continue;
       values = {8'h04,16'(i),8'h00,cif0.dload};
       foreach (values[j])
         chksum += values[j];
       chksum = 16'h100 - chksum;
       ihex = $sformatf(":04%h00%h%h",16'(i),cif0.dload,8'(chksum));
       $fdisplay(memfd,"%s",ihex.toupper());
     end //for
     if (memfd)
     begin
       cif0.dREN = 0;
       $fdisplay(memfd,":00000001FF");
       $fclose(memfd);
       $display("Finished memory dump.");
     end
    endtask
endprogram