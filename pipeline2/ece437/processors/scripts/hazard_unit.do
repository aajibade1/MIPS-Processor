onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /hazard_unit_tb/test_num
add wave -noupdate /hazard_unit_tb/test_num
add wave -noupdate /hazard_unit_tb/huif/halttype
add wave -noupdate /hazard_unit_tb/huif/stall
add wave -noupdate /hazard_unit_tb/huif/flush
add wave -noupdate /hazard_unit_tb/huif/rs
add wave -noupdate /hazard_unit_tb/huif/rt
add wave -noupdate /hazard_unit_tb/huif/rtEX
add wave -noupdate /hazard_unit_tb/huif/rtMEM
add wave -noupdate /hazard_unit_tb/PROG/tbeif/wreg_r
add wave -noupdate /hazard_unit_tb/PROG/tbeif/Reg_Wen_r
add wave -noupdate /hazard_unit_tb/PROG/tbeif/PCSrc_n
add wave -noupdate /hazard_unit_tb/PROG/tbeif/PCSrc_r
add wave -noupdate /hazard_unit_tb/PROG/tbdif/Reg_Wen_r
add wave -noupdate /hazard_unit_tb/PROG/tbif/ihit
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1 ns} 0}
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
WaveRestoreZoom {0 ns} {8 ns}
