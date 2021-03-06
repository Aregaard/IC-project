#create_clock -period 20 [get_ports clk]
create_clock "clk" -period 15 -name "clk"

set_clock_uncertainty 0.3 clk 
set_fix_hold clk
set_clock_transition 0.25 -rise [get_clocks clk]
set_clock_transition 0.25 -fall [get_clocks clk]
