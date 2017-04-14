gui_start
read_verilog ../files/netlist/QRSpf6_cb.v
current_design QRSpf6_cb
create_clock -period    166666 -name clk
read_vcd -strip_path qrspf6_cb_tb/dut ../sim/qrsdet.vcd
update_power
report_power
report_power > power_pf6_cb.rpt