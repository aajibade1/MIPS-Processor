onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /system_tb/CLK
add wave -noupdate /system_tb/nRST
add wave -noupdate -radix unsigned /system_tb/PROG/cycles
add wave -noupdate /system_tb/DUT/CPU/DP/DUTc/ccif/ihit
add wave -noupdate /system_tb/DUT/CPU/DP/DUTc/ccif/dhit
add wave -noupdate -divider Signals
add wave -noupdate -expand -group Fetch /system_tb/DUT/CPU/DP/fif/iren
add wave -noupdate -expand -group Fetch /system_tb/DUT/CPU/DP/fif/imemload
add wave -noupdate -expand -group Fetch /system_tb/DUT/CPU/DP/fif/iaddr
add wave -noupdate -expand -group Fetch /system_tb/DUT/CPU/DP/fif/npc_r
add wave -noupdate -expand -group Fetch /system_tb/DUT/CPU/DP/fif/instr_r
add wave -noupdate -expand -group Fetch /system_tb/DUT/CPU/DP/fif/immtype
add wave -noupdate -expand -group Fetch /system_tb/DUT/CPU/DP/fif/branchTarget
add wave -noupdate -expand -group Fetch /system_tb/DUT/CPU/DP/fif/branch
add wave -noupdate -expand -group Fetch /system_tb/DUT/CPU/DP/fif/branch_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/instr
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/npc
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/branch
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/branch_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/opcode_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/rdat1_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/rdat2_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/bdat_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/extOut_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/npc_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/jaltype_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/ldtype_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/PCSrc_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/Reg_Wen_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/dwen_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/dren_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/jtype_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/MemToReg_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/jrtype_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/immtype_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/wreg_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/ALUOP_r
add wave -noupdate -expand -group Decode /system_tb/DUT/CPU/DP/dif/halt_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/jaltype
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/ldtype
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/PCSrc
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/Reg_Wen
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/dwen
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/dren
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/jtype
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/MemToReg
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/jrtype
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/immtype
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/portA
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/portB
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/dstore
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/extOut
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/npc
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/ALUOP
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/wreg
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/opcode
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/halt
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/PCSrc_n
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/branch
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/branch_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/opcode_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/halt_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/DUTe/eif/dwen_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/DUTe/eif/dren_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/wreg_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/Zero_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/jaltype_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/ldtype_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/PCSrc_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/Reg_Wen_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/dwen_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/dren_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/jtype_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/MemToReg_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/immtype_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/portOut_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/dstore_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/extOut_r
add wave -noupdate -group Execute /system_tb/DUT/CPU/DP/eif/npc_r
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/dhit
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/dmemload
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/dmemaddr
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/DUTm/mif/dstore
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/npc
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/extOut
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/wreg
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/jaltype
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/ldtype
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/PCSrc
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/Reg_Wen
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/jtype
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/MemToReg
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/immtype
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/DUTm/mif/dwen
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/DUTm/mif/dren
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/halt
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/halt_r
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/jaltype_r
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/ldtype_r
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/PCSrc_r
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/wreg_r
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/extOut_r
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/Reg_Wen_r
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/npc_r
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/memReg_r
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/jtype_r
add wave -noupdate -group Memory /system_tb/DUT/CPU/DP/mif/immtype_r
add wave -noupdate -group {Write Back} /system_tb/DUT/CPU/DP/wrif/wreg
add wave -noupdate -group {Write Back} /system_tb/DUT/CPU/DP/wrif/memReg
add wave -noupdate -group {Write Back} /system_tb/DUT/CPU/DP/wrif/npc
add wave -noupdate -group {Write Back} /system_tb/DUT/CPU/DP/wrif/extOut
add wave -noupdate -group {Write Back} /system_tb/DUT/CPU/DP/wrif/jaltype
add wave -noupdate -group {Write Back} /system_tb/DUT/CPU/DP/wrif/ldtype
add wave -noupdate -group {Write Back} /system_tb/DUT/CPU/DP/wrif/PCSrc
add wave -noupdate -group {Write Back} /system_tb/DUT/CPU/DP/wrif/Reg_Wen
add wave -noupdate -group {Write Back} /system_tb/DUT/CPU/DP/wrif/jtype
add wave -noupdate -group {Write Back} /system_tb/DUT/CPU/DP/wrif/immtype
add wave -noupdate -divider modules
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/opcode
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/ihit
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/dhit
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/jaltype
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/ldtype
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/alutype
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/PCSrc
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/halt
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/immtype
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/Reg_Wen
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/dwen
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/dren
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/RegDst
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/jtype
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/iren
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/MemToReg
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/jrtype
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/cpucif/halt
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/ExtOp
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/funct
add wave -noupdate -expand -group Control /system_tb/DUT/CPU/DP/DUTc/ccif/ALUOP
add wave -noupdate -expand -group Decoder /system_tb/DUT/CPU/DP/DUTdc/dif/instr
add wave -noupdate -expand -group Decoder /system_tb/DUT/CPU/DP/DUTdc/dif/rd
add wave -noupdate -expand -group Decoder /system_tb/DUT/CPU/DP/DUTdc/dif/rs
add wave -noupdate -expand -group Decoder -radix hexadecimal /system_tb/DUT/CPU/DP/DUTdc/dif/rt
add wave -noupdate -expand -group Decoder -radix hexadecimal /system_tb/DUT/CPU/DP/DUTdc/dif/imm16
add wave -noupdate -expand -group Decoder /system_tb/DUT/CPU/DP/DUTdc/dif/imm26
add wave -noupdate -expand -group Decoder /system_tb/DUT/CPU/DP/DUTdc/dif/opcode
add wave -noupdate -expand -group Decoder /system_tb/DUT/CPU/DP/DUTdc/dif/funct
add wave -noupdate -group PC /system_tb/DUT/CPU/DP/DUTp/pif/jtype
add wave -noupdate -group PC /system_tb/DUT/CPU/DP/DUTp/pif/halttype
add wave -noupdate -group PC /system_tb/DUT/CPU/DP/DUTp/pif/PCSrc
add wave -noupdate -group PC /system_tb/DUT/CPU/DP/DUTp/pif/immtype
add wave -noupdate -group PC /system_tb/DUT/CPU/DP/DUTp/pif/immAddr
add wave -noupdate -group PC /system_tb/DUT/CPU/DP/DUTp/pif/aluAddr
add wave -noupdate -group PC -radix hexadecimal /system_tb/DUT/CPU/DP/pcif/nPCOut
add wave -noupdate -group PC -radix hexadecimal /system_tb/DUT/CPU/DP/DUTp/pif/npc
add wave -noupdate -group PC -radix hexadecimal /system_tb/DUT/CPU/DP/pcif/pcDst
add wave -noupdate -group PC -radix hexadecimal /system_tb/DUT/CPU/DP/DUTp/pif/PCOut
add wave -noupdate -group Extender -radix hexadecimal /system_tb/DUT/CPU/DP/DUTex/exif/imm16
add wave -noupdate -group Extender /system_tb/DUT/CPU/DP/DUTex/exif/imm26
add wave -noupdate -group Extender /system_tb/DUT/CPU/DP/DUTex/exif/ExtOp
add wave -noupdate -group Extender /system_tb/DUT/CPU/DP/DUTex/exif/immtype
add wave -noupdate -group Extender /system_tb/DUT/CPU/DP/DUTex/exif/imm32
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/aluif/ALUOP
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/aluif/portA
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/aluif/portB
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/aluif/portOut
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/aluif/Neg
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/aluif/Over
add wave -noupdate -group ALU /system_tb/DUT/CPU/DP/aluif/Zero
add wave -noupdate -group {Mem Cont} /system_tb/DUT/CPU/ccif/iwait
add wave -noupdate -group {Mem Cont} /system_tb/DUT/CPU/ccif/dwait
add wave -noupdate -group {Mem Cont} /system_tb/DUT/CPU/ccif/iREN
add wave -noupdate -group {Mem Cont} /system_tb/DUT/CPU/ccif/dREN
add wave -noupdate -group {Mem Cont} /system_tb/DUT/CPU/ccif/dWEN
add wave -noupdate -group {Mem Cont} /system_tb/DUT/CPU/ccif/iload
add wave -noupdate -group {Mem Cont} /system_tb/DUT/CPU/ccif/dload
add wave -noupdate -group {Mem Cont} /system_tb/DUT/CPU/ccif/dstore
add wave -noupdate -group {Mem Cont} /system_tb/DUT/CPU/ccif/iaddr
add wave -noupdate -group {Mem Cont} /system_tb/DUT/CPU/ccif/daddr
add wave -noupdate -group {Mem Cont} /system_tb/DUT/CPU/ccif/ramWEN
add wave -noupdate -group {Mem Cont} /system_tb/DUT/CPU/ccif/ramREN
add wave -noupdate -group {Mem Cont} /system_tb/DUT/CPU/ccif/ramstate
add wave -noupdate -group {Mem Cont} /system_tb/DUT/CPU/ccif/ramaddr
add wave -noupdate -group {Mem Cont} /system_tb/DUT/CPU/ccif/ramstore
add wave -noupdate -group {Mem Cont} /system_tb/DUT/CPU/ccif/ramload
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/flush
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/stall
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/drenEX
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/dwen_id
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/halttype
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/rs_id
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/rt_id
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/rtEX
add wave -noupdate -group Hazard /system_tb/DUT/CPU/DP/huif/rtMEM
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/fuif/alutype
add wave -noupdate -group Forward -radix binary /system_tb/DUT/CPU/DP/fuif/forwardA
add wave -noupdate -group Forward -radix binary /system_tb/DUT/CPU/DP/fuif/forwardB
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/fuif/Mem_dren
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/fuif/Mem_RegWrite
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/fuif/rd_mem
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/fuif/rd_wb
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/fuif/rs
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/fuif/rt
add wave -noupdate -group Forward /system_tb/DUT/CPU/DP/fuif/Wb_RegWrite
add wave -noupdate -group {Reg File} /system_tb/DUT/CPU/DP/DUTrf/rfif/WEN
add wave -noupdate -group {Reg File} /system_tb/DUT/CPU/DP/DUTrf/rfif/wsel
add wave -noupdate -group {Reg File} /system_tb/DUT/CPU/DP/DUTrf/rfif/rsel1
add wave -noupdate -group {Reg File} /system_tb/DUT/CPU/DP/DUTrf/rfif/rsel2
add wave -noupdate -group {Reg File} /system_tb/DUT/CPU/DP/DUTrf/rfif/wdat
add wave -noupdate -group {Reg File} /system_tb/DUT/CPU/DP/DUTrf/rfif/rdat1
add wave -noupdate -group {Reg File} /system_tb/DUT/CPU/DP/DUTrf/rfif/rdat2
add wave -noupdate -group {Reg File} -expand /system_tb/DUT/CPU/DP/DUTrf/Register
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {76227 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 66
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
WaveRestoreZoom {0 ps} {866693 ps}
