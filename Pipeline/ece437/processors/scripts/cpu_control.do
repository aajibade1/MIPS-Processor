onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cpu_control_tb/test_num
add wave -noupdate /cpu_control_tb/CLK
add wave -noupdate /cpu_control_tb/nRST
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group INPUT /cpu_control_tb/ccif/zero
add wave -noupdate -expand -group INPUT /cpu_control_tb/ccif/opcode
add wave -noupdate -expand -group INPUT /cpu_control_tb/ccif/funct
add wave -noupdate -expand -group INPUT /cpu_control_tb/ccif/dhit
add wave -noupdate -expand -group INPUT /cpu_control_tb/ccif/ihit
add wave -noupdate -expand -group INPUT /cpu_control_tb/ccif/halt
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group OUTPUT /cpu_control_tb/ccif/ALUOP
add wave -noupdate -expand -group OUTPUT /cpu_control_tb/ccif/MemToReg
add wave -noupdate -expand -group OUTPUT /cpu_control_tb/ccif/RegDst
add wave -noupdate -expand -group OUTPUT /cpu_control_tb/ccif/ExtOp
add wave -noupdate -expand -group OUTPUT /cpu_control_tb/ccif/PCSrc
add wave -noupdate -expand -group OUTPUT /cpu_control_tb/ccif/Reg_Wen
add wave -noupdate -expand -group OUTPUT /cpu_control_tb/ccif/iren
add wave -noupdate -expand -group OUTPUT /cpu_control_tb/ccif/dren
add wave -noupdate -expand -group OUTPUT /cpu_control_tb/ccif/dwen
add wave -noupdate -expand -group OUTPUT /cpu_control_tb/ccif/alutype
add wave -noupdate -expand -group OUTPUT /cpu_control_tb/ccif/jrtype
add wave -noupdate -expand -group OUTPUT /cpu_control_tb/ccif/immtype
add wave -noupdate -expand -group OUTPUT /cpu_control_tb/ccif/jtype
add wave -noupdate -expand -group OUTPUT /cpu_control_tb/ccif/ldtype
add wave -noupdate -expand -group OUTPUT /cpu_control_tb/ccif/jaltype
add wave -noupdate -expand -group OUTPUT /cpu_control_tb/ccif/halttype
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5 ns} 0}
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
WaveRestoreZoom {0 ns} {16 ns}
