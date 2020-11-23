onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /memory_control_tb/CLK
add wave -noupdate /memory_control_tb/nRST
add wave -noupdate -divider <NULL>
add wave -noupdate -radix unsigned /memory_control_tb/test_num
add wave -noupdate /memory_control_tb/test_case
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group Cache -color Gold /memory_control_tb/cachesif1/iREN
add wave -noupdate -expand -group Cache -color Gold /memory_control_tb/cachesif1/iaddr
add wave -noupdate -expand -group Cache -color Gold /memory_control_tb/cachesif1/iload
add wave -noupdate -expand -group Cache -color Gold /memory_control_tb/cachesif1/iwait
add wave -noupdate -expand -group Cache -divider <NULL>
add wave -noupdate -expand -group Cache -color Orange /memory_control_tb/cachesif1/dREN
add wave -noupdate -expand -group Cache -color Orange /memory_control_tb/cachesif1/dWEN
add wave -noupdate -expand -group Cache -color Orange /memory_control_tb/cachesif1/daddr
add wave -noupdate -expand -group Cache -color Orange /memory_control_tb/cachesif1/dstore
add wave -noupdate -expand -group Cache -color Orange /memory_control_tb/cachesif1/dload
add wave -noupdate -expand -group Cache -color Orange /memory_control_tb/cachesif1/dwait
add wave -noupdate -divider <NULL>
add wave -noupdate -divider <NULL>
add wave -noupdate -expand -group Control -color Salmon /memory_control_tb/conif/iload
add wave -noupdate -expand -group Control -color Salmon /memory_control_tb/conif/iwait
add wave -noupdate -expand -group Control -color Salmon /memory_control_tb/conif/dload
add wave -noupdate -expand -group Control -color Salmon /memory_control_tb/conif/dwait
add wave -noupdate -expand -group Control -color Aquamarine /memory_control_tb/conif/iREN
add wave -noupdate -expand -group Control -color Aquamarine /memory_control_tb/conif/iaddr
add wave -noupdate -expand -group Control -color Aquamarine /memory_control_tb/conif/dREN
add wave -noupdate -expand -group Control -color Aquamarine /memory_control_tb/conif/dWEN
add wave -noupdate -expand -group Control -color Aquamarine /memory_control_tb/conif/dstore
add wave -noupdate -expand -group Control -color Aquamarine /memory_control_tb/conif/daddr
add wave -noupdate -expand -group Control -divider <NULL>
add wave -noupdate -expand -group Control -divider <NULL>
add wave -noupdate -expand -group RAM -color {Medium Orchid} -subitemconfig {{/memory_control_tb/conif/ramstore[31]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[30]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[29]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[28]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[27]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[26]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[25]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[24]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[23]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[22]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[21]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[20]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[19]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[18]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[17]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[16]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[15]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[14]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[13]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[12]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[11]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[10]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[9]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[8]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[7]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[6]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[5]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[4]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[3]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[2]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[1]} {-color {Medium Orchid}} {/memory_control_tb/conif/ramstore[0]} {-color {Medium Orchid}}} /memory_control_tb/conif/ramstore
add wave -noupdate -expand -group RAM -color {Medium Orchid} /memory_control_tb/conif/ramWEN
add wave -noupdate -expand -group RAM -color {Medium Orchid} /memory_control_tb/conif/ramREN
add wave -noupdate -expand -group RAM -color {Medium Orchid} /memory_control_tb/conif/ramaddr
add wave -noupdate -expand -group RAM -color {Medium Orchid} /memory_control_tb/conif/ramstate
add wave -noupdate -expand -group RAM -color {Medium Orchid} /memory_control_tb/conif/ramload
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {166446 ps} 0}
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
WaveRestoreZoom {0 ps} {451500 ps}
