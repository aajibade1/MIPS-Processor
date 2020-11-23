`include "hazard_unit_if.vh"
`include "decoder_if.vh"
`include "execute_if.vh"
`include "cpu_types_pkg.vh"
`include "datapath_cache_if.vh"
`include "cpu_control_if.vh"
module hazard_unit(
    hazard_unit_if.hu huif,
    decoder_if dcif,
    decode_if dif,
    execute_if eif,
    memory_if mif,
    cpu_control_if cpucif
);
    //imports
    import cpu_types_pkg::*;

    always_comb begin
        huif.stall = 0;
        huif.halttype = 0;
        huif.dstall = 0;

        if ((eif.opcode_r == LW || eif.opcode_r == SW || eif.opcode_r == SC || eif.opcode_r == LL ) && ~(cpucif.dhit && cpucif.ihit)) begin
            huif.dstall = 1;
        end

        if ((huif.drenEX)) begin
            huif.stall = 1;
        end

        else if ((dif.PCSrc_r && ~eif.PCSrc_n) || dif.jrtype_r || (dif.jtype_r && ~dif.branch_r))
        begin
            huif.stall = 1;
        end

        else if (cpucif.dwen && 
                (huif.rtEX != '0) &&
                ((huif.rtEX == huif.rs_id) || (huif.rtEX == huif.rt_id)))
        begin
            huif.stall = 1;
        end
        
        else if (cpucif.dwen && 
                (huif.rtMEM != '0) &&
                ((huif.rtMEM == huif.rs_id) || (huif.rtMEM == huif.rt_id)))
        begin
            huif.stall = 1;
        end
        
        else if (dif.ldtype_r && 
                (huif.rtEX != '0) &&
                ((huif.rtEX == huif.rs_id) || (huif.rtMEM == huif.rt_id)))
        begin
            huif.stall = 1;
        end

        else if (eif.ldtype_r &&
                huif.rtMEM != '0 &&
                ((huif.rtMEM == huif.rs_id) || (huif.rtMEM == huif.rt_id) ))
        begin
            huif.stall = 1;
        end
        
        else begin
            huif.halttype = cpucif.ihit;
        end
    end

    //branching logic
    always_comb begin
        huif.flush = 0;

        //not sure if it can handle jr type
        /*if ((dif.PCSrc_r && ~eif.PCSrc_n) || dif.jrtype_r || (dif.jtype_r && ~dif.branch_r)) begin
            huif.flush = 1;
        end
        else*/ if ((eif.jtype_r && ~eif.PCSrc_r) || eif.jrtype_r || (eif.jtype_r && ~eif.branch_r)) begin
            huif.flush = 1;
        end
    end


endmodule