library ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

ENTITY test_bench IS
END test_bench;

ARCHITECTURE behavior OF test_bench IS

--- Components ---
COMPONENT rom_wrapper
port (
	     addr : in unsigned(8 downto 0);
	     data_out : out unsigned(13 downto 0);
	     CK                            :   IN   std_logic; -- clk
	     CS                            :   IN   std_logic; -- chip select. set as 1
	     OE                            :   IN   std_logic -- Output enable. 
	 );
  
END COMPONENT;

--- Signals ---
signal addr : unsigned(8 downto 0) := (others => '0');
signal addr_next : unsigned(8 downto 0) := (others => '0');
signal clk : std_logic := '0';
signal data_out : unsigned(13 downto 0);
signal CS : std_logic := '1';
signal OE : std_logic := '1'; -- Try having this at 0 zero as well. 

constant clk_period : time := 1000 ns;


BEGIN

--- Connnect components --- 
DUT: rom_wrapper PORT MAP (
      addr => addr,
      data_out => data_out,
      CK => clk,
      CS => CS,
      OE => OE
    );



seq: process
begin
  clk <= '0';
  OE <= '1';
  wait for clk_period/2;
  clk <= '1';
  addr <= addr_next;
  OE <= '1';
  wait for clk_period/2;

end process;

address: process
  begin
      wait for clk_period;
      addr_next <= addr + 1;
      
  
  end process;


END ARCHITECTURE;



