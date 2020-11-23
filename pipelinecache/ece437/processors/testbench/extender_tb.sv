`include "cpu_types_pkg.vh"
`include "extender_if.vh"
`timescale 1 ns / 1 ns
import cpu_types_pkg::*;

module extender_tb;

    extender_if exif();
    parameter PERIOD = 10;
    string test_case;
    int test_num;

    test PROG(exif);

    extender DUT (exif);

endmodule

program test (extender_if.tb tbif);
    
endprogram