
library ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;



ENTITY NAME_TESTBENCH IS
END ;

ARCHITECTURE behavior OF NAME_TESTBENCH IS

--- Components ---
COMPONENT NAME_COMB
port (
      COPY PASTE FROM ENTITY
      );
      
  
END COMPONENT;

--- Signals ---
signal clk : std_logic := '0';


constant clk_period : time := 1000 ns;


BEGIN

--- Connnect components --- 
DUT: NAME_COMB PORT MAP (
      CLK_SIGNAL => clk,

    );



seq: process
begin
  clk <= '0';
  wait for clk_period/2;
  clk <= '1';
  wait for clk_period/2;

end process;

comb: process
  begin
    
      
  
  end process;


END ARCHITECTURE;