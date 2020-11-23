`include "cpu_types_pkg.vh"
`include "forward_unit_if.vh"

module forward_unit(
    forward_unit_if.fu fuif
);

    import cpu_types_pkg::*;

    always_comb begin
        fuif.forwardA = '0;
        fuif.forwardB = '0;

        if (fuif.Mem_RegWrite && (fuif.rd_mem != 0) && 
            (fuif.rd_mem == fuif.rs)) 
        begin
            fuif.forwardA = 2'b10;
        end
        else if (fuif.Wb_RegWrite && (fuif.rd_wb != 0) &&
            (fuif.rd_wb == fuif.rs)) 
        begin
            fuif.forwardA = 2'b01;
        end

        if (fuif.Mem_RegWrite && (fuif.rd_mem != 0) && 
            ~fuif.alutype && (fuif.rd_mem == fuif.rt)) 
        begin
            fuif.forwardB = 2'b10;
        end
        else if (fuif.Wb_RegWrite && (fuif.rd_wb != 0) &&
            ~fuif.alutype && (fuif.rd_wb == fuif.rt)) 
        begin
            fuif.forwardB = 2'b01;
        end
    end

endmodule
