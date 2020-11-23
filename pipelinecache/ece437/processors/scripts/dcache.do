onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dcache_tb/CLK
add wave -noupdate /dcache_tb/nRST
add wave -noupdate /dcache_tb/tb_test_num
add wave -noupdate /dcache_tb/tb_test_case
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group DP /dcache_tb/DUT/dcif/dhit
add wave -noupdate -expand -group DP /dcache_tb/DUT/dcif/dmemaddr
add wave -noupdate -expand -group DP /dcache_tb/DUT/dcif/dmemload
add wave -noupdate -expand -group DP /dcache_tb/DUT/dcif/dmemREN
add wave -noupdate -expand -group DP /dcache_tb/DUT/dcif/dmemstore
add wave -noupdate -expand -group DP /dcache_tb/DUT/dcif/dmemWEN
add wave -noupdate -expand -group DP /dcache_tb/DUT/dcif/flushed
add wave -noupdate -expand -group DP /dcache_tb/DUT/dcif/halt
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group MEM /dcache_tb/DUT/cif/daddr
add wave -noupdate -expand -group MEM /dcache_tb/DUT/cif/dload
add wave -noupdate -expand -group MEM /dcache_tb/DUT/cif/dREN
add wave -noupdate -expand -group MEM /dcache_tb/DUT/cif/dstore
add wave -noupdate -expand -group MEM /dcache_tb/DUT/cif/dwait
add wave -noupdate -expand -group MEM /dcache_tb/DUT/cif/dWEN
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/nextState
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/state
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/nextTag
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/tag
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/nextStore
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/store
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/nclear
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/clear
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/next_dcache
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/dcache
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/nextByteOffset
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/byteOffset
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/nextDaddr
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/daddr
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/nextDoperation
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/doperation
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/nextFrameSel
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/frameSel
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/nextHitCounter
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/hitCounter
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/nextIndex
add wave -noupdate -expand -group CACHE /dcache_tb/DUT/index
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {80 ns} 0}
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
WaveRestoreZoom {0 ns} {305 ns}
