onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /forward_unit_tb/test_num
add wave -noupdate /forward_unit_tb/test_case
add wave -noupdate -expand -group INPUT /forward_unit_tb/fuif/Wb_RegWrite
add wave -noupdate -expand -group INPUT /forward_unit_tb/fuif/rt
add wave -noupdate -expand -group INPUT /forward_unit_tb/fuif/rs
add wave -noupdate -expand -group INPUT /forward_unit_tb/fuif/rd_wb
add wave -noupdate -expand -group INPUT /forward_unit_tb/fuif/rd_mem
add wave -noupdate -expand -group INPUT /forward_unit_tb/fuif/Mem_RegWrite
add wave -noupdate -expand -group INPUT /forward_unit_tb/fuif/Mem_dren
add wave -noupdate -expand -group INPUT /forward_unit_tb/fuif/alutype
add wave -noupdate -expand -group OUTPUT /forward_unit_tb/fuif/forwardB
add wave -noupdate -expand -group OUTPUT /forward_unit_tb/fuif/forwardA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2 ns} 0}
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
WaveRestoreZoom {0 ns} {42 ns}
