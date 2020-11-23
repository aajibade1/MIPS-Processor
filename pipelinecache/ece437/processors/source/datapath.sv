`include "datapath_cache_if.vh"
//`include "alu_if.vh"
`include "cpu_control_if.vh"
`include "decoder_if.vh"
`include "pc_if.vh"
`include "register_file_if.vh"
//`include "request_if.vh"
`include "extender_if.vh"

`include "fetch_if.vh"
`include "decode_if.vh"
`include "execute_if.vh"
`include "memory_if.vh"
`include "write_back_if.vh"
`include "hazard_unit_if.vh"
`include "forward_unit_if.vh"

// alu op, mips op, and instruction type
`include "cpu_types_pkg.vh"

module datapath #(PC_INIT = 0) (
  input logic CLK, nRST,
  datapath_cache_if.dp dpif
);
  // import types
  import cpu_types_pkg::*;
  
  //interfaces
  fetch_if fif();
  decode_if dif();
  execute_if eif();
  memory_if mif();
  write_back_if wrif();
  hazard_unit_if huif();
  forward_unit_if fuif();
  alu_if aluif();
  cpu_control_if cpucif();
  decoder_if dcif();
  pc_if pcif();
  register_file_if rfif();
  extender_if exif();

  logic nhalt;

  always_ff @ (posedge CLK, negedge nRST) begin
    if (nRST == 0) begin
      dpif.halt <= 0;
    end
    else begin
      dpif.halt <= nhalt;
    end
  end

  always_comb begin
    
    //halt
    if (mif.halt == 1) nhalt = 1;
    else nhalt = dpif.halt;
    
    //always taken
    if (eif.jrtype_r || (eif.jtype_r && ~eif.branch_r)) begin
      pcif.jtype = eif.jtype_r;
      pcif.PCSrc = eif.PCSrc_r;
      pcif.immAddr = eif.extOut_r;
      pcif.aluAddr = mif.memReg_n;
      pcif.immtype = eif.immtype_r;
      pcif.npc = eif.npc_r;
    end
    else if (fif.branch && ~huif.flush) begin
      pcif.jtype = 1;
      pcif.PCSrc = 1;
      pcif.immAddr = fif.branchTarget;
      pcif.aluAddr = aluop_t'('0);
      pcif.immtype = fif.immtype;
      pcif.npc = pcif.npc_r;
    end
    else begin
      pcif.jtype = eif.jtype_r;
      pcif.PCSrc =  '0;
      pcif.immAddr = eif.extOut_r;
      pcif.aluAddr = mif.memReg_n;
      pcif.immtype = eif.immtype_r;
      pcif.npc = eif.npc_r;
    end
    

    //hazard unit
    huif.rs_id = dcif.rs;
    huif.rt_id = dcif.rt;
    huif.rtEX = dif.wreg_r;
    huif.rtMEM = eif.wreg_r;
    huif.drenEX = dif.dren_r;
    huif.dwen_id =  cpucif.dwen;

    //forward unit
    fuif.rd_mem = eif.wreg_r;
    //if (wrif.jaltype) fuif.rd_wb = wrif.npc;
    fuif.rd_wb = wrif.wreg;
    fuif.rs = dif.rs_r;
    fuif.rt = dif.rt_r;
    fuif.Mem_RegWrite = eif.Reg_Wen_r;
    fuif.Wb_RegWrite = mif.Reg_Wen_r;
    fuif.Mem_dren = eif.dren_r;
    fuif.alutype = dif.alutype_r;
    fuif.ID_dwen = cpucif.dwen;
    fuif.jaltype_wb = wrif.jaltype;
    
    //fetch
    fif.imemload = dpif.imemload;

    dpif.imemREN = fif.iren;
    dpif.imemaddr = fif.iaddr;

    //decode
    dif.instr = fif.instr_r;
    dif.npc = fif.npc_r;
    
    dif.branch = fif.branch_r;

    //execute
    eif.portA = dif.rdat1_r;
    eif.portB = dif.bdat_r;
    eif.dstore = dif.rdat2_r;
    eif.extOut = dif.extOut_r;
    eif.npc = dif.npc_r;
    eif.wreg = dif.wreg_r;
    eif.jaltype = dif.jaltype_r;
    eif.ldtype = dif.ldtype_r;
    eif.PCSrc = dif.PCSrc_r;
    eif.Reg_Wen = dif.Reg_Wen_r;
    eif.dwen = dif.dwen_r;
    eif.dren = dif.dren_r;
    eif.jtype = dif.jtype_r;
    eif.MemToReg = dif.MemToReg_r;
    eif.jrtype = dif.jrtype_r;
    eif.immtype = dif.immtype_r;
    eif.ALUOP = dif.ALUOP_r;
    eif.opcode = dif.opcode_r;
    eif.dhit = dpif.dhit;
    eif.halt = dif.halt_r;
    eif.branch = dif.branch_r;

    eif.funct = dif.funct_r;
    eif.rs = dif.rs_r;
    eif.rt = dif.rt_r;
    eif.instr = dif.instr_r;
    eif.imm16 = dif.imm16_r;

    if (eif.jaltype_r) eif.rd_mem = eif.npc_r;
    else eif.rd_mem = eif.portOut_r;
    
    if(wrif.jaltype) eif.rd_wb = wrif.npc;
    else eif.rd_wb = mif.memReg_r;
    
    eif.forwardA = fuif.forwardA;
    eif.forwardB = fuif.forwardB;

    //controller
    cpucif.ihit = dpif.ihit;
    cpucif.dhit = dpif.dhit;
    cpucif.opcode = dcif.opcode;
    cpucif.funct = dcif.funct;

    dpif.dmemREN = eif.dren_r;
    dpif.dmemWEN = eif.dwen_r;
    dpif.dmemaddr = mif.dmemaddr;
    dpif.dmemstore = mif.dstore;
    if (eif.opcode_r == LL || eif.opcode_r == SC) dpif.datomic = 1;
    else dpif.datomic = 0;

    //memory
    mif.dhit = dpif.dhit;
    mif.dren = eif.dren_r;
    mif.dwen = eif.dwen_r;      
    mif.dmemaddr = eif.portOut_r;
    mif.dstore = eif.dstore_r;
    mif.dmemload = dpif.dmemload;
    mif.wreg = eif.wreg_r;
    mif.npc = eif.npc_r;
    mif.extOut = eif.extOut_r;
    mif.jaltype = eif.jaltype_r;
    mif.ldtype = eif.ldtype_r;
    mif.PCSrc = eif.PCSrc_r;
    mif.Reg_Wen = eif.Reg_Wen_r;
    mif.jtype = eif.jtype_r;
    mif.MemToReg = eif.MemToReg_r;
    mif.immtype = eif.immtype_r;
    mif.dstore = eif.dstore_r; 
    mif.halt = eif.halt_r;    
    mif.jrtype = eif.jrtype_r;
    mif.opcode = eif.opcode_r;

    mif.funct = eif.funct_r;
    mif.rs = eif.rs_r;
    mif.rt = eif.rt_r;
    mif.instr = eif.instr_r;
    mif.imm16 = eif.imm16_r;
    mif.Zero = eif.Zero_r;

    //write back
    wrif.wreg = mif.wreg_r;
    wrif.memReg = mif.memReg_r;
    wrif.npc = mif.npc_r;
    wrif.extOut = mif.extOut_r;
    wrif.jaltype = mif.jaltype_r;
    wrif.ldtype = mif.ldtype_r;
    wrif.PCSrc = mif.PCSrc_r;
    wrif.Reg_Wen = mif.Reg_Wen_r;
    wrif.jtype = mif.jtype_r;
    wrif.immtype = mif.immtype_r;
  end

  cpu_control DUTc(cpucif);
  decoder  DUTdc(dcif);
  pc #(PC_INIT) DUTp (CLK, nRST, pcif, huif);
  register_file DUTrf(CLK, nRST, rfif);
  extender DUTex(exif);
  alu DUTa(aluif);
  forward_unit DUTfu(fuif);
  fetch DUTf(CLK, nRST, fif, cpucif, huif, pcif);
  decode DUTd(CLK, nRST, dif, cpucif, rfif, dcif, exif, huif);
  execute DUTe(CLK, nRST,eif, aluif, cpucif, huif);
  memory DUTm(CLK, nRST, mif, cpucif, huif);
  write_back DUTw(CLK, nRST, wrif, cpucif, rfif);
  hazard_unit DUTh(huif, dcif, dif, eif, mif, cpucif);

endmodule