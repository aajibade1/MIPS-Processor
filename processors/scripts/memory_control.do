onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /memory_control_tb/CLK
add wave -noupdate /memory_control_tb/nRST
add wave -noupdate /memory_control_tb/PROG/tb_test_num
add wave -noupdate /memory_control_tb/PROG/tb_test_case
add wave -noupdate -group RAM_SIGNALS /memory_control_tb/ramif/ramREN
add wave -noupdate -group RAM_SIGNALS /memory_control_tb/ramif/ramWEN
add wave -noupdate -group RAM_SIGNALS /memory_control_tb/ramif/ramaddr
add wave -noupdate -group RAM_SIGNALS /memory_control_tb/ramif/ramstore
add wave -noupdate -group RAM_SIGNALS /memory_control_tb/ramif/ramload
add wave -noupdate -group RAM_SIGNALS /memory_control_tb/ramif/ramstate
add wave -noupdate -expand -group CACHE0_SIGNALS /memory_control_tb/cacheif0/iwait
add wave -noupdate -expand -group CACHE0_SIGNALS /memory_control_tb/cacheif0/dwait
add wave -noupdate -expand -group CACHE0_SIGNALS /memory_control_tb/cacheif0/iREN
add wave -noupdate -expand -group CACHE0_SIGNALS /memory_control_tb/cacheif0/dREN
add wave -noupdate -expand -group CACHE0_SIGNALS /memory_control_tb/cacheif0/dWEN
add wave -noupdate -expand -group CACHE0_SIGNALS /memory_control_tb/cacheif0/iload
add wave -noupdate -expand -group CACHE0_SIGNALS /memory_control_tb/cacheif0/dload
add wave -noupdate -expand -group CACHE0_SIGNALS /memory_control_tb/cacheif0/dstore
add wave -noupdate -expand -group CACHE0_SIGNALS /memory_control_tb/cacheif0/iaddr
add wave -noupdate -expand -group CACHE0_SIGNALS /memory_control_tb/cacheif0/daddr
add wave -noupdate -group CACHE_CONTROL /memory_control_tb/ccif/iwait
add wave -noupdate -group CACHE_CONTROL /memory_control_tb/ccif/dwait
add wave -noupdate -group CACHE_CONTROL /memory_control_tb/ccif/iREN
add wave -noupdate -group CACHE_CONTROL /memory_control_tb/ccif/dREN
add wave -noupdate -group CACHE_CONTROL /memory_control_tb/ccif/dWEN
add wave -noupdate -group CACHE_CONTROL /memory_control_tb/ccif/iload
add wave -noupdate -group CACHE_CONTROL /memory_control_tb/ccif/dload
add wave -noupdate -group CACHE_CONTROL /memory_control_tb/ccif/dstore
add wave -noupdate -group CACHE_CONTROL /memory_control_tb/ccif/iaddr
add wave -noupdate -group CACHE_CONTROL /memory_control_tb/ccif/daddr
add wave -noupdate -group CACHE_CONTROL /memory_control_tb/ccif/ramWEN
add wave -noupdate -group CACHE_CONTROL /memory_control_tb/ccif/ramREN
add wave -noupdate -group CACHE_CONTROL /memory_control_tb/ccif/ramstate
add wave -noupdate -group CACHE_CONTROL /memory_control_tb/ccif/ramaddr
add wave -noupdate -group CACHE_CONTROL /memory_control_tb/ccif/ramstore
add wave -noupdate -group CACHE_CONTROL /memory_control_tb/ccif/ramload
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1311149839 ps} 0}
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
WaveRestoreZoom {1311148445 ps} {1311159600 ps}
