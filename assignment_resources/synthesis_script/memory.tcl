set dir_struc_path "/home/piraten/eit-hhp/hw/fft"
set mem_lib_path "$dir_struc_path/hdl/memory"

read_lib $mem_lib_path/SHLD130_96X48X1BM1_TC.lib
write_lib $mem_lib_path/SHLD130_96X48X1BM1_TC
set link_library " $mem_lib_path/SHLD130_96X48X1BM1_TC.db $link_library"
set target_library " $mem_lib_path/SHLD130_96X48X1BM1_TC.db $target_library"

read_lib $mem_lib_path/SHLD130_128X48X1BM1_TC.lib
write_lib $mem_lib_path/SHLD130_128X48X1BM1_TC
set link_library " $mem_lib_path/SHLD130_128X48X1BM1_TC.db $link_library"
set target_library " $mem_lib_path/SHLD130_128X48X1BM1_TC.db $target_library"

read_lib $mem_lib_path/SHLD130_256X48X1BM2_TC.lib
write_lib $mem_lib_path/SHLD130_256X48X1BM2_TC
set link_library " $mem_lib_path/SHLD130_256X48X1BM2_TC.db $link_library"
set target_library " $mem_lib_path/SHLD130_256X48X1BM2_TC.db $target_library"

read_lib $mem_lib_path/SHLD130_512X48X1BM1_TC.lib
write_lib $mem_lib_path/SHLD130_512X48X1BM1_TC
set link_library " $mem_lib_path/SHLD130_512X48X1BM1_TC.db $link_library"
set target_library " $mem_lib_path/SHLD130_512X48X1BM1_TC.db $target_library"

read_lib $mem_lib_path/SPLD130_512X24BM1A_TC.lib
write_lib $mem_lib_path/SPLD130_512X24BM1A_TC
set link_library "$mem_lib_path/SPLD130_512X24BM1A_TC.db  $link_library"
set target_library "$mem_lib_path/SPLD130_512X24BM1A_TC.db  $target_library"

read_lib $mem_lib_path/SPLD130_1024X24BM1A_TC.lib
write_lib $mem_lib_path/SPLD130_1024X24BM1A_TC
set link_library "$mem_lib_path/SPLD130_1024X24BM1A_TC.db  $link_library"
set target_library "$mem_lib_path/SPLD130_1024X24BM1A_TC.db  $target_library"

read_lib $mem_lib_path/SPLD130_1536X24BM1A_TC.lib
write_lib $mem_lib_path/SPLD130_1536X24BM1A_TC
set link_library "$mem_lib_path/SPLD130_1536X24BM1A_TC.db  $link_library"
set target_library "$mem_lib_path/SPLD130_1536X24BM1A_TC.db  $target_library"

read_lib $mem_lib_path/SPLD130_3584X24BM1A_TC.lib
write_lib $mem_lib_path/SPLD130_3584X24BM1A_TC
set link_library "$mem_lib_path/SPLD130_3584X24BM1A_TC.db  $link_library"
set target_library "$mem_lib_path/SPLD130_3584X24BM1A_TC.db  $target_library"

#read_lib $mem_lib_path/SHLD130_2048X76X1BM1_WC.lib
#write_lib $mem_lib_path/SHLD130_2048X76X1BM1_WC
#set link_library " $mem_lib_path/SHLD130_2048X76X1BM1_WC.db $link_library"
#set target_library " $mem_lib_path/SHLD130_2048X76X1BM1_WC.db $target_library"
#
#read_lib $mem_lib_path/SJLD130_2048X76X1CM4_WC.lib
#write_lib $mem_lib_path/SJLD130_2048X76X1CM4_WC
#set link_library " $mem_lib_path/SJLD130_2048X76X1CM4_WC.db $link_library"
#set target_library " $mem_lib_path/SJLD130_2048X76X1CM4_WC.db $target_library"
#
#read_lib $mem_lib_path/SPLD130_512X32BM1A_WC.lib
#write_lib $mem_lib_path/SPLD130_512X32BM1A_WC
#set link_library " $mem_lib_path/SPLD130_512X32BM1A_WC.db $link_library"
#set target_library " $mem_lib_path/SPLD130_512X32BM1A_WC.db $target_library"
#
#read_lib $mem_lib_path/SPLD130_5632X32BM1A_WC.lib
#write_lib $mem_lib_path/SPLD130_5632X32BM1A_WC
#set link_library "$mem_lib_path/SPLD130_5632X32BM1A_WC.db  $link_library"
#set target_library "$mem_lib_path/SPLD130_5632X32BM1A_WC.db  $target_library"
