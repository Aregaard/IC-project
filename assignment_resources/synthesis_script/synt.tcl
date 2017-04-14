set synt_scr_path "/home/piraten/eit-hhp/hw/fft/synth/script"
source $synt_scr_path/design_setup.tcl
source $synt_scr_path/memory.tcl


analyze -library WORK -format vhdl $file_list

elaborate $top_entity_name -architecture mixed_radix_top_arch -library DEFAULT

source $synt_scr_path/create_clock.tcl
set input_delay -min 1 -clock clk {stall_stage valid_xin n_point xin_r xin_i}
set output_delay -max 1 -clock clk {xout_r xout_i valid_xout done_stage }
set_drive 0 {clk rst}

set_max_leakage_power 0
set_max_area 0
compile -map_effort high -area_effort high

remove_unconnected_ports -blast_buses [get_cells "*" -hier]
remove_unconnected_ports [get_cells "*" -hier]

change_names -rules verilog -hierarchy 
report_area -hierarchy
report_power
