library ieee, foc0l_a33_t33_generic_io;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;
use foc0l_a33_t33_generic_io.all;


ENTITY Top_pad is 
  port( start : in std_logic;
        clk : in std_logic;
        reset : in std_logic;
        input0 : in std_logic_vector(7 downto 0);
        finish : out std_logic
      );
  

END ENTITY; 

ARCHITECTURE behavior OF Top_pad IS

--input data
  component XMLB 
    port( I :  in std_logic;
          O : out std_logic;
         PU :  in std_logic;
         PD :  in std_logic;
        SMT :  in std_logic );
  end component;
--output data
  component YA28SLB
    port( O : out std_logic;
          I :  in std_logic;
          E :  in std_logic;
         E2 :  in std_logic;
         E4 :  in std_logic;
         SR :  in std_logic );
  end component;
signal web : std_logic;

component Top
    port(start : in std_logic;
        clk : in std_logic;
        reset : in std_logic;
        input0 : in std_logic_vector(7 downto 0);
        finish : out std_logic );
  end component;

---------------


--- Signals TOP_pad---
signal start_pad, reset_pad, clk_pad, finish_pad : std_logic;
signal input_pad : std_logic_vector(7 downto 0);


--- Signals ---

 
signal HIGH : std_logic;
signal LOW  : std_logic;


BEGIN
  HIGH <= '1';
  LOW  <= '0';
  
--- Connnect components --- 
DUT: Top PORT MAP (
      start => start_pad,
      clk => clk_pad,
      reset => reset_pad,
      input0 => input_pad,
      finish => finish_pad
    );

Start_Pad1: XMLB PORT MAP(
      I => start,
      O => start_pad,
      PU =>  LOW,
      PD => LOW,
      SMT =>  LOW
    );
    
Clk_Pad1: XMLB PORT MAP(
      I => clk,
      O => clk_pad,
      PU =>  LOW,
      PD => LOW,
      SMT =>  LOW
    );
    
Reset_Pad1: XMLB PORT MAP(
      I => reset,
      O => reset_pad,
      PU =>  LOW,
      PD => LOW,
      SMT =>  LOW
    );

Finish_Pad1: YA28SLB PORT MAP(
      O => finish,
      I => finish_pad,
      E =>  HIGH,
      E2 => LOW,
      E4 =>  LOW,
      SR => LOW
    );


    Inpad_0 : XMLB PORT MAP(
      I => input0(0), 
      O => input_pad(0), 
      PU  => LOW, 
      PD  => LOW, 
      SMT => LOW
      );
    --  
      Inpad_1 : XMLB
      port map( 
      I => input0(1), 
      O => input_pad(1), 
      PU  => LOW, 
      PD  => LOW, 
      SMT => LOW
      );
      
    Inpad_2 : XMLB
     port map( 
      I => input0(2), 
      O => input_pad(2), 
      PU  => LOW, 
      PD  => LOW, 
      SMT => LOW
      );
      
         Inpad_3 : XMLB
    port map( 
      I => input0(3), 
      O => input_pad(3), 
      PU  => LOW, 
      PD  => LOW,
      SMT => LOW
      );
      
         Inpad_4 : XMLB
    port map( 
      I => input0(4), 
      O => input_pad(4), 
      PU  => LOW, 
      PD  => LOW, 
      SMT => LOW
      );
      
         Inpad_5 : XMLB
    port map( 
      I => input0(5), 
      O => input_pad(5), 
      PU  => LOW, 
      PD  => LOW, 
      SMT => LOW
      );
      
         Inpad_6 : XMLB
    port map( 
      I => input0(6), 
      O => input_pad(6), 
      PU  => LOW, 
      PD  => LOW, 
      SMT => LOW
      );
      
         Inpad_7 : XMLB
    port map( 
      I => input0(7), 
      O => input_pad(7), 
      PU  => LOW, 
      PD  => LOW, 
      SMT => LOW
      );





END ARCHITECTURE; ---
