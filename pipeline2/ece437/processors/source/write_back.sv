`include "cpu_types_pkg.vh"
`include "write_back_if.vh"
`include "register_file_if.vh"
`include "pc_if.vh"
`include "cpu_control_if.vh"

module write_back (
    input logic CLK, nRST,
    write_back_if.wr wrif,
    cpu_control_if cpucif,
    register_file_if rfif,
    pc_if pcif
);

    always_comb begin
        //register file
        if (wrif.jaltype) rfif.wdat = wrif.npc;
        else begin
            if (wrif.ldtype) rfif.wdat = wrif.extOut;
            else rfif.wdat = wrif.memReg;
        end

        rfif.WEN = wrif.Reg_Wen;

        /*if (wrif.jaltype) rfif.wsel = 31;
        else*/ rfif.wsel = wrif.wreg;


    end

endmodule
