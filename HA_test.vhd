
library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all; 
use std.textio.all;  
use ieee.std_logic_textio.all;

--- Componentslibrary ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;



ENTITY HA_testbench IS
END;

ARCHITECTURE behavior OF HA_testbench IS
--use work.tb_pkg; 

--- Components ---
COMPONENT HA
port (
        start : in std_logic;
        clk : in std_logic;
        reset : in std_logic;
        data_rom : in unsigned (13 downto 0);
        address_rom:  out unsigned(8 downto 0);
        input0 : in std_logic_vector(7 downto 0);
        web : out std_logic;
        data_ram : out std_logic_vector(31 downto 0);
        address : out unsigned(6 downto 0); -- 0 to 15 adress
        finish : out std_logic
      );
      
  
END COMPONENT;

COMPONENT rom_wrapper
port (
	     addr : in unsigned(8 downto 0);
	     data_out : out unsigned(13 downto 0);
	     CK                            :   IN   std_logic; -- clk
	     CS                            :   IN   std_logic; -- chip select. set as 1
	     OE                            :   IN   std_logic -- Output enable. 
	 );
END COMPONENT;

--- Signals HA ---
signal clk : std_logic := '0';
signal reset : std_logic := '1';
signal start : std_logic := '0';
signal data_rom : unsigned(13 downto 0) := "00000000000000";
signal address_rom : unsigned (8 downto 0) := (others => '0');
signal input0 : std_logic_vector(7 downto 0) := (others => '0');
signal web : std_logic;
signal data_ram : std_logic_vector(31 downto 0);
signal address : unsigned(6 downto 0);
signal finish : std_logic;

--- Signals ---

signal CS : std_logic := '1';
signal OE : std_logic := '1'; -- Try having this at 0 zero as well. 

constant clk_period : time := 10000 ns;

--- X file ---
--file file_pointer : text;
--variable line_content : string(1 to 4);
--variable line_num : line;
--variable j : integer := 0;
--variable char : character:='0';
	--file XCoeffFile         : text open read_mode is"/h/dc/e/elt13ms1/matrixmult/assignment_resources/input_stimuli.txt";
--	variable XCoeffFileLine : line;
--	variable input_reg      : std_logic_vector(191 downto 0);
--	variable coeff          : std_logic_vector(7 downto 0);
--	variable i              : natural;





BEGIN
    process
        
        file file_pointer : text;
        variable line_content : string(1 to 8);
        variable line_num : line;
        variable j : integer := 0;
        variable char : character := '0';         --Open the file read.txt from the specified location for reading(READ_MODE).
        variable count_line : integer := 0;
    begin
        file_open(file_pointer,"/h/d9/a/elt13owe/Desktop/matrixmult/assignment_resources/input_stimuli.txt",READ_MODE); 
        --while (count_line <= 23) loop --till the end of file is reached continue. 
        wait for clk_period*2;
       while (not(endfile(file_pointer))) loop --till the end of file is reached continue.
        
      
        readline (file_pointer,line_num);  --Read the whole line from the file
        --Read the contents of the line from  the file into a variable.
        READ (line_num,line_content);
        --For each character in the line convert it to binary value.
        --And then store it in a signal named 'bin_value'.
          
          for j in 0 to 7 loop  
              char := line_content(j+1);
              if(char = '0' and count_line < 24) then
              
                  input0((7-j)) <= '0';
              elsif(char = '1' and count_line < 24) then
                  input0((7-j)) <= '1';
              end if;
          end loop;
        
          count_line := count_line + 1; 
         
          wait for clk_period; --after reading each line wait for 10ns.
        end loop;
        file_close(file_pointer);  --after reading all the lines close the file.
    end process;  
--	for i in 23 downto 0 loop
--	   if endfile(XCoeffFile) then
--		     input_reg(i to 191) := (others => '0');
--		     exit;
--	   else
--		     readline (XCoeffFile, XCoeffFileLine);
--		     read(XCoeffFileLine, coeff);
--		     input_reg(i*8 + 8 downto i*8) <= coeff(7 downto 0);
--	   end if;
--	end loop;
--	assert endfile(XCoeffFile);
----input_register(15 downto 0) <= "0010111111001011";
----input_register(31 downto 16) <= "0000000100000010";
----input_register(47 downto 32) <= "0000001100000100";
----input_register(63 downto 48) <= "0000010100000110";
----input_register(79 downto 64) <= "0000011100001000";
--input_register(191 downto 0) <= "100000000001001010110111001101010010100001011011110101101000000010000000000101000111111100000110011111110111111110000000011111110101101011010010010100101100100101111001011111111100100011001011";
----input_register(143 downto 0) <= (others => '0');
----input_register(159 downto 144) <= "0000000100000010";
----input_register(175 downto 160) <= "0000001100000100";
----input_register(191 downto 176) <= "0000010100000110";
--




reset <= '0' after clk_period;
start <= '1' after clk_period,
          '0' after clk_period*2;

--- Connnect components --- 
DUT: HA PORT MAP (
      start => start,
      clk => clk,
      reset => reset,
      data_rom => data_rom,
      address_rom => address_rom,
      input0 => input0,
      web => web,
      data_ram => data_ram,
      address => address,
      finish => finish
    );

DUT2: rom_wrapper PORT MAP (
      addr => address_rom,
      data_out => data_rom,
      CK => clk,
      CS => CS,
      OE => OE
    );


seq: process
begin
  clk <= '0';
  wait for clk_period/2;
  clk <= '1';
  wait for clk_period/2;

end process;



END ARCHITECTURE; 
