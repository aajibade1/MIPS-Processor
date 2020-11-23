`include "cpu_types_pkg.vh"
`include "decoder_if.vh"
`timescale 1 ns / 1 ns
import cpu_types_pkg::*;

module decoder_tb;

    decoder_if dif();
    parameter PERIOD = 10;
    string test_case;
    int test_num;

    test PROG(dif);

    decoder DUT (dif);

endmodule

program test (decoder_if.tb tbif);
    initial begin
        
    end
endprogram