/*
  Eric Villasenor
  evillase@gmail.com

  this block is the coherence protocol
  and artibtration for ram
*/

// interface include
`include "cache_control_if.vh"
`include "cpu_ram_if.vh"

// memory types
`include "cpu_types_pkg.vh"

module memory_control (
  input CLK, nRST,
  cache_control_if.cc ccif
);
  // type import
  import cpu_types_pkg::*;

  // number of cpus for cc
  parameter CPUS = 1;

    assign ccif.ramWEN = ccif.dWEN;
    assign ccif.ramstore = ccif.dstore;
    assign ccif.ramaddr = ((ccif.dWEN || ccif.dREN)) ? ccif.daddr : ccif.iaddr; 
    assign ccif.dload = ccif.dREN ? ccif.ramload : '0;
    assign ccif.iload = (ccif.iREN && ~ccif.dREN) ? ccif.ramload : '0; 
    assign ccif.ramREN = (~ccif.dWEN && (ccif.iREN || ccif.dREN)) ? 1 : 0;
    //assign ccif.iwait = (~(ccif.ramstate == ACCESS) && (ccif.dWEN || ccif. dREN)) ? 1 : 0;
    //assign ccif.dwait = (~(ccif.ramstate == ACCESS) && ~ccif.dREN && ~ccif.dWEN && ccif.iREN) ? 1 : 0;
    assign ccif.iwait = (ccif.ramstate == ACCESS) ? (((ccif.iREN == 1) && (ccif.dWEN != 1) && (ccif.dREN != 1)) ? 0 : 1):1;
    assign ccif.dwait = (ccif.ramstate == ACCESS) ? ((ccif.dREN)? 0 : ((ccif.dWEN) ? 0 : 1)):1;

endmodule