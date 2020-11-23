onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /coherance_tb/CLK
add wave -noupdate /coherance_tb/nRST
add wave -noupdate -group CIF0 /coherance_tb/cif0/iwait
add wave -noupdate -group CIF0 /coherance_tb/cif0/dwait
add wave -noupdate -group CIF0 /coherance_tb/cif0/iREN
add wave -noupdate -group CIF0 /coherance_tb/cif0/dREN
add wave -noupdate -group CIF0 /coherance_tb/cif0/dWEN
add wave -noupdate -group CIF0 /coherance_tb/cif0/iload
add wave -noupdate -group CIF0 /coherance_tb/cif0/dload
add wave -noupdate -group CIF0 /coherance_tb/cif0/dstore
add wave -noupdate -group CIF0 /coherance_tb/cif0/iaddr
add wave -noupdate -group CIF0 /coherance_tb/cif0/daddr
add wave -noupdate -group CIF0 /coherance_tb/cif0/ccwait
add wave -noupdate -group CIF0 /coherance_tb/cif0/ccinv
add wave -noupdate -group CIF0 /coherance_tb/cif0/ccwrite
add wave -noupdate -group CIF0 /coherance_tb/cif0/cctrans
add wave -noupdate -group CIF0 /coherance_tb/cif0/ccsnoopaddr
add wave -noupdate -group CIF1 /coherance_tb/cif1/iwait
add wave -noupdate -group CIF1 /coherance_tb/cif1/dwait
add wave -noupdate -group CIF1 /coherance_tb/cif1/iREN
add wave -noupdate -group CIF1 /coherance_tb/cif1/dREN
add wave -noupdate -group CIF1 /coherance_tb/cif1/dWEN
add wave -noupdate -group CIF1 /coherance_tb/cif1/iload
add wave -noupdate -group CIF1 /coherance_tb/cif1/dload
add wave -noupdate -group CIF1 /coherance_tb/cif1/dstore
add wave -noupdate -group CIF1 /coherance_tb/cif1/iaddr
add wave -noupdate -group CIF1 /coherance_tb/cif1/daddr
add wave -noupdate -group CIF1 /coherance_tb/cif1/ccwait
add wave -noupdate -group CIF1 /coherance_tb/cif1/ccinv
add wave -noupdate -group CIF1 /coherance_tb/cif1/ccwrite
add wave -noupdate -group CIF1 /coherance_tb/cif1/cctrans
add wave -noupdate -group CIF1 /coherance_tb/cif1/ccsnoopaddr
add wave -noupdate -group CCIF /coherance_tb/ccif/iwait
add wave -noupdate -group CCIF /coherance_tb/ccif/dwait
add wave -noupdate -group CCIF /coherance_tb/ccif/iREN
add wave -noupdate -group CCIF /coherance_tb/ccif/dREN
add wave -noupdate -group CCIF /coherance_tb/ccif/dWEN
add wave -noupdate -group CCIF /coherance_tb/ccif/iload
add wave -noupdate -group CCIF /coherance_tb/ccif/dload
add wave -noupdate -group CCIF /coherance_tb/ccif/dstore
add wave -noupdate -group CCIF /coherance_tb/ccif/iaddr
add wave -noupdate -group CCIF /coherance_tb/ccif/daddr
add wave -noupdate -group CCIF /coherance_tb/ccif/ccwait
add wave -noupdate -group CCIF /coherance_tb/ccif/ccinv
add wave -noupdate -group CCIF /coherance_tb/ccif/ccwrite
add wave -noupdate -group CCIF /coherance_tb/ccif/cctrans
add wave -noupdate -group CCIF /coherance_tb/ccif/ccsnoopaddr
add wave -noupdate -group CCIF /coherance_tb/ccif/ramWEN
add wave -noupdate -group CCIF /coherance_tb/ccif/ramREN
add wave -noupdate -group CCIF /coherance_tb/ccif/ramstate
add wave -noupdate -group CCIF /coherance_tb/ccif/ramaddr
add wave -noupdate -group CCIF /coherance_tb/ccif/ramstore
add wave -noupdate -group CCIF /coherance_tb/ccif/ramload
add wave -noupdate -group DUT /coherance_tb/DUT/cacheToCache
add wave -noupdate -group DUT /coherance_tb/DUT/nextCacheToCache
add wave -noupdate -group DUT /coherance_tb/DUT/nextccinv
add wave -noupdate -group DUT /coherance_tb/DUT/nextccsnoopaddr
add wave -noupdate -group DUT /coherance_tb/DUT/nextccwait
add wave -noupdate -group DUT /coherance_tb/DUT/nextRequestor
add wave -noupdate -group DUT /coherance_tb/DUT/nextState
add wave -noupdate -group DUT /coherance_tb/DUT/requestor
add wave -noupdate -group DUT /coherance_tb/DUT/state
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
WaveRestoreZoom {0 ns} {1050 ns}
