`include "cpu_types_pkg.vh"
`include "forward_unit_if.vh"

module forward_unit_tb;

    forward_unit_if fuif();

    string test_case;
    int test_num;

    parameter PERIOD = 20;
    // signals
   // logic CLK = 1, nRST;
    // clock
   // always #(PERIOD/2) CLK++;

    test PROG(fuif);

    forward_unit DUT (fuif);
endmodule

program test(
    forward_unit_if.tb tbif
);
    import cpu_types_pkg::*;

    initial begin
        tbif.Mem_RegWrite = 0;
        tbif.Mem_dren = 0;
        tbif.rd_mem = 0;
        tbif.rs = 0;
        tbif.alutype= '0;
        tbif.Wb_RegWrite = '0;
        tbif.rd_wb= '0;
        tbif.rt = '0;

        forward_unit_tb.test_case = "Reset";
        forward_unit_tb.test_num = 0;

        //forward ex forward
        forward_unit_tb.test_case = "forward exmemA";
        forward_unit_tb.test_num = 1;
        tbif.Mem_RegWrite = 1;
        tbif.Mem_dren = 0;
        tbif.rd_mem = 1;
        tbif.rs = 1;
        #(10);
 
        //forward ex forward
        forward_unit_tb.test_case = "forward exwbA";
        forward_unit_tb.test_num = 2;
        tbif.Wb_RegWrite = 1;
        tbif.Mem_RegWrite = 0;
        tbif.Mem_dren = 0;
        tbif.rd_wb = 1;
        tbif.rt = 1;
        #(10);

        //forward mem forward
        forward_unit_tb.test_case = "forward exmemB";
        forward_unit_tb.test_num = 3;
        tbif.Mem_RegWrite = 1;
        tbif.rd_mem= 1;
        tbif.rd_wb= 0;
        tbif.rs = 1;
        #(10);

                //forward mem forward
        forward_unit_tb.test_case = "forward exwbB";
        forward_unit_tb.test_num = 4;
        tbif.Wb_RegWrite = 1;
        tbif.Mem_RegWrite = 0;
        tbif.rd_wb= 1;
        tbif.rd_mem= 0;
        tbif.rs = 0;
        tbif.rt = 1;
        #(10);

    end

endprogram