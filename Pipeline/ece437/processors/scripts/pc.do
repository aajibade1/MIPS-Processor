onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /pc_tb/CLK
add wave -noupdate /pc_tb/nRST
add wave -noupdate -radix unsigned /pc_tb/test_num
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group INPUT /pc_tb/pif/jtype
add wave -noupdate -expand -group INPUT /pc_tb/pif/halttype
add wave -noupdate -expand -group INPUT /pc_tb/pif/PCSrc
add wave -noupdate -expand -group INPUT /pc_tb/pif/immAddr
add wave -noupdate -expand -group INPUT /pc_tb/pif/aluAddr
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group OUTPUT -radix unsigned /pc_tb/pif/PCOut
add wave -noupdate -expand -group OUTPUT -radix unsigned /pc_tb/pif/npc
add wave -noupdate -divider <NULL>
add wave -noupdate /pc_tb/DUT/pcDst
add wave -noupdate /pc_tb/DUT/nPCOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {50 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 106
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
WaveRestoreZoom {0 ns} {220 ns}
