onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -radix unsigned /system_tb/PROG/cycles
add wave -noupdate -divider DP1
add wave -noupdate -expand -group FETCH /system_tb/DUT/CPU/DP0/fif/npc_r
add wave -noupdate -expand -group FETCH /system_tb/DUT/CPU/DP0/fif/iaddr
add wave -noupdate -expand -group FETCH /system_tb/DUT/CPU/DP0/fif/imemload
add wave -noupdate -expand -group FETCH /system_tb/DUT/CPU/DP0/fif/instr_r
add wave -noupdate -expand -group FETCH /system_tb/DUT/CPU/DP0/fif/immtype
add wave -noupdate -expand -group FETCH /system_tb/DUT/CPU/DP0/fif/branch
add wave -noupdate -expand -group FETCH /system_tb/DUT/CPU/DP0/fif/branch_r
add wave -noupdate -expand -group FETCH /system_tb/DUT/CPU/DP0/fif/branchTarget
add wave -noupdate -expand -group FETCH /system_tb/DUT/CPU/DP0/fif/iren
add wave -noupdate -expand -group FETCH /system_tb/DUT/CPU/DP0/huif/halttype
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/npc
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/instr
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/instr_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/opcode_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/wreg_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/rs_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/rt_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/rdat1_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/rdat2_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/bdat_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/extOut_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/npc_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/jaltype_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/ldtype_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/PCSrc_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/Reg_Wen_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/dwen_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/dren_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/jtype_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/MemToReg_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/jrtype_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/immtype_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/halt_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/alutype_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/branch
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/branch_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/ALUOP_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/funct_r
add wave -noupdate -expand -group DECODE /system_tb/DUT/CPU/DP0/dif/imm16_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/jaltype
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/ldtype
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/PCSrc
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/Reg_Wen
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/dwen
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/dren
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/jtype
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/MemToReg
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/jrtype
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/immtype
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/dhit
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/halt
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/forwardA
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/forwardB
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/portA
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/portB
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/dstore
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/extOut
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/npc
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/ALUOP
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/wreg_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/wreg
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/opcode
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/opcode_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/Zero_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/jaltype_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/ldtype_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/PCSrc_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/Reg_Wen_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/dwen_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/dren_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/jtype_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/MemToReg_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/immtype_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/halt_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/PCSrc_n
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/jrtype_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/portOut_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/dstore_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/extOut_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/npc_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/rd_wb
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/rd_mem
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/branch
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/branch_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/funct
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/funct_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/rs
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/rt
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/rs_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/rt_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/instr
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/instr_r
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/imm16
add wave -noupdate -group EXECUTE /system_tb/DUT/CPU/DP0/eif/imm16_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/dhit
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/halt
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/dmemload
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/dmemaddr
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/memReg_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/memReg_n
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/dstore
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/npc
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/npc_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/extOut
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/extOut_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/wreg
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/wreg_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/jaltype
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/ldtype
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/PCSrc
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/Reg_Wen
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/dwen
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/dren
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/jtype
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/MemToReg
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/immtype
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/jrtype
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/jaltype_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/ldtype_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/PCSrc_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/Reg_Wen_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/jtype_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/immtype_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/halt_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/jrtype_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/opcode
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/opcode_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/opcode_curr
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/funct
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/funct_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/rs
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/rt
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/rs_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/rt_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/instr
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/instr_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/dstore_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/portO_r
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/imm16
add wave -noupdate -group MEMORY /system_tb/DUT/CPU/DP0/mif/imm16_r
add wave -noupdate -group WRITEBACK /system_tb/DUT/CPU/DP0/wrif/wreg
add wave -noupdate -group WRITEBACK /system_tb/DUT/CPU/DP0/wrif/memReg
add wave -noupdate -group WRITEBACK /system_tb/DUT/CPU/DP0/wrif/npc
add wave -noupdate -group WRITEBACK /system_tb/DUT/CPU/DP0/wrif/extOut
add wave -noupdate -group WRITEBACK /system_tb/DUT/CPU/DP0/wrif/jaltype
add wave -noupdate -group WRITEBACK /system_tb/DUT/CPU/DP0/wrif/ldtype
add wave -noupdate -group WRITEBACK /system_tb/DUT/CPU/DP0/wrif/PCSrc
add wave -noupdate -group WRITEBACK /system_tb/DUT/CPU/DP0/wrif/Reg_Wen
add wave -noupdate -group WRITEBACK /system_tb/DUT/CPU/DP0/wrif/jtype
add wave -noupdate -group WRITEBACK /system_tb/DUT/CPU/DP0/wrif/immtype
add wave -noupdate -group WRITEBACK /system_tb/DUT/CPU/DP0/wrif/wbEN
add wave -noupdate -divider modules
add wave -noupdate -expand -group DP /system_tb/DUT/CPU/DP0/dpif/dhit
add wave -noupdate -expand -group DP /system_tb/DUT/CPU/DP0/dpif/dmemaddr
add wave -noupdate -expand -group DP /system_tb/DUT/CPU/DP0/dpif/dmemload
add wave -noupdate -expand -group DP /system_tb/DUT/CPU/DP0/dpif/dmemREN
add wave -noupdate -expand -group DP /system_tb/DUT/CPU/DP0/dpif/dmemstore
add wave -noupdate -expand -group DP /system_tb/DUT/CPU/DP0/dpif/dmemWEN
add wave -noupdate -expand -group DP /system_tb/DUT/CPU/DP0/dpif/datomic
add wave -noupdate -expand -group DP /system_tb/DUT/CPU/DP0/dpif/flushed
add wave -noupdate -expand -group DP /system_tb/DUT/CPU/DP0/dpif/halt
add wave -noupdate -expand -group DP /system_tb/DUT/CPU/DP0/dpif/ihit
add wave -noupdate -expand -group DP /system_tb/DUT/CPU/DP0/dpif/imemaddr
add wave -noupdate -expand -group DP /system_tb/DUT/CPU/DP0/dpif/imemload
add wave -noupdate -expand -group DP /system_tb/DUT/CPU/DP0/dpif/imemREN
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/zero
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/jaltype
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/ldtype
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/alutype
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/PCSrc
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/ihit
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/halt
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/immtype
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/Reg_Wen
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/dwen
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/dren
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/RegDst
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/jtype
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/iren
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/MemToReg
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/dhit
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/jrtype
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/ExtOp
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/opcode
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/funct
add wave -noupdate -group CPUCTRL /system_tb/DUT/CPU/DP0/cpucif/ALUOP
add wave -noupdate -group DECODER /system_tb/DUT/CPU/DP0/dcif/instr
add wave -noupdate -group DECODER /system_tb/DUT/CPU/DP0/dcif/rd
add wave -noupdate -group DECODER /system_tb/DUT/CPU/DP0/dcif/rs
add wave -noupdate -group DECODER /system_tb/DUT/CPU/DP0/dcif/rt
add wave -noupdate -group DECODER /system_tb/DUT/CPU/DP0/dcif/imm16
add wave -noupdate -group DECODER /system_tb/DUT/CPU/DP0/dcif/imm26
add wave -noupdate -group DECODER /system_tb/DUT/CPU/DP0/dcif/opcode
add wave -noupdate -group DECODER /system_tb/DUT/CPU/DP0/dcif/funct
add wave -noupdate -group EXTENDER /system_tb/DUT/CPU/DP0/exif/imm16
add wave -noupdate -group EXTENDER /system_tb/DUT/CPU/DP0/exif/imm26
add wave -noupdate -group EXTENDER /system_tb/DUT/CPU/DP0/exif/ExtOp
add wave -noupdate -group EXTENDER /system_tb/DUT/CPU/DP0/exif/immtype
add wave -noupdate -group EXTENDER /system_tb/DUT/CPU/DP0/exif/imm32
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP0/aluif/ALUOP
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP0/aluif/portA
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP0/aluif/portB
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP0/aluif/portOut
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP0/aluif/Neg
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP0/aluif/Over
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP0/aluif/Zero
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP0/pcif/jtype
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP0/pcif/halttype
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP0/pcif/PCSrc
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP0/pcif/immtype
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP0/pcif/immAddr
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP0/pcif/aluAddr
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP0/pcif/PCOut
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP0/pcif/npc
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP0/pcif/npc_r
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP0/pcif/nPCOut
add wave -noupdate -expand -group PC /system_tb/DUT/CPU/DP0/pcif/pcDst
add wave -noupdate -group HAZARD /system_tb/DUT/CPU/DP0/huif/drenEX
add wave -noupdate -group HAZARD /system_tb/DUT/CPU/DP0/huif/dwen_id
add wave -noupdate -group HAZARD /system_tb/DUT/CPU/DP0/huif/stall
add wave -noupdate -group HAZARD /system_tb/DUT/CPU/DP0/huif/flush
add wave -noupdate -group HAZARD /system_tb/DUT/CPU/DP0/huif/halttype
add wave -noupdate -group HAZARD /system_tb/DUT/CPU/DP0/huif/dstall
add wave -noupdate -group HAZARD /system_tb/DUT/CPU/DP0/huif/rs_id
add wave -noupdate -group HAZARD /system_tb/DUT/CPU/DP0/huif/rt_id
add wave -noupdate -group HAZARD /system_tb/DUT/CPU/DP0/huif/rtEX
add wave -noupdate -group HAZARD /system_tb/DUT/CPU/DP0/huif/rtMEM
add wave -noupdate -group FOWARD /system_tb/DUT/CPU/DP0/fuif/rd_mem
add wave -noupdate -group FOWARD /system_tb/DUT/CPU/DP0/fuif/rd_wb
add wave -noupdate -group FOWARD /system_tb/DUT/CPU/DP0/fuif/forwardA
add wave -noupdate -group FOWARD /system_tb/DUT/CPU/DP0/fuif/forwardB
add wave -noupdate -group FOWARD /system_tb/DUT/CPU/DP0/fuif/Mem_RegWrite
add wave -noupdate -group FOWARD /system_tb/DUT/CPU/DP0/fuif/Wb_RegWrite
add wave -noupdate -group FOWARD /system_tb/DUT/CPU/DP0/fuif/Mem_dren
add wave -noupdate -group FOWARD /system_tb/DUT/CPU/DP0/fuif/alutype
add wave -noupdate -group FOWARD /system_tb/DUT/CPU/DP0/fuif/ID_dwen
add wave -noupdate -group FOWARD /system_tb/DUT/CPU/DP0/fuif/jaltype_wb
add wave -noupdate -group FOWARD /system_tb/DUT/CPU/DP0/fuif/rs
add wave -noupdate -group FOWARD /system_tb/DUT/CPU/DP0/fuif/rt
add wave -noupdate -group REGFILE /system_tb/DUT/CPU/DP0/rfif/WEN
add wave -noupdate -group REGFILE /system_tb/DUT/CPU/DP0/rfif/wsel
add wave -noupdate -group REGFILE /system_tb/DUT/CPU/DP0/rfif/rsel1
add wave -noupdate -group REGFILE /system_tb/DUT/CPU/DP0/rfif/rsel2
add wave -noupdate -group REGFILE /system_tb/DUT/CPU/DP0/rfif/wdat
add wave -noupdate -group REGFILE /system_tb/DUT/CPU/DP0/rfif/rdat1
add wave -noupdate -group REGFILE /system_tb/DUT/CPU/DP0/rfif/rdat2
add wave -noupdate -group REGFILE /system_tb/DUT/CPU/DP0/DUTrf/next_Register
add wave -noupdate -group REGFILE -expand /system_tb/DUT/CPU/DP0/DUTrf/Register
add wave -noupdate -group ICACHE /system_tb/DUT/CPU/CM0/ICACHE/cache_index
add wave -noupdate -group ICACHE /system_tb/DUT/CPU/CM0/ICACHE/incoming_tag
add wave -noupdate -group ICACHE /system_tb/DUT/CPU/CM0/ICACHE/imiss
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/nextState
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/state
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/daddr
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/nextDaddr
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/index
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/nextIndex
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/tag
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/nextTag
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/frameSel
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/nextFrameSel
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/byteOffset
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/nextByteOffset
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/store
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/nextStore
add wave -noupdate -group DCACHE -subitemconfig {{/system_tb/DUT/CPU/CM0/DCACHE/dcache[7]} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcache[7].frame} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcache[6]} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcache[6].frame} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcache[5]} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcache[5].frame} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcache[4]} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcache[4].frame} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcache[3]} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcache[3].frame} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcache[2]} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcache[2].frame} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcache[1]} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcache[1].frame} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcache[0]} -expand {/system_tb/DUT/CPU/CM0/DCACHE/dcache[0].frame} -expand} /system_tb/DUT/CPU/CM0/DCACHE/dcache
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/next_dcache
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/blockSel
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/nextBlockSel
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/doperation
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/nextDoperation
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/hitCounter
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/nextHitCounter
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/flush
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/nextFlushed
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/haltIndex
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/nextHaltIndex
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/haltFrame
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/nextHaltFrame
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/snoopingTag
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/snoopingIndex
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/matchFrame
add wave -noupdate -group DCACHE -childformat {{/system_tb/DUT/CPU/CM0/DCACHE/linkReg.register -radix hexadecimal}} -expand -subitemconfig {/system_tb/DUT/CPU/CM0/DCACHE/linkReg.register {-height 16 -radix hexadecimal}} /system_tb/DUT/CPU/CM0/DCACHE/linkReg
add wave -noupdate -group DCACHE /system_tb/DUT/CPU/CM0/DCACHE/nextLinkReg
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/iREN
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/iaddr
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/dREN
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/dWEN
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/daddr
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/dstore
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/ramload
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/ramstate
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/cctrans
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/ccwrite
add wave -noupdate -group CC -divider <NULL>
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/iwait
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/dwait
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/iload
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/dload
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/ramstore
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/ramaddr
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/ramWEN
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/ramREN
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/ccwait
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/ccinv
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/ccif/ccsnoopaddr
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/cacheToCache
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/nextCacheToCache
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/nextccwait
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/nextccinv
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/nextccsnoopaddr
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/requestor
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/nextRequestor
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/state
add wave -noupdate -group CC /system_tb/DUT/CPU/CC/nextState
TreeUpdate [SetDefaultTree]
quietly WaveActivateNextPane
add wave -noupdate -group FETCH2 /system_tb/DUT/CPU/DP1/fif/npc_r
add wave -noupdate -group FETCH2 /system_tb/DUT/CPU/DP1/fif/iaddr
add wave -noupdate -group FETCH2 /system_tb/DUT/CPU/DP1/fif/imemload
add wave -noupdate -group FETCH2 /system_tb/DUT/CPU/DP1/fif/instr_r
add wave -noupdate -group FETCH2 /system_tb/DUT/CPU/DP1/fif/immtype
add wave -noupdate -group FETCH2 /system_tb/DUT/CPU/DP1/fif/branch
add wave -noupdate -group FETCH2 /system_tb/DUT/CPU/DP1/fif/branch_r
add wave -noupdate -group FETCH2 /system_tb/DUT/CPU/DP1/fif/branchTarget
add wave -noupdate -group FETCH2 /system_tb/DUT/CPU/DP1/fif/iren
add wave -noupdate -group FETCH2 /system_tb/DUT/CPU/DP1/huif/halttype
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/npc
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/instr
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/instr_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/opcode_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/wreg_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/rs_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/rt_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/rdat1_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/rdat2_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/bdat_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/extOut_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/npc_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/jaltype_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/ldtype_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/PCSrc_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/Reg_Wen_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/dwen_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/dren_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/jtype_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/MemToReg_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/jrtype_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/immtype_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/halt_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/alutype_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/branch
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/branch_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/ALUOP_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/funct_r
add wave -noupdate -group DECODE2 /system_tb/DUT/CPU/DP1/dif/imm16_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/jaltype
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/ldtype
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/PCSrc
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/Reg_Wen
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/dwen
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/dren
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/jtype
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/RegDst
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/MemToReg
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/jrtype
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/immtype
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/dhit
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/halt
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/forwardA
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/forwardB
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/portA
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/portB
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/dstore
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/extOut
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/npc
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/ALUOP
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/wreg_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/wreg
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/opcode
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/opcode_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/Zero_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/jaltype_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/ldtype_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/PCSrc_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/Reg_Wen_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/dwen_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/dren_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/jtype_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/RegDst_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/MemToReg_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/immtype_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/halt_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/PCSrc_n
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/jrtype_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/portOut_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/dstore_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/extOut_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/npc_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/portA_mem
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/rd_wb
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/rd_mem
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/branch
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/branch_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/funct
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/funct_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/rs
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/rt
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/rs_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/rt_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/instr
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/instr_r
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/imm16
add wave -noupdate -group EXECUTE2 /system_tb/DUT/CPU/DP1/eif/imm16_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/dhit
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/halt
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/dmemload
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/dmemaddr
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/memReg_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/memReg_n
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/dstore
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/npc
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/npc_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/extOut
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/extOut_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/wreg
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/wreg_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/jaltype
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/ldtype
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/PCSrc
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/Reg_Wen
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/dwen
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/dren
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/jtype
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/MemToReg
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/immtype
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/jrtype
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/jaltype_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/ldtype_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/PCSrc_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/Reg_Wen_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/jtype_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/immtype_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/halt_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/jrtype_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/opcode
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/opcode_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/opcode_curr
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/funct
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/funct_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/rs
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/rt
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/rs_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/rt_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/instr
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/instr_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/dstore_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/portO_r
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/imm16
add wave -noupdate -group MEMORY2 /system_tb/DUT/CPU/DP1/mif/imm16_r
add wave -noupdate -group WRITEBACK2 /system_tb/DUT/CPU/DP1/wrif/wreg
add wave -noupdate -group WRITEBACK2 /system_tb/DUT/CPU/DP1/wrif/memReg
add wave -noupdate -group WRITEBACK2 /system_tb/DUT/CPU/DP1/wrif/npc
add wave -noupdate -group WRITEBACK2 /system_tb/DUT/CPU/DP1/wrif/extOut
add wave -noupdate -group WRITEBACK2 /system_tb/DUT/CPU/DP1/wrif/jaltype
add wave -noupdate -group WRITEBACK2 /system_tb/DUT/CPU/DP1/wrif/ldtype
add wave -noupdate -group WRITEBACK2 /system_tb/DUT/CPU/DP1/wrif/PCSrc
add wave -noupdate -group WRITEBACK2 /system_tb/DUT/CPU/DP1/wrif/Reg_Wen
add wave -noupdate -group WRITEBACK2 /system_tb/DUT/CPU/DP1/wrif/jtype
add wave -noupdate -group WRITEBACK2 /system_tb/DUT/CPU/DP1/wrif/immtype
add wave -noupdate -group WRITEBACK2 /system_tb/DUT/CPU/DP1/wrif/wbEN
add wave -noupdate -divider modules
add wave -noupdate -expand -group DP2 /system_tb/DUT/CPU/DP1/dpif/halt
add wave -noupdate -expand -group DP2 /system_tb/DUT/CPU/DP1/dpif/ihit
add wave -noupdate -expand -group DP2 /system_tb/DUT/CPU/DP1/dpif/imemREN
add wave -noupdate -expand -group DP2 /system_tb/DUT/CPU/DP1/dpif/imemload
add wave -noupdate -expand -group DP2 /system_tb/DUT/CPU/DP1/dpif/imemaddr
add wave -noupdate -expand -group DP2 /system_tb/DUT/CPU/DP1/dpif/dhit
add wave -noupdate -expand -group DP2 /system_tb/DUT/CPU/DP1/dpif/dmemload
add wave -noupdate -expand -group DP2 /system_tb/DUT/CPU/DP1/dpif/dmemREN
add wave -noupdate -expand -group DP2 /system_tb/DUT/CPU/DP1/dpif/dmemWEN
add wave -noupdate -expand -group DP2 /system_tb/DUT/CPU/DP1/dpif/datomic
add wave -noupdate -expand -group DP2 /system_tb/DUT/CPU/DP1/dpif/flushed
add wave -noupdate -expand -group DP2 /system_tb/DUT/CPU/DP1/dpif/dmemstore
add wave -noupdate -expand -group DP2 /system_tb/DUT/CPU/DP1/dpif/dmemaddr
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/zero
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/jaltype
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/ldtype
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/alutype
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/PCSrc
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/ihit
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/halt
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/immtype
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/Reg_Wen
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/dwen
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/dren
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/RegDst
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/jtype
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/iren
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/MemToReg
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/dhit
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/jrtype
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/ExtOp
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/opcode
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/funct
add wave -noupdate -group CPUCTRL2 /system_tb/DUT/CPU/DP1/cpucif/ALUOP
add wave -noupdate -group DECODER2 /system_tb/DUT/CPU/DP1/dcif/instr
add wave -noupdate -group DECODER2 /system_tb/DUT/CPU/DP1/dcif/rd
add wave -noupdate -group DECODER2 /system_tb/DUT/CPU/DP1/dcif/rs
add wave -noupdate -group DECODER2 /system_tb/DUT/CPU/DP1/dcif/rt
add wave -noupdate -group DECODER2 /system_tb/DUT/CPU/DP1/dcif/imm16
add wave -noupdate -group DECODER2 /system_tb/DUT/CPU/DP1/dcif/imm26
add wave -noupdate -group DECODER2 /system_tb/DUT/CPU/DP1/dcif/opcode
add wave -noupdate -group DECODER2 /system_tb/DUT/CPU/DP1/dcif/funct
add wave -noupdate -group ALU2 /system_tb/DUT/CPU/DP1/aluif/ALUOP
add wave -noupdate -group ALU2 /system_tb/DUT/CPU/DP1/aluif/portA
add wave -noupdate -group ALU2 /system_tb/DUT/CPU/DP1/aluif/portB
add wave -noupdate -group ALU2 /system_tb/DUT/CPU/DP1/aluif/portOut
add wave -noupdate -group ALU2 /system_tb/DUT/CPU/DP1/aluif/Neg
add wave -noupdate -group ALU2 /system_tb/DUT/CPU/DP1/aluif/Over
add wave -noupdate -group ALU2 /system_tb/DUT/CPU/DP1/aluif/Zero
add wave -noupdate -expand -group REGFILE2 /system_tb/DUT/CPU/DP1/rfif/WEN
add wave -noupdate -expand -group REGFILE2 /system_tb/DUT/CPU/DP1/rfif/wsel
add wave -noupdate -expand -group REGFILE2 /system_tb/DUT/CPU/DP1/rfif/rsel1
add wave -noupdate -expand -group REGFILE2 /system_tb/DUT/CPU/DP1/rfif/rsel2
add wave -noupdate -expand -group REGFILE2 /system_tb/DUT/CPU/DP1/rfif/wdat
add wave -noupdate -expand -group REGFILE2 /system_tb/DUT/CPU/DP1/rfif/rdat1
add wave -noupdate -expand -group REGFILE2 /system_tb/DUT/CPU/DP1/rfif/rdat2
add wave -noupdate -expand -group REGFILE2 /system_tb/DUT/CPU/DP1/DUTrf/next_Register
add wave -noupdate -expand -group REGFILE2 -expand /system_tb/DUT/CPU/DP1/DUTrf/Register
add wave -noupdate -group EXTENDER2 /system_tb/DUT/CPU/DP1/exif/imm16
add wave -noupdate -group EXTENDER2 /system_tb/DUT/CPU/DP1/exif/imm26
add wave -noupdate -group EXTENDER2 /system_tb/DUT/CPU/DP1/exif/ExtOp
add wave -noupdate -group EXTENDER2 /system_tb/DUT/CPU/DP1/exif/immtype
add wave -noupdate -group EXTENDER2 /system_tb/DUT/CPU/DP1/exif/imm32
add wave -noupdate -group PC2 /system_tb/DUT/CPU/DP1/pcif/jtype
add wave -noupdate -group PC2 /system_tb/DUT/CPU/DP1/pcif/halttype
add wave -noupdate -group PC2 /system_tb/DUT/CPU/DP1/pcif/PCSrc
add wave -noupdate -group PC2 /system_tb/DUT/CPU/DP1/pcif/immtype
add wave -noupdate -group PC2 /system_tb/DUT/CPU/DP1/pcif/immAddr
add wave -noupdate -group PC2 /system_tb/DUT/CPU/DP1/pcif/aluAddr
add wave -noupdate -group PC2 /system_tb/DUT/CPU/DP1/pcif/PCOut
add wave -noupdate -group PC2 /system_tb/DUT/CPU/DP1/pcif/npc
add wave -noupdate -group PC2 /system_tb/DUT/CPU/DP1/pcif/npc_r
add wave -noupdate -group PC2 /system_tb/DUT/CPU/DP1/pcif/nPCOut
add wave -noupdate -group PC2 /system_tb/DUT/CPU/DP1/pcif/pcDst
add wave -noupdate -group HAZARD2 /system_tb/DUT/CPU/DP1/huif/drenEX
add wave -noupdate -group HAZARD2 /system_tb/DUT/CPU/DP1/huif/dwen_id
add wave -noupdate -group HAZARD2 /system_tb/DUT/CPU/DP1/huif/stall
add wave -noupdate -group HAZARD2 /system_tb/DUT/CPU/DP1/huif/flush
add wave -noupdate -group HAZARD2 /system_tb/DUT/CPU/DP1/huif/halttype
add wave -noupdate -group HAZARD2 /system_tb/DUT/CPU/DP1/huif/dcEN
add wave -noupdate -group HAZARD2 /system_tb/DUT/CPU/DP1/huif/wbEN
add wave -noupdate -group HAZARD2 /system_tb/DUT/CPU/DP1/huif/memEN
add wave -noupdate -group HAZARD2 /system_tb/DUT/CPU/DP1/huif/exEN
add wave -noupdate -group HAZARD2 /system_tb/DUT/CPU/DP1/huif/dstall
add wave -noupdate -group HAZARD2 /system_tb/DUT/CPU/DP1/huif/rs_id
add wave -noupdate -group HAZARD2 /system_tb/DUT/CPU/DP1/huif/rt_id
add wave -noupdate -group HAZARD2 /system_tb/DUT/CPU/DP1/huif/rtEX
add wave -noupdate -group HAZARD2 /system_tb/DUT/CPU/DP1/huif/rtMEM
add wave -noupdate -group FORWARD2 /system_tb/DUT/CPU/DP1/fuif/rd_mem
add wave -noupdate -group FORWARD2 /system_tb/DUT/CPU/DP1/fuif/rd_wb
add wave -noupdate -group FORWARD2 /system_tb/DUT/CPU/DP1/fuif/forwardA
add wave -noupdate -group FORWARD2 /system_tb/DUT/CPU/DP1/fuif/forwardB
add wave -noupdate -group FORWARD2 /system_tb/DUT/CPU/DP1/fuif/Mem_RegWrite
add wave -noupdate -group FORWARD2 /system_tb/DUT/CPU/DP1/fuif/Wb_RegWrite
add wave -noupdate -group FORWARD2 /system_tb/DUT/CPU/DP1/fuif/Mem_dren
add wave -noupdate -group FORWARD2 /system_tb/DUT/CPU/DP1/fuif/alutype
add wave -noupdate -group FORWARD2 /system_tb/DUT/CPU/DP1/fuif/ID_dwen
add wave -noupdate -group FORWARD2 /system_tb/DUT/CPU/DP1/fuif/jaltype_wb
add wave -noupdate -group FORWARD2 /system_tb/DUT/CPU/DP1/fuif/rs
add wave -noupdate -group FORWARD2 /system_tb/DUT/CPU/DP1/fuif/rt
add wave -noupdate -group ICACHE2 /system_tb/DUT/CPU/CM1/ICACHE/cache_index
add wave -noupdate -group ICACHE2 /system_tb/DUT/CPU/CM1/ICACHE/incoming_tag
add wave -noupdate -group ICACHE2 /system_tb/DUT/CPU/CM1/ICACHE/imiss
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/nextState
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/state
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/daddr
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/nextDaddr
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/index
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/nextIndex
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/tag
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/nextTag
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/frameSel
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/nextFrameSel
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/byteOffset
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/nextByteOffset
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/blockSel
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/nextBlockSel
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/doperation
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/nextDoperation
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/store
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/nextStore
add wave -noupdate -expand -group DCACHE2 -expand -subitemconfig {{/system_tb/DUT/CPU/CM1/DCACHE/dcache[7]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcache[7].frame} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcache[6]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcache[6].frame} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcache[5]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcache[5].frame} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcache[4]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcache[4].frame} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcache[3]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcache[3].frame} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcache[2]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcache[2].frame} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcache[1]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcache[1].frame} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcache[0]} -expand {/system_tb/DUT/CPU/CM1/DCACHE/dcache[0].frame} -expand} /system_tb/DUT/CPU/CM1/DCACHE/dcache
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/next_dcache
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/hitCounter
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/nextHitCounter
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/flush
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/nextFlushed
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/haltIndex
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/nextHaltIndex
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/haltFrame
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/nextHaltFrame
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/snoopingTag
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/snoopingIndex
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/matchFrame
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/atomic
add wave -noupdate -expand -group DCACHE2 /system_tb/DUT/CPU/CM1/DCACHE/nextAtomic
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {26140222 ps} 1} {{Cursor 3} {25388712 ps} 1}
quietly wave cursor active 2
configure wave -namecolwidth 195
configure wave -valuecolwidth 245
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {25122835 ps} {25992139 ps}
