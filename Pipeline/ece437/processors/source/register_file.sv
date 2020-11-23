`include "register_file_if.vh"

module register_file
(
    input logic CLK,
    input logic nRST,
    register_file_if.rf rfif
);

    logic [31:0] Register [31:0]; //32 registers, each 32bits
    logic [31:0] next_Register [31:0]; //next value for registers

    //registers
    always_ff @ (negedge CLK, negedge nRST)
    begin
        if (nRST == 1'b0)
        begin
            Register <= '{default:'0};
        end
        else
        begin
            Register <= next_Register;
        end
    end

    //write select decoder
    always_comb
    begin
        next_Register = Register;
        
        if (rfif.WEN)
        begin
            if (rfif.wsel != 5'b0)
            begin
                next_Register[rfif.wsel] = rfif.wdat;
            end   
        end
        
    end

    //read select mux
    always_comb
    begin
        rfif.rdat1 = Register[rfif.rsel1];
        rfif.rdat2 = Register[rfif.rsel2];
    end

endmodule