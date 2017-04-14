library ieee, foc0l_a33_t33_generic_io;
USE ieee.numeric_std.all;
USE ieee.std_logic_1164.all;
use foc0l_a33_t33_generic_io.all;

entity HA is 
  port( start : in std_logic;
        clk : in std_logic;
        reset : in std_logic;
        data_rom : in unsigned (13 downto 0);
        address_rom : out unsigned (8 downto 0);
        input0 : in std_logic_vector(7 downto 0);
        web : out std_logic;
        data_ram : out std_logic_vector(31 downto 0);
        address : out unsigned(6 downto 0); -- 0 to 15 adress
        finish : out std_logic
      );
end HA;      
    
architecture behavioral of HA is
  type state_type is (IDLE, LOAD, EXE, SEND, INPUT_DATA, SENDDIAG);
  signal state, next_state : state_type;
  signal Actr, Xctr, Actr_next, Xctr_next : unsigned(3 downto 0);
  signal Octr, Octr_next : unsigned (4 downto 0);
  signal rX1, rX2, rA1, rA2, rX1_next, rX2_next, rA1_next, rA2_next : std_logic_vector(7 downto 0);
  signal sumreg, sumreg_next : unsigned(15 downto 0); --maxreg, maxreg_next, digreg, digreg_next : unsigned (15 downto 0);
  signal input_sample, input_sample_next : unsigned(191 downto 0); -- Input register.
  signal input_register,input_register_next : unsigned(191 downto 0);
  signal Dctr, Dctr_next : unsigned(4 downto 0);
  signal web_next, web_reg :  std_logic;
  --signal finish, web : std_logic;
  
  begin
    
    seq: process(clk,reset)
      begin
        if (reset = '1') then
          state <= IDLE;
          Actr <= (others => '0');
          Xctr <= (others => '0');
          Octr <= (others => '0');
          rA1 <= (others => '0');
          rA2 <= (others => '0');
          rX1 <= (others => '0');
          rX2 <= (others => '0');
          sumreg <= (others => '0');
          --digreg <= (others => '0');
          --maxreg <= (others => '0');          
          input_sample <= (others => '0');
          Dctr <=(others => '0');
          input_register <= (others => '0');
          web_reg <= '0';
          
          
          
        elsif (clk'event and clk ='1') then
          state <= next_state;
          sumreg <= sumreg_next;
          --digreg <= digreg_next;
          --maxreg <= maxreg_next;
          Actr <= Actr_next;
          Xctr <= Xctr_next;
          Octr <= Octr_next;
          rA1 <= rA1_next;
          rA2 <= rA2_next;
          rX1 <= rX1_next;
          rX2 <= rX2_next;
          input_sample <= input_sample_next;
          input_register <= input_register_next;
          Dctr <= Dctr_next;
          web_reg <= web_next;
          
        end if;
      end process;
        
    comb: process(state, Octr, Actr, Xctr, sumreg, start, data_rom, input0, input_sample, rA1, rA2, rX1, rX2, Dctr, web_reg) --maxreg, digreg, 
      begin 
        web <= web_reg;
        finish <= '0';
        data_ram <= (others => '0');
        address <= (others => '0');
        address_rom <= "00000" & Actr;
        sumreg_next <= sumreg;
        --digreg_next <= digreg;
        --maxreg_next <= maxreg;
        rA1_next <= rA1;
        rA2_next <= rA2;
        rX1_next <= rX1;
        rX2_next <= rX2;
        Actr_next <= Actr;
        Xctr_next <= Xctr;
        Octr_next <= Octr;
        web_next <= web_reg;
        input_sample_next <= input_sample;
        input_register_next <= input_register;
        Dctr_next <= Dctr;
       
       
        case (state) is
          
          
          when IDLE =>
            Actr_next <= (others => '0');
            Xctr_next <= (others => '0');
            Octr_next <= (others => '0');
            rA1_next <= (others => '0');
            rA2_next <= (others => '0');
            rX1_next <= (others => '0');
            rX2_next <= (others => '0');
            sumreg_next <= (others => '0');
            input_sample_next <= (others => '0');
            input_register_next <= (others => '0');
            
            
            if (start = '1') then
              next_state <= INPUT_DATA;
              
              
            else
              next_state <= IDLE;
            end if;
          
          
          when INPUT_DATA =>
            
            
            if(Dctr = 24) then
              next_state <= LOAD;
              input_sample_next <= unsigned(input_register);
              input_register_next <= input_register;
            else
              input_register_next <= unsigned(input0) & input_register(191 downto 8);
              Dctr_next <= Dctr + 1;
              next_state <= INPUT_DATA;
          end if;
        
          when LOAD =>
            if (Octr = 16) then
              --finish <= '1';
              --data_ram <= "0000000000000000" & std_logic_vector(maxreg); -- Send max reg. 
              --digreg_next <= "00" & digreg(15 downto 2); -- Average of diag elements
              next_state <= SENDDIAG;
            else
              rA2_next <= "0" & std_logic_vector(data_rom(6 downto 0));
              rA1_next <= "0" & std_logic_vector(data_rom(13 downto 7));
              --rX1_next <= input_register( to_integer((Xctr*16) + 7) downto to_integer(Xctr*16));
              --rX2_next <= input_register( to_integer((Xctr*16) + 15) downto to_integer((Xctr*16) + 8));
              rX1_next <= std_logic_vector(input_sample( 7 downto 0));
              rX2_next <= std_logic_vector(input_sample( 15 downto 8));
              input_sample_next <= input_sample srl 16; 
              next_state <= EXE;
            end if;
            
          when EXE =>
            sumreg_next <= sumreg + unsigned(rA1)*unsigned(rX1) + unsigned(rA2)*unsigned(rX2);
            Octr_next <= Octr + 1;  
            
            if (Actr = 11) then
              next_state <= SEND; -- Goes to the extra send state because sum will be one clk delayed
              web_next <= '1';              
              Actr_next <= (others => '0');
              if (Xctr = 2) then
                Xctr_next <= "0011";
                input_sample_next <= input_register srl 48;
              elsif (Xctr = 5) then
                input_sample_next <= input_register srl 96;
                Xctr_next <= "0110";
              elsif (Xctr = 8) then
                input_sample_next <= input_register srl 144;
                Xctr_next <= "1001";
              else
                Xctr_next <= "0000"; -- Won't happen most likely.
                input_sample_next <= input_register;
              end if;
            else
              next_state <= SEND; -- Goes to the extra send state because sum will be one clk delayed
              web_next <= '1';
              Actr_next <= Actr;              
              if (Xctr = 2) then
                input_sample_next <= input_register;
                Xctr_next <= "0000";
              elsif (Xctr = 5) then
                input_sample_next <= input_register srl 48; -- 16*3. Shift 3 times to get to the correct row
                Xctr_next <= "0011";
              elsif (Xctr = 8) then
                input_sample_next <= input_register srl 96; --shift 6 times
                Xctr_next <= "0110";
              elsif (Xctr = 11) then
                input_sample_next <= input_register srl 144; -- shift 9 times
                Xctr_next <= "1001";
              else
                Xctr_next <= Xctr + 1; -- When not 2,5, 8 or 11
                Actr_next <= Actr + 1;
                Octr_next <= Octr; -- Don't change
                next_state <= LOAD; -- Go back to load not sending
                web_next <= '0';
                address_rom <= "00000" & Actr+1; -- Added 1 since the value we want is the next one for load and it's not finished updating yet
              end if;
            end if;  
            
                     
            when SEND =>
              --web <= '1';
              web <= web_reg;
              web_next <= '0';
              if (Actr = 0) then -- For when Actr goes from 11 back to 0
                Actr_next <= Actr; 
                address_rom <= "00000" & Actr; -- same ass address_rom in SEND
              else
                Actr_next <= Actr + 1; -- Takes + in actr here for the last column
                address_rom <= "00000" & Actr + 1; -- same ass address_rom in SEND
              end if;
              --if (sumreg > maxreg) then
--                maxreg_next <= sumreg;
--              else
--                
--              end if;
              --if (Octr = 1 or Octr = 6 or Octr = 11 or Octr = 16) then
--                digreg_next <= digreg + sumreg;
--              else
--                
--              end if;
                
              data_ram <= "0000000000000000" & std_logic_vector(sumreg);
              sumreg_next <= (others => '0');
              address <= unsigned("00" & std_logic_vector(Octr));
              next_state <= LOAD;
              --address_rom <= "00000" & Actr + 1; -- same ass address_rom in SEND
            when SENDDIAG =>
              --data_ram <= "0000000000000000" & std_logic_vector(digreg);
              finish <= '1';
              next_state <= IDLE;
          end case;          
      end process;
end architecture;