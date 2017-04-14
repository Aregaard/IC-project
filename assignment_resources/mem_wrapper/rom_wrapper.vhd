-------------------------------------------------------------------------
-- ROM wrapper for 130nm 
-- Switch of timing for behavioural model
-- A quick and hardcoded (bad) wrapper for checking 
-- 
-------------------------------------------------------------------------
library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;


entity rom_wrapper is 
    port (
	     addr : in unsigned(8 downto 0);
	     data_out : out unsigned(13 downto 0);
	     CK                            :   IN   std_logic;
	     CS                            :   IN   std_logic;
	     OE                            :   IN   std_logic
	 );
end entity rom_wrapper;

architecture rom_wrapper of rom_wrapper is

    component SPUD130_512X14BM1A is
	generic ( TimingChecksOn: Boolean := True);
	port (
		 A0                         :   IN   std_logic;
		 A1                         :   IN   std_logic;
		 A2                         :   IN   std_logic;
		 A3                         :   IN   std_logic;
		 A4                         :   IN   std_logic;
		 A5                         :   IN   std_logic;
		 A6                         :   IN   std_logic;
		 A7                         :   IN   std_logic;
		 A8                         :   IN   std_logic;
		 DO0                        :   OUT   std_logic;
		 DO1                        :   OUT   std_logic;
		 DO2                        :   OUT   std_logic;
		 DO3                        :   OUT   std_logic;
		 DO4                        :   OUT   std_logic;
		 DO5                        :   OUT   std_logic;
		 DO6                        :   OUT   std_logic;
		 DO7                        :   OUT   std_logic;
		 DO8                        :   OUT   std_logic;
		 DO9                        :   OUT   std_logic;
		 DO10                        :   OUT   std_logic;
		 DO11                        :   OUT   std_logic;
		 DO12                        :   OUT   std_logic;
		 DO13                        :   OUT   std_logic;
		 CK                            :   IN   std_logic;
		 CS                            :   IN   std_logic;
		 OE                            :   IN   std_logic
	     );
    end component;



begin

    rom_inst  : SPUD130_512X14BM1A
    generic map (TimingChecksOn => False)
    port map (
		 A0   => addr(0), 
		 A1   => addr(1), 
		 A2   => addr(2), 
		 A3   => addr(3), 
		 A4   => addr(4), 
		 A5   => addr(5), 
		 A6   => addr(6), 
		 A7   => addr(7), 
		 A8   => addr(8), 
		 DO0  => data_out(0), 
		 DO1  => data_out(1), 
		 DO2  => data_out(2), 
		 DO3  => data_out(3), 
		 DO4  => data_out(4), 
		 DO5  => data_out(5), 
		 DO6  => data_out(6), 
		 DO7  => data_out(7), 
		 DO8  => data_out(8), 
		 DO9  => data_out(9), 
		 DO10 => data_out(10), 
		 DO11 => data_out(11), 
		 DO12 => data_out(12), 
		 DO13 => data_out(13), 
		 CK   => CK, 
		 CS   => CS,
		 OE   => OE
	     );



end architecture;
