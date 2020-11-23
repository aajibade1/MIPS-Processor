onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /alu_tb/CLK
add wave -noupdate /alu_tb/PROG/tb_test_num
add wave -noupdate /alu_tb/PROG/tb_test_case
add wave -noupdate /alu_tb/aluinf/ALUOP
add wave -noupdate /alu_tb/aluinf/PORTA
add wave -noupdate /alu_tb/aluinf/PORTB
add wave -noupdate /alu_tb/aluinf/OUTPORT
add wave -noupdate /alu_tb/aluinf/ZERO
add wave -noupdate /alu_tb/aluinf/OVF
add wave -noupdate /alu_tb/aluinf/NEG
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
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
WaveRestoreZoom {0 ns} {489 ns}
