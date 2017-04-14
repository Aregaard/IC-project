library ieee;
use ieee.numeric_std.all; 
use ieee.std_logic_1164.all; 
use std.textio.all;  
use ieee.std_logic_textio.all;

--- Componentslibrary ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;



ENTITY Top_test_power IS
END;

ARCHITECTURE behavior OF Top_test_power IS
--use work.tb_pkg; 

--- Components ---
COMPONENT Top_pad
port (  
        start : in std_logic;
        clk : in std_logic;
        reset : in std_logic;
        input0 : in std_logic_vector(7 downto 0);
        finish : out std_logic
      );
      
  
END COMPONENT;


--- Signals HA ---
signal clk : std_logic := '0';
signal reset : std_logic := '1';
signal start : std_logic := '0';
signal input_pad : std_logic_vector(7 downto 0) := (others => '0');
signal finish : std_logic;

--- Signals ---

signal CS : std_logic := '1';
signal OE : std_logic := '1'; -- Try having this at 0 zero as well. 

constant clk_period : time := 100 ns;
constant clk_period_half :time:= 50 ns;

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
        variable counter : integer := 0;
    begin

        --while (count_line <= 23) loop --till the end of file is reached continue. 
       wait for clk_period*2 + clk_period_half;
       --if(reset = '0') then
       for counter in 0 to 9 loop
        wait for clk_period + clk_period_half;
        reset <= '0';
        wait for clk_period+clk_period_half;
        start <= '1';
        wait for clk_period+ clk_period_half;
        start <= '0';
        if(counter = 0) then 
        file_open(file_pointer,"/h/dc/e/elt13ms1/matrixmult/assignment_resources/input_stimuli.txt",READ_MODE); 
        elsif(counter = 1) then 
        file_open(file_pointer,"/h/dc/e/elt13ms1/matrixmult/assignment_resources/input_stimuli1.txt",READ_MODE); 
        elsif(counter = 2) then 
        file_open(file_pointer,"/h/dc/e/elt13ms1/matrixmult/assignment_resources/input_stimuli2.txt",READ_MODE);
        elsif(counter = 3) then 
        file_open(file_pointer,"/h/dc/e/elt13ms1/matrixmult/assignment_resources/input_stimuli3.txt",READ_MODE);
        elsif(counter = 4) then 
        file_open(file_pointer,"/h/dc/e/elt13ms1/matrixmult/assignment_resources/input_stimuli4.txt",READ_MODE);
        elsif(counter = 5) then 
        file_open(file_pointer,"/h/dc/e/elt13ms1/matrixmult/assignment_resources/input_stimuli5.txt",READ_MODE);
        elsif(counter = 6) then 
        file_open(file_pointer,"/h/dc/e/elt13ms1/matrixmult/assignment_resources/input_stimuli6.txt",READ_MODE);
        elsif(counter = 7) then 
        file_open(file_pointer,"/h/dc/e/elt13ms1/matrixmult/assignment_resources/input_stimuli7.txt",READ_MODE);
        elsif(counter = 8) then 
        file_open(file_pointer,"/h/dc/e/elt13ms1/matrixmult/assignment_resources/input_stimuli8.txt",READ_MODE);
        elsif(counter = 9) then 
        file_open(file_pointer,"/h/dc/e/elt13ms1/matrixmult/assignment_resources/input_stimuli9.txt",READ_MODE);
        end if;
       --backup wait for clk_period*2;
       while (not(endfile(file_pointer))) loop --till the end of file is reached continue.
        
      
        readline (file_pointer,line_num);  --Read the whole line from the file
        --Read the contents of the line from  the file into a variable.
        READ (line_num,line_content);
        --For each character in the line convert it to binary value.
        --And then store it in a signal named 'bin_value'.
          --wait until clk'event and clk='0';
           
          for j in 0 to 7 loop  
              char := line_content(j+1);
              if(char = '0' and count_line < 24) then
              
                  input_pad((7-j)) <= '0';
              elsif(char = '1' and count_line < 24) then
                  input_pad((7-j)) <= '1';
              end if;
          end loop;
          
          count_line := count_line + 1; 
         
          wait for clk_period; --after reading each line wait for 10ns.
        end loop;        
        file_close(file_pointer);  --after reading all the lines close the file.
        wait for 17 us;
        reset <= '1';
         j := 0;
        char := '0';         --Open the file read.txt from the specified location for reading(READ_MODE).
        count_line:= 0;
        
        end loop;
        
        --end if;
        
    end process;  



--reset <= '0' after clk_period + clk_period_half;
        
--start <= '1' after clk_period + clk_period_half,
--  --        '0' after 5*clk_period + clk_period_half;
--        reset <= '1' after clk_period + clk_period_half,
--            '0' after 5*clk_period + clk_period_half;
--        
--         start <= '1' after 6*clk_period + clk_period_half,
--          '0' after 10*clk_period + clk_period_half;

--- Connnect components --- 
DUT: Top_pad PORT MAP (
      start => start,
      clk => clk, 
      reset => reset,
      input0 => input_pad,
      finish => finish
    );

--wait until clk'event and clk='0';

seq: process
begin
  clk <= '0';
  wait for clk_period/2;
  clk <= '1';
  wait for clk_period/2;

end process;



END ARCHITECTURE; 
