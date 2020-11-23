`include "cpu_types_pkg.vh"
`include "extender_if.vh"

module extender(
    extender_if.ex exif
);
    import cpu_types_pkg::*;

    word_t temp1;
    word_t temp2;

    always_comb begin
        temp1 = '0;
        temp2 = '0;

        if (exif.ExtOp == 0) begin
            temp1 = {16'h0000, exif.imm16};
            temp2 = {6'b000000, exif.imm26};
        end
        else if (exif.ExtOp == 1) begin
            temp1 = {exif.imm16, 16'h0000};
            temp2 = {exif.imm26, 6'b000000};
        end
        else if (exif.ExtOp == 2) begin
            if (exif.imm16[15] == 0) temp1 = {16'h0000, exif.imm16};
            else temp1 = {16'hffff, exif.imm16};  

            if (exif.imm26[25] == 0) temp2 = {6'b000000, exif.imm26};
            else temp2 = {6'b111111, exif.imm26};
        end

        if (exif.immtype == 0) exif.imm32 = temp1;
        else exif.imm32 = temp2;
    end

endmodule