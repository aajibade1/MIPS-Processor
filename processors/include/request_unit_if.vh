`ifndef REQUEST_UNIT_IF_VH
`define REQUEST_UNIT_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface request_unit_if;
  // import types
  import cpu_types_pkg::*;

  logic dhit, ihit, dmemREN, dmemWEN, dWEN, dREN;

  // register file ports
  modport ru (
    input   dhit, ihit, dREN, dWEN,
    output  dmemWEN, dmemREN 
  );
  // register file tb
  modport tb (
    input   dmemWEN, dmemREN, 
    output  dWEN, dREN, dhit, ihit
  );
endinterface

`endif //REGISTER_FILE_IF_VH