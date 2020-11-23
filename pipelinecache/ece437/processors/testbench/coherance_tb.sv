// mapped needs this
`include "cache_control_if.vh"
`include "caches_if.vh"
`include "cpu_ram_if.vh"
`include "cpu_types_pkg.vh"
import cpu_types_pkg::*;

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module coherance_tb;

  parameter PERIOD = 10;
  parameter WAIT = 1;

  logic CLK = 0, nRST;


  // clock
  always #(PERIOD/2) CLK++;

  // interface
  caches_if cif0();
  caches_if cif1();
  cache_control_if ccif (cif0, cif1);
  cpu_ram_if ramif();
  always_comb
  begin
    ramif.ramaddr = ccif.ramaddr;
    ramif.ramstore = ccif.ramstore;
    ramif.ramREN = ccif.ramREN;
    ramif.ramWEN = ccif.ramWEN;
    ccif.ramstate = ramif.ramstate;
    ccif.ramload = ramif.ramload;
  end
  // test program
  test PROG (
  CLK,
  nRST,
  cif0, cif1,
  ccif
  );
 
  // DUT
  coherance DUT(CLK,nRST,ccif);
  ram DUT2(CLK, nRST, ramif);
endmodule

program test(
  input logic CLK,
  output logic nRST,
  caches_if cif0, cif1,
  cache_control_if ccif
);

parameter PERIOD = 10;

integer memfile;

initial begin
  //initial reset
  #4;
  nRST = 0;
  cif0.iREN = 0;
  cif1.iREN = 0;
  cif0.dREN = 0;
  cif1.dREN = 0;
  cif0.dWEN = 0;
  cif1.dWEN = 0;
  cif0.dstore = '0;
  cif1.dstore = '0;
  cif0.iaddr = '0;
  cif1.iaddr = '0;
  cif0.daddr = '0;
  cif1.daddr = '0;
  cif0.ccwrite = '0;
  cif1.ccwrite = '0;
  cif0.cctrans = '0;
  cif1.cctrans = '0;
  #(PERIOD)
  #(PERIOD)

  nRST = 1;
  cif0.daddr = 32'hdeadbeef;
  cif0.daddr = 32'hdeeceeed;
  
  //test1
  cif0.dWEN = 1;
  cif1.dWEN = 0;
  cif0.cctrans = 0;
  cif1.cctrans = 0;
  cif0.ccwrite = 0;
  cif1.ccwrite = 0;
  @(negedge cif0.dwait)
  #(PERIOD)
  cif0.daddr = 32'hdeadbeea;
  @(negedge cif0.dwait)
  #(PERIOD)
  cif0.dWEN = 0;

  //test2
  cif0.iaddr = 32'hdeadbeef;
  #(PERIOD)
  cif0.iREN = 1;
  cif1.dREN = 0;
  cif0.ccwrite = 0;
  cif1.ccwrite = 0;
  @(negedge cif0.iwait)
  #(PERIOD)
  cif0.iREN = 0; 

  //test3
  cif0.daddr = 32'hdeadbeef;
  #(PERIOD)
  cif0.dREN = 0;
  cif1.dREN = 0;
  cif0.cctrans = 1;
  cif1.cctrans = 0;
  cif0.ccwrite = 0;
  cif1.ccwrite = 0;
  #(PERIOD)
  cif1.cctrans = 1;
  #(PERIOD)
  @(negedge cif0.dwait)
  #(PERIOD)
  cif0.daddr = 32'hdeadbeea;
  @(negedge cif0.dwait)
  cif0.cctrans = 0;
  cif1.cctrans = 0;
  #(PERIOD)
  
  //test4
  cif0.daddr = 32'hdeadbeef;
  #(PERIOD)
  cif0.dREN = 0;
  cif1.dREN = 0;
  cif0.cctrans = 1;
  cif1.cctrans = 0;
  cif0.ccwrite = 0;
  cif1.ccwrite = 0;
  //#(PERIOD)
  @(posedge cif1.ccwait)
  cif1.cctrans = 1;
  cif1.ccwrite = 1;
  cif1.dstore = 32'hdeef;
  cif1.daddr = 32'hdeadbeef;
  @(cif1.dwait == 0)
  #(PERIOD)
  cif1.daddr = 32'hdeadbeea;
  cif1.dstore = 32'hfeed;
  @(cif1.dwait == 0)
  #(PERIOD)
  cif0.cctrans = 0;
  cif1.cctrans = 0;
  cif1.ccwrite = 0;
  #(PERIOD)
  #(PERIOD);
  #(PERIOD);
  $finish; 
end


endprogram