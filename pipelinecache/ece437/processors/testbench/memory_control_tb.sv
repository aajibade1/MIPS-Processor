`include "caches_if.vh"
`include "cache_control_if.vh"
`include "cpu_ram_if.vh"
`include "cpu_types_pkg.vh"

`timescale 1 ns / 1 ns

module memory_control_tb;
  
  // clock period
  parameter PERIOD = 20;

  // signals
  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  //interface
  caches_if cachesif1();
  caches_if cachesif2();
  cache_control_if conif(cachesif1, cachesif2);
  cpu_ram_if ramif();

  string test_case;
  int test_num;

  
  always_comb
  begin
    ramif.ramaddr = conif.ramaddr;
    ramif.ramstore = conif.ramstore;
    ramif.ramREN = conif.ramREN;
    ramif.ramWEN = conif.ramWEN;
    conif.ramstate = ramif.ramstate;
    conif.ramload = ramif.ramload;
  end
  

  test PROG(CLK, cachesif1);
  memory_control DUT1(CLK, nRST, conif);
  ram DUT2(CLK, nRST, ramif);

endmodule

import cpu_types_pkg::*;
program test (input logic CLK, caches_if.caches cachesif);

  initial begin
    memory_control_tb.nRST = 0;
    cachesif.dREN = 1'b0;
    cachesif.dWEN = 1'b0;
    cachesif.daddr = 32'b0;
    cachesif.dstore = 32'b0;
    cachesif.iREN = 1'b0;
    cachesif.iaddr = 32'b0;
    @(posedge CLK);
    memory_control_tb.nRST = 1;

    @(posedge CLK);
    
    //test: d write
    memory_control_tb.test_num = 0;
    memory_control_tb.test_case = "D-Write";

    cachesif.daddr = 32'h0012;
    cachesif.dstore = 32'b1;
    cachesif.dWEN = 1'b1;
    #(50);
    cachesif.dWEN = 1'b0;
    
    #(memory_control_tb.PERIOD / 2);
    
    //test: d-read
    memory_control_tb.test_num += 1;
    memory_control_tb.test_case = "D-Read";

    cachesif.daddr = 32'h0012;
    cachesif.dREN = 1'b1;
    #(50);
    cachesif.dREN = 1'b0;
    #(memory_control_tb.PERIOD / 2);
    
    
    //test: i fetch
    memory_control_tb.test_num = 2;
    memory_control_tb.test_case = "I-Fetch";

    cachesif.iaddr = 32'h0012;
    cachesif.iREN = 1'b1;

    #(50);
    cachesif.iREN = 1'b0;
    #(memory_control_tb.PERIOD / 2);

    
    //test: simultaneous d-write i fetch
    memory_control_tb.test_num += 1;
    memory_control_tb.test_case = "D-Write and I-fetch";

    cachesif.iaddr = 32'h0016;
    cachesif.daddr = 32'h0016;
    cachesif.dstore = 32'b101;
    cachesif.dWEN = 1'b1;
    cachesif.iREN = 1'b1;

    #(50);
    cachesif.dWEN = 1'b0;
    #(50);
    cachesif.iREN = 1'b0;
    
    #(memory_control_tb.PERIOD / 2);

    //test: simultaneous d-read i-fetch
    memory_control_tb.test_num += 1;
    memory_control_tb.test_case = "D-Read and I-fetch";

    cachesif.iaddr = 32'h0016;
    cachesif.daddr = 32'h0016;
    cachesif.iREN = 1'b1;
    cachesif.dREN = 1'b1;
    #(50);
    cachesif.dREN = 1'b0;
    #(50);
    cachesif.iREN = 1'b0;
    
    #(memory_control_tb.PERIOD / 2);
    //dump_memory();
    $finish;
  end

  task automatic dump_memory();
    string filename = "memcontrol.hex";
    int memfd;

    cachesif.daddr = 0;
    cachesif.dWEN = 0;
    cachesif.dREN = 0;

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

      cachesif.daddr = i << 2;
      cachesif.dREN = 1;
      repeat (4) @(posedge CLK);
      if (cachesif.dload === 0)
        continue;
      values = {8'h04,16'(i),8'h00,cachesif.dload};
      foreach (values[j])
        chksum += values[j];
      chksum = 16'h100 - chksum;
      ihex = $sformatf(":04%h00%h%h",16'(i),cachesif.dload,8'(chksum));
      $fdisplay(memfd,"%s",ihex.toupper());
    end //for
    if (memfd)
    begin
      cachesif.dREN = 0;
      $fdisplay(memfd,":00000001FF");
      $fclose(memfd);
      $display("Finished memory dump.");
    end
  endtask

endprogram