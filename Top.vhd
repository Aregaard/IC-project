library ieee;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;

ENTITY Top is 
  port( start : in std_logic;
        clk : in std_logic;
        reset : in std_logic;
        input0 : in std_logic_vector(7 downto 0);
        finish : out std_logic
      );
  

END ENTITY; 

ARCHITECTURE behavior OF Top IS

COMPONENT HA
port (
        start : in std_logic;
        clk : in std_logic;
        reset : in std_logic;
        data_rom : in unsigned (13 downto 0);
        address_rom:  out unsigned(8 downto 0);
        input0: in std_logic_vector(7 downto 0);
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

COMPONENT ram_wrapper
port (
	  addr     : in  unsigned(6 downto 0);
    data_out : out std_logic_vector(31 downto 0);
    data_in  : in  std_logic_vector(31 downto 0);
    CK       : in  std_logic;
    CS       : in  std_logic;
    WEB      : in  std_logic;
    OE       : in  std_logic 
	 );
END COMPONENT;

--- Signals TOP---
signal data_rom : unsigned(13 downto 0);
signal address_rom : unsigned (8 downto 0);
signal web : std_logic;
signal data_ram : std_logic_vector(31 downto 0);
signal address_ram : unsigned(6 downto 0);
signal data_out : std_logic_vector(31 downto 0);

--- Signals ---

signal HIGH : std_logic;




BEGIN
HIGH <= '1';
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
      address => address_ram,
      finish => finish
    );

DUT2: rom_wrapper PORT MAP (
      addr => address_rom,
      data_out => data_rom,
      CK => clk,
      CS => HIGH,
      OE => HIGH
    );

DUT3: ram_wrapper PORT MAP (
      addr => address_ram,
      data_out => data_out,
      data_in  => data_ram,
      CK  => clk,
      CS =>HIGH,
      WEB => web,
      OE  =>HIGH
    );




END ARCHITECTURE; ---
