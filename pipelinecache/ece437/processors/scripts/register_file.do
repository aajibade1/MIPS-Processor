onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /register_file_tb/CLK
add wave -noupdate /register_file_tb/nRST
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group TEST /register_file_tb/test_case
add wave -noupdate -expand -group TEST -radix unsigned /register_file_tb/test_case_num
add wave -noupdate -expand -group TEST -radix decimal /register_file_tb/wait_var
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group INPUT /register_file_tb/rfif/WEN
add wave -noupdate -expand -group INPUT -radix unsigned /register_file_tb/rfif/wsel
add wave -noupdate -expand -group INPUT -radix decimal /register_file_tb/rfif/wdat
add wave -noupdate -expand -group INPUT -radix decimal -childformat {{{/register_file_tb/DUT/Register[31]} -radix decimal} {{/register_file_tb/DUT/Register[30]} -radix decimal} {{/register_file_tb/DUT/Register[29]} -radix decimal} {{/register_file_tb/DUT/Register[28]} -radix decimal} {{/register_file_tb/DUT/Register[27]} -radix decimal} {{/register_file_tb/DUT/Register[26]} -radix decimal} {{/register_file_tb/DUT/Register[25]} -radix decimal} {{/register_file_tb/DUT/Register[24]} -radix decimal} {{/register_file_tb/DUT/Register[23]} -radix decimal} {{/register_file_tb/DUT/Register[22]} -radix decimal} {{/register_file_tb/DUT/Register[21]} -radix decimal} {{/register_file_tb/DUT/Register[20]} -radix decimal} {{/register_file_tb/DUT/Register[19]} -radix decimal} {{/register_file_tb/DUT/Register[18]} -radix decimal} {{/register_file_tb/DUT/Register[17]} -radix decimal} {{/register_file_tb/DUT/Register[16]} -radix decimal} {{/register_file_tb/DUT/Register[15]} -radix decimal} {{/register_file_tb/DUT/Register[14]} -radix decimal} {{/register_file_tb/DUT/Register[13]} -radix decimal} {{/register_file_tb/DUT/Register[12]} -radix decimal} {{/register_file_tb/DUT/Register[11]} -radix decimal} {{/register_file_tb/DUT/Register[10]} -radix decimal} {{/register_file_tb/DUT/Register[9]} -radix decimal} {{/register_file_tb/DUT/Register[8]} -radix decimal} {{/register_file_tb/DUT/Register[7]} -radix decimal} {{/register_file_tb/DUT/Register[6]} -radix decimal} {{/register_file_tb/DUT/Register[5]} -radix decimal} {{/register_file_tb/DUT/Register[4]} -radix decimal} {{/register_file_tb/DUT/Register[3]} -radix decimal} {{/register_file_tb/DUT/Register[2]} -radix decimal} {{/register_file_tb/DUT/Register[1]} -radix decimal} {{/register_file_tb/DUT/Register[0]} -radix decimal}} -subitemconfig {{/register_file_tb/DUT/Register[31]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[30]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[29]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[28]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[27]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[26]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[25]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[24]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[23]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[22]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[21]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[20]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[19]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[18]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[17]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[16]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[15]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[14]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[13]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[12]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[11]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[10]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[9]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[8]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[7]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[6]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[5]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[4]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[3]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[2]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[1]} {-height 16 -radix decimal} {/register_file_tb/DUT/Register[0]} {-height 16 -radix decimal}} /register_file_tb/DUT/Register
add wave -noupdate -expand -group INPUT -radix unsigned -childformat {{{/register_file_tb/rfif/rsel1[4]} -radix unsigned} {{/register_file_tb/rfif/rsel1[3]} -radix unsigned} {{/register_file_tb/rfif/rsel1[2]} -radix unsigned} {{/register_file_tb/rfif/rsel1[1]} -radix unsigned} {{/register_file_tb/rfif/rsel1[0]} -radix unsigned}} -subitemconfig {{/register_file_tb/rfif/rsel1[4]} {-height 16 -radix unsigned} {/register_file_tb/rfif/rsel1[3]} {-height 16 -radix unsigned} {/register_file_tb/rfif/rsel1[2]} {-height 16 -radix unsigned} {/register_file_tb/rfif/rsel1[1]} {-height 16 -radix unsigned} {/register_file_tb/rfif/rsel1[0]} {-height 16 -radix unsigned}} /register_file_tb/rfif/rsel1
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group OUTPUT -radix decimal -childformat {{{/register_file_tb/rfif/rdat1[31]} -radix decimal} {{/register_file_tb/rfif/rdat1[30]} -radix decimal} {{/register_file_tb/rfif/rdat1[29]} -radix decimal} {{/register_file_tb/rfif/rdat1[28]} -radix decimal} {{/register_file_tb/rfif/rdat1[27]} -radix decimal} {{/register_file_tb/rfif/rdat1[26]} -radix decimal} {{/register_file_tb/rfif/rdat1[25]} -radix decimal} {{/register_file_tb/rfif/rdat1[24]} -radix decimal} {{/register_file_tb/rfif/rdat1[23]} -radix decimal} {{/register_file_tb/rfif/rdat1[22]} -radix decimal} {{/register_file_tb/rfif/rdat1[21]} -radix decimal} {{/register_file_tb/rfif/rdat1[20]} -radix decimal} {{/register_file_tb/rfif/rdat1[19]} -radix decimal} {{/register_file_tb/rfif/rdat1[18]} -radix decimal} {{/register_file_tb/rfif/rdat1[17]} -radix decimal} {{/register_file_tb/rfif/rdat1[16]} -radix decimal} {{/register_file_tb/rfif/rdat1[15]} -radix decimal} {{/register_file_tb/rfif/rdat1[14]} -radix decimal} {{/register_file_tb/rfif/rdat1[13]} -radix decimal} {{/register_file_tb/rfif/rdat1[12]} -radix decimal} {{/register_file_tb/rfif/rdat1[11]} -radix decimal} {{/register_file_tb/rfif/rdat1[10]} -radix decimal} {{/register_file_tb/rfif/rdat1[9]} -radix decimal} {{/register_file_tb/rfif/rdat1[8]} -radix decimal} {{/register_file_tb/rfif/rdat1[7]} -radix decimal} {{/register_file_tb/rfif/rdat1[6]} -radix decimal} {{/register_file_tb/rfif/rdat1[5]} -radix decimal} {{/register_file_tb/rfif/rdat1[4]} -radix decimal} {{/register_file_tb/rfif/rdat1[3]} -radix decimal} {{/register_file_tb/rfif/rdat1[2]} -radix decimal} {{/register_file_tb/rfif/rdat1[1]} -radix decimal} {{/register_file_tb/rfif/rdat1[0]} -radix decimal}} -subitemconfig {{/register_file_tb/rfif/rdat1[31]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[30]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[29]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[28]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[27]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[26]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[25]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[24]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[23]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[22]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[21]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[20]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[19]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[18]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[17]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[16]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[15]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[14]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[13]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[12]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[11]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[10]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[9]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[8]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[7]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[6]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[5]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[4]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[3]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[2]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[1]} {-height 16 -radix decimal} {/register_file_tb/rfif/rdat1[0]} {-height 16 -radix decimal}} /register_file_tb/rfif/rdat1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {522 ns} 0}
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
WaveRestoreZoom {0 ns} {1145 ns}
