/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "cache_control_if.vh"
`include "cpu_types_pkg.vh"

module memory_control (
  input CLK, nRST,
  cache_control_if.cc ccif
);
  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc
  parameter CPUS = 1;

  always_comb
  begin
    //default values
    ccif.iwait = 1'b1;
    ccif.dwait = 1'b1;
    ccif.iload = 32'b0;
    ccif.dload = 32'b0;
    ccif.ramstore = 32'b0;
    ccif.ramaddr = 32'b0;
    ccif.ramWEN = 1'b0;
    ccif.ramREN = 1'b0;

    if (ccif.dREN)
    begin
      ccif.ramREN = 1'b1;
      ccif.ramaddr = ccif.daddr;
    end
    else if (ccif.dWEN)
    begin
      ccif.ramWEN = 1'b1;
      ccif.ramaddr = ccif.daddr;
      ccif.ramstore = ccif.dstore;
    end
    else if (ccif.iREN)
    begin
      ccif.ramREN = 1'b1;
      ccif.ramaddr = ccif.iaddr;
    end

    if (ccif.ramstate == ACCESS)
    begin
      if (ccif.dREN)
      begin
        ccif.dwait = 1'b0;
        ccif.dload = ccif.ramload;
      end
      else if (ccif.dWEN)
      begin
        ccif.dwait = 1'b0;
      end
      else if (ccif.iREN)
      begin
        ccif.iwait = 1'b0;
        ccif.iload = ccif.ramload;
      end
    end
    /*else begin
      if (ccif.dREN || ccif.dWEN) ccif.dwait = 1'b1;
      else if (ccif.iREN) ccif.iwait = 1'b1; 
    end*/
    
  end

endmodule
