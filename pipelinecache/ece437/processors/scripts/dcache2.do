onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dcache2_tb/CLK
add wave -noupdate /dcache2_tb/nRST
add wave -noupdate /dcache2_tb/tb_test_num
add wave -noupdate /dcache2_tb/tb_test_case
add wave -noupdate -expand -group INPUT /dcache2_tb/dcif/dmemREN
add wave -noupdate -expand -group INPUT /dcache2_tb/dcif/dmemWEN
add wave -noupdate -expand -group INPUT /dcache2_tb/dcif/dmemstore
add wave -noupdate -expand -group INPUT /dcache2_tb/dcif/dmemaddr
add wave -noupdate -expand -group INPUT -divider <NULL>
add wave -noupdate -expand -group INPUT /dcache2_tb/cif/dwait
add wave -noupdate -expand -group INPUT /dcache2_tb/cif/dload
add wave -noupdate -expand -group INPUT /dcache2_tb/cif/ccwait
add wave -noupdate -expand -group INPUT /dcache2_tb/cif/ccinv
add wave -noupdate -expand -group INPUT /dcache2_tb/cif/ccsnoopaddr
add wave -noupdate -expand -group OUTPUT /dcache2_tb/dcif/dhit
add wave -noupdate -expand -group OUTPUT /dcache2_tb/dcif/dmemload
add wave -noupdate -expand -group OUTPUT -divider <NULL>
add wave -noupdate -expand -group OUTPUT /dcache2_tb/cif/dREN
add wave -noupdate -expand -group OUTPUT /dcache2_tb/cif/dWEN
add wave -noupdate -expand -group OUTPUT /dcache2_tb/cif/daddr
add wave -noupdate -expand -group OUTPUT /dcache2_tb/cif/dstore
add wave -noupdate -expand -group OUTPUT /dcache2_tb/cif/cctrans
add wave -noupdate -expand -group OUTPUT /dcache2_tb/cif/ccwrite
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/nextState
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/state
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/daddr
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/nextDaddr
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/index
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/nextIndex
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/tag
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/nextTag
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/byteOffset
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/nextByteOffset
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/doperation
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/nextDoperation
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/store
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/nextStore
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/frameSel
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/nextFrameSel
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/dcache
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/next_dcache
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/blockSel
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/nextBlockSel
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/flush
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/haltFrame
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/haltIndex
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/nclear
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/nextFlushed
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/hitCounter
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/nextHitCounter
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/nextHaltFrame
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/nextHaltIndex
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/snoopingIndex
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/snoopingTag
add wave -noupdate -expand -group CACHE /dcache2_tb/DUT/matchFrame
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {162 ns} 0}
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
WaveRestoreZoom {0 ns} {683 ns}
