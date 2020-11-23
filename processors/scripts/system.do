onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group DATAPATH_CACHE /system_tb/DUT/CPU/DP/dpif/halt
add wave -noupdate -expand -group DATAPATH_CACHE /system_tb/DUT/CPU/DP/dpif/ihit
add wave -noupdate -expand -group DATAPATH_CACHE /system_tb/DUT/CPU/DP/dpif/imemREN
add wave -noupdate -expand -group DATAPATH_CACHE /system_tb/DUT/CPU/DP/dpif/imemload
add wave -noupdate -expand -group DATAPATH_CACHE /system_tb/DUT/CPU/DP/dpif/imemaddr
add wave -noupdate -expand -group DATAPATH_CACHE /system_tb/DUT/CPU/DP/dpif/dhit
add wave -noupdate -expand -group DATAPATH_CACHE /system_tb/DUT/CPU/DP/dpif/datomic
add wave -noupdate -expand -group DATAPATH_CACHE /system_tb/DUT/CPU/DP/dpif/dmemREN
add wave -noupdate -expand -group DATAPATH_CACHE /system_tb/DUT/CPU/DP/dpif/dmemWEN
add wave -noupdate -expand -group DATAPATH_CACHE /system_tb/DUT/CPU/DP/dpif/flushed
add wave -noupdate -expand -group DATAPATH_CACHE /system_tb/DUT/CPU/DP/dpif/dmemload
add wave -noupdate -expand -group DATAPATH_CACHE /system_tb/DUT/CPU/DP/dpif/dmemstore
add wave -noupdate -expand -group DATAPATH_CACHE /system_tb/DUT/CPU/DP/dpif/dmemaddr
add wave -noupdate -expand -group CONTROL_UNIT /system_tb/DUT/CPU/DP/cuif/imemload
add wave -noupdate -expand -group CONTROL_UNIT /system_tb/DUT/CPU/DP/cuif/rs
add wave -noupdate -expand -group CONTROL_UNIT /system_tb/DUT/CPU/DP/cuif/rd
add wave -noupdate -expand -group CONTROL_UNIT /system_tb/DUT/CPU/DP/cuif/rt
add wave -noupdate -expand -group CONTROL_UNIT /system_tb/DUT/CPU/DP/cuif/imm
add wave -noupdate -expand -group CONTROL_UNIT /system_tb/DUT/CPU/DP/cuif/ALUOP
add wave -noupdate -expand -group CONTROL_UNIT /system_tb/DUT/CPU/DP/cuif/JALen
add wave -noupdate -expand -group CONTROL_UNIT /system_tb/DUT/CPU/DP/cuif/iREN
add wave -noupdate -expand -group CONTROL_UNIT /system_tb/DUT/CPU/DP/cuif/RegWr
add wave -noupdate -expand -group CONTROL_UNIT /system_tb/DUT/CPU/DP/cuif/MemtoReg
add wave -noupdate -expand -group CONTROL_UNIT /system_tb/DUT/CPU/DP/cuif/ALUSrc
add wave -noupdate -expand -group CONTROL_UNIT /system_tb/DUT/CPU/DP/cuif/PCSrc
add wave -noupdate -expand -group CONTROL_UNIT /system_tb/DUT/CPU/DP/cuif/ExtOp
add wave -noupdate -expand -group CONTROL_UNIT /system_tb/DUT/CPU/DP/cuif/RegDst
add wave -noupdate -expand -group CONTROL_UNIT /system_tb/DUT/CPU/DP/cuif/halt
add wave -noupdate -expand -group CONTROL_UNIT /system_tb/DUT/CPU/DP/cuif/dWEN
add wave -noupdate -expand -group CONTROL_UNIT /system_tb/DUT/CPU/DP/cuif/beq
add wave -noupdate -group {ALU SIGNALS} /system_tb/DUT/CPU/DP/ALU/aluinf/ALUOP
add wave -noupdate -group {ALU SIGNALS} /system_tb/DUT/CPU/DP/ALU/aluinf/PORTA
add wave -noupdate -group {ALU SIGNALS} /system_tb/DUT/CPU/DP/ALU/aluinf/PORTB
add wave -noupdate -group {ALU SIGNALS} /system_tb/DUT/CPU/DP/ALU/aluinf/OUTPORT
add wave -noupdate -group {ALU SIGNALS} /system_tb/DUT/CPU/DP/ALU/aluinf/ZERO
add wave -noupdate -group {ALU SIGNALS} /system_tb/DUT/CPU/DP/ALU/aluinf/OVF
add wave -noupdate -group {ALU SIGNALS} /system_tb/DUT/CPU/DP/ALU/aluinf/NEG
add wave -noupdate -expand -group {REGISTER FILE} /system_tb/DUT/CPU/DP/RF/regs
add wave -noupdate -expand -group {REGISTER FILE} /system_tb/DUT/CPU/DP/RF/rfif/WEN
add wave -noupdate -expand -group {REGISTER FILE} /system_tb/DUT/CPU/DP/RF/rfif/wsel
add wave -noupdate -expand -group {REGISTER FILE} /system_tb/DUT/CPU/DP/RF/rfif/rsel1
add wave -noupdate -expand -group {REGISTER FILE} /system_tb/DUT/CPU/DP/RF/rfif/rsel2
add wave -noupdate -expand -group {REGISTER FILE} /system_tb/DUT/CPU/DP/RF/rfif/wdat
add wave -noupdate -expand -group {REGISTER FILE} /system_tb/DUT/CPU/DP/RF/rfif/rdat1
add wave -noupdate -expand -group {REGISTER FILE} /system_tb/DUT/CPU/DP/RF/rfif/rdat2
add wave -noupdate -expand -group {PROGRAM COUNTER} /system_tb/DUT/CPU/DP/PC/pcif/PCen
add wave -noupdate -expand -group {PROGRAM COUNTER} -radix unsigned /system_tb/DUT/CPU/DP/PC/pcif/pc
add wave -noupdate -expand -group {PROGRAM COUNTER} /system_tb/DUT/CPU/DP/PC/pcif/npc
add wave -noupdate -expand -group {PROGRAM COUNTER} /system_tb/DUT/CPU/DP/PC/pcif/cpc
add wave -noupdate -group {REQUEST UNIT} /system_tb/DUT/CPU/DP/RU/ruif/dhit
add wave -noupdate -group {REQUEST UNIT} /system_tb/DUT/CPU/DP/RU/ruif/ihit
add wave -noupdate -group {REQUEST UNIT} /system_tb/DUT/CPU/DP/RU/ruif/dmemREN
add wave -noupdate -group {REQUEST UNIT} /system_tb/DUT/CPU/DP/RU/ruif/dmemWEN
add wave -noupdate -group {REQUEST UNIT} /system_tb/DUT/CPU/DP/RU/ruif/dWEN
add wave -noupdate -group {REQUEST UNIT} /system_tb/DUT/CPU/DP/RU/ruif/dREN
add wave -noupdate -group {RAM SIGNALS} /system_tb/DUT/RAM/ramif/ramREN
add wave -noupdate -group {RAM SIGNALS} /system_tb/DUT/RAM/ramif/ramWEN
add wave -noupdate -group {RAM SIGNALS} /system_tb/DUT/RAM/ramif/ramaddr
add wave -noupdate -group {RAM SIGNALS} /system_tb/DUT/RAM/ramif/ramstore
add wave -noupdate -group {RAM SIGNALS} /system_tb/DUT/RAM/ramif/ramload
add wave -noupdate -group {RAM SIGNALS} /system_tb/DUT/RAM/ramif/ramstate
add wave -noupdate -group {RAM SIGNALS} /system_tb/DUT/RAM/ramif/memREN
add wave -noupdate -group {RAM SIGNALS} /system_tb/DUT/RAM/ramif/memWEN
add wave -noupdate -group {RAM SIGNALS} /system_tb/DUT/RAM/ramif/memaddr
add wave -noupdate -group {RAM SIGNALS} /system_tb/DUT/RAM/ramif/memstore
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {233182 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {516842 ps}
