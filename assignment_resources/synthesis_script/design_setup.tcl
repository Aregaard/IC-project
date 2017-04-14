set top_entity_name mixed_radix_top
set dir_struc_path "/home/piraten/eit-hhp/hw/fft"
set netlist_path "$dir_struc_path/synth/netlist"
set rtl_path "$dir_struc_path/hdl"
set file_list "$rtl_path/package/fft_pack.vhd \
$rtl_path/package/components_pack.vhd \
$rtl_path/package/const_mult_pack.vhd \
$rtl_path/package/flexible_complex_mult_round.vhd \
$rtl_path/package/flexible_complex_mult.vhd \
$rtl_path/memory/fifo_wrap_uniport_128.vhd  \  
$rtl_path/memory/fifo_wrap_uniport_256.vhd  \
$rtl_path/memory/fifo_wrap_uniport_512.vhd  \
$rtl_path/memory/fifo_wrap_uniport_1024.vhd  \
$rtl_path/memory/fifo_wrap_arr_uniport.vhd  \
$rtl_path/memory/fifo_wrap_arr_dualport.vhd  \
$rtl_path/memory/fifo_wrap_dualport_512.vhd  \
$rtl_path/memory/rom_wrap_dft_256.vhd  \
$rtl_path/memory/rom_wrap_dft_512.vhd  \
$rtl_path/memory/rom_wrap_dft_1024.vhd  \
$rtl_path/memory/ph_rom_wrap_1166.vhd  \
$rtl_path/memory/ph_rom_wrap_3577.vhd  \
$rtl_path/design/radix3_stage0_cntrl.vhd  \
$rtl_path/design/radix3_stage1_cntrl.vhd  \
$rtl_path/design/radix3_butt_glue.vhd  \
$rtl_path/design/radix3_fft_top.vhd  \
$rtl_path/design/phase_correction_r3.vhd  \
$rtl_path/design/radix5_stage0_cntrl.vhd  \
$rtl_path/design/radix5_stage1_cntrl.vhd  \
$rtl_path/design/radix5_butt_glue.vhd  \
$rtl_path/design/radix5_fft_top.vhd  \
$rtl_path/design/phase_correction_r5.vhd  \
$rtl_path/design/radix2_fft_top.vhd  \
$rtl_path/design/radix2_stage_cntrl.vhd  \
$rtl_path/design/radix2_stage0_cntrl.vhd  \
$rtl_path/design/radix2_stage1_cntrl.vhd  \
$rtl_path/design/radix2_stage2_cntrl.vhd  \
$rtl_path/design/radix2_stage3_cntrl.vhd  \
$rtl_path/design/radix2_stage4_cntrl.vhd  \
$rtl_path/design/radix2_stage5_cntrl.vhd  \
$rtl_path/design/radix2_stage6_cntrl.vhd  \
$rtl_path/design/radix2_stage7_cntrl.vhd  \
$rtl_path/design/radix2_stage8_cntrl.vhd  \
$rtl_path/design/radix2_stage9_cntrl.vhd  \
$rtl_path/design/radix2_stage10_cntrl.vhd  \
$rtl_path/design/radix2_butt_glue.vhd  \
$rtl_path/design/radix2_butt0_glue.vhd  \
$rtl_path/design/radix2_butt1_glue.vhd  \
$rtl_path/design/radix2_butt2_glue.vhd  \
$rtl_path/design/coeff_gen_stage10.vhd  \
$rtl_path/design/coeff_gen_stage9.vhd  \
$rtl_path/design/coeff_gen_stage8.vhd  \
$rtl_path/design/mixed_radix_top.vhd "



#$rtl_path/memory/SJLD130_2048X60X1CM4.vhd  \
#$rtl_path/memory/SPLD130_512X24BM1A.vhd  \
#$rtl_path/memory/SPLD130_5632X24BM1A.vhd  \
#$rtl_path/memory/SHLD130_2048X60X1BM1.vhd  \
