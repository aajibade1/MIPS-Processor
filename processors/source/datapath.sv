/*
  Eric Villasenor
  evillase@gmail.com

  datapath contains register file, control, hazard,
  muxes, and glue logic for processor
*/

// data path interface
`include "datapath_cache_if.vh"
`include "control_unit_if.vh"
`include "request_unit_if.vh"
`include "program_counter_if.vh"
`include "register_file_if.vh"
`include "alu_if.vh"

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

module datapath (
  input logic CLK, nRST,
  datapath_cache_if.dp dpif
);
  // import types
  import cpu_types_pkg::*;

  // pc init
  parameter PC_INIT = 0;

  control_unit_if cuif();
  request_unit_if ruif();
  program_counter_if pcif();
  register_file_if rfif();
  alu_if aluinf();

  control_unit CU(cuif);
  request_unit RU(CLK, nRST, ruif);
  program_counter PC(CLK, nRST, pcif);
  register_file RF(CLK, nRST, rfif);
  alu ALU(aluinf);

  word_t SignExt, ZeroExt, LuiExt, Jump, BranchNE,BranchEQ,JumpR;

  always_ff @(posedge CLK, negedge nRST) begin
    if (1'b0 == nRST) begin
      dpif.halt <= '0;
    end
    else begin
        dpif.halt <= cuif.halt;
    end
  end
 
  assign ZeroExt = {16'd0, cuif.imm};
  assign LuiExt= {cuif.imm,16'd0};
  assign JumpR = aluinf.PORTA;
  assign Jump = {pcif.npc[31:28], cuif.imemload[25:0], 2'b00};
  assign BranchEQ = aluinf.ZERO ? pcif.npc + {SignExt[29:0], 2'b00} : pcif.npc;
  assign BranchNE = ~aluinf.ZERO ? pcif.npc + {SignExt[29:0], 2'b00} : pcif.npc;

  assign dpif.imemaddr = pcif.pc;
  assign dpif.dmemWEN = ruif.dmemWEN;
  assign dpif.dmemREN = ruif.dmemREN;
  assign dpif.dmemstore = rfif.rdat2;
  assign dpif.dmemaddr = aluinf.OUTPORT;
  assign dpif.imemREN = '1;

  assign rfif.rsel1 = cuif.rs;
  assign rfif.rsel2 = cuif.rt;
  assign pcif.PCen = ruif.ihit;//((ruif.ihit && ~(cuif.dWEN || cuif.dREN))) ? 1 : 0;
  assign aluinf.PORTA = rfif.rdat1;
  assign aluinf.ALUOP = cuif.ALUOP;
  assign cuif.imemload = dpif.imemload;
  assign cuif.dhit = dpif.dhit;
  assign cuif.ihit = dpif.ihit;

  assign ruif.ihit = cuif.ihit;
  assign ruif.dhit = cuif.dhit;
  assign ruif.dWEN = cuif.dWEN;
  assign ruif.dREN = cuif.dREN;


  always_comb begin
    rfif.WEN = 0;
    rfif.wsel = 0;
    rfif.wdat = 0;
    SignExt = cuif.imm[15] ? {16'hffff, cuif.imm} : {16'h0000, cuif.imm};

    //ALU
    if (cuif.ALUSrc == 1'b0) begin
      aluinf.PORTB = rfif.rdat2;
    end
    else begin
      if (cuif.ExtOp == 2'd0) begin
        aluinf.PORTB = ZeroExt;
      end
      else if (cuif.ExtOp == 2'd1) begin
        aluinf.PORTB = SignExt;
      end
      else begin//if (cuif.ExtOp == 2'd2) begin
        aluinf.PORTB = LuiExt;
      end
    end

    if(cuif.PCSrc == 3'd0) begin
      pcif.cpc = pcif.npc;
    end
    else if (cuif.PCSrc == 3'd1) begin
      if (cuif.beq) begin
        pcif.cpc = BranchEQ;
      end
      else begin
        pcif.cpc = BranchNE;
      end
    end
    else if (cuif.PCSrc == 3'd2) begin
      pcif.cpc = Jump;
    end
    else begin//if (cuif.PCSrc == 3'd3) begin
      pcif.cpc = JumpR;
    end
    // else if (cuif.PCSrc == 3'd4) begin
    //   pcif.cpc = Jump;
    // end


    // if(cuif.imemload[31:26] == BEQ) begin
    //   if((aluinf.ZERO == 1'b1) || (cuif.beq == 1'b1)) begin
    //     Branch = pcif.npc + {SignExt[29:0], 2'b00};
    //   end
    //   //else begin
    //     //Branch = pcif.npc;
    //   //end
    // end

    // if(cuif.imemload[31:26] == BNE) begin
    //   if(aluinf.ZERO != 1'b1) begin
    //     Branch = pcif.npc + {SignExt[29:0], 2'b00};
    //   end
    //   //else begin
    //    // Branch = pcif.npc;
    //   //end
    // end


    if(cuif.JALen == 1'b1) begin
      rfif.wdat = pcif.npc;
    end
    else if (cuif.MemtoReg == 1'b1) begin
      rfif.wdat = dpif.dmemload;
    end
    else begin
      rfif.wdat = aluinf.OUTPORT;
    end

    if(cuif.RegDst == 2'd0) begin
      rfif.wsel = cuif.rd;
    end
    else if (cuif.RegDst == 2'd1) begin
      rfif.wsel = cuif.rt;
    end
    else begin//if (cuif.RegDst == 2'd2) begin
      rfif.wsel = 5'd31;
    end

    if(cuif.RegWr & (dpif.ihit | dpif.dhit)) begin
      rfif.WEN = 1'b1;
    end
    else begin
      rfif.WEN = 1'b0;
    end
  end
endmodule
