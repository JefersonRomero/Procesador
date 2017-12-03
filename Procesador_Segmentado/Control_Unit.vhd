----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:00:52 11/27/2017 
-- Design Name: 
-- Module Name:    Control_Unit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Control_Unit is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
	        OP2 : in std_logic_vector (2 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  nzvc : in STD_logic_vector (3 downto 0);
			  cond : in STD_logic_vector (3 downto 0);
			  rd_source : out std_logic;
			 -- clk : in std_logic; --PRUEBA 1
			  pc_source : out STD_LOGIC_VECTOR(1 downto 0);
			  wrenrf : out std_logic;
			  wrendm : out std_logic;
			  srcdatatoreg : out std_logic_vector(1 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (4 downto 0));
end Control_Unit;
architecture arq_Controlunit of Control_Unit is

begin
---------------- falta  shifts -- error load store
  process(OP,OP3,nzvc,cond,op2)--,clk)

  begin
     --if(rising_edge(clk)) then -- PRUEBA 1
     if(OP="01") then
		srcdatatoreg <="11";
		wrendm <= '0';
		wrenrf <= '0';
		pc_source<="10" ;
		rd_source<= '0';
	  end if;
	  
--	  pc source es  ---- srcdatatoreg es ------------  wrendm  ------ wrenrf
--	  00 normal  ------   00 aluresult  --------------  0 otras ------0 store,call,branches
--	  01 jmpl     ------  01 DATA MEMORY ------------  1 store ------1 otras
--	  10 call   - -----   10 call-jmpl(pc)  ------------------
--	  11 branch    ----   11 call-jmpl (pc) ------------------
	  
	  
	if(OP="00") then
	 if (OP2="010")then
	  ------------------------------------------------  BRANCHES    -------------------------------------------------
	  case (cond) is
	  
	  when "0000" =>------------------  0 NEVER  ---------------
			srcdatatoreg <="00";
			wrendm <= '0';
			wrenrf <= '0';
			pc_source<="00" ;
			rd_source<= '1';
		   ALUOP <= "11111";
			
		when "1000" => ----------------- 8 ALWAYS  --------------
				srcdatatoreg <="00";
				wrendm <= '0';
				wrenrf <= '0';
				pc_source<="11" ;
				rd_source<= '1';
				ALUOP <= "11111";
				
		when "1001" => ----------- 9 NOT EQUAL -------------
			srcdatatoreg <="00";
			wrendm <= '0';
			wrenrf <= '0';
			if(not nzvc(2) ='1') then -- not Z
				pc_source<="11";
			else
				pc_source <= "00";
			end if;
			rd_source<= '0';
         ALUOP <= "11111";
			
		 when "0001" => -----------1 EQUAL -------------
			srcdatatoreg <="00";
			wrendm <= '0';
			wrenrf <= '0';
			if(nzvc(2) ='1') then-- Z
				pc_source<="11";
			else
				pc_source <= "00";
			end if;
			rd_source<= '0';
			ALUOP <= "11111";
			
		 when "1010" => -----------10 GREATER -------------
			srcdatatoreg <="00";
			wrendm <= '0';
			wrenrf <= '0';
			if((not(nzvc(2) or (nzvc(3) xor nzvc(1))))='1') then --not (Z or (N xor V))
				pc_source<="11";
			else
				pc_source <= "00";
			end if;
			rd_source<= '0';
			ALUOP <= "11111";
			
       when "0010" => -----------2 LESS OR EQUAL -------------
			srcdatatoreg <="00";
			wrendm <= '0';
			wrenrf <= '0';
			if((nzvc(2) or(nzvc(3) xor nzvc(1)))='1') then --Z or (N xor V)
				pc_source<="11";
			else
				pc_source <= "00";
			end if;
			rd_source<= '1';
			ALUOP <= "11111";
			
       when "1011" => -----------11 GREATER OR EQUAL -------------
			srcdatatoreg <="00";
			wrendm <= '0';
			wrenrf <= '0';
			if(not(nzvc(3) xor nzvc(1))='1') then --not (N xor V)
				pc_source<="11";
			else
				pc_source <= "00";
			end if;
			rd_source<= '0';
			ALUOP <= "11111";
			
       when "0011" => -----------3 LESS -------------
			srcdatatoreg <="00";
			wrendm <= '0';
			wrenrf <= '0';
			if((nzvc(3) xor nzvc(1))='1') then --N xor V
				pc_source<="11";
			else
				pc_source <= "00";
			end if;
			rd_source<= '1';
			ALUOP <= "11111";
			
       when "1100" => -----------12 GREATER UNSIGNED -------------
			srcdatatoreg <="00";
			wrendm <= '0';
			wrenrf <= '0';
			if(not(nzvc(0) or nzvc(2))='1') then --not (C or Z)
				pc_source<="11";
			else
				pc_source <= "00";
			end if;
			rd_source<= '1';
			ALUOP <= "11111";
			
       when "0100" => -----------4 LESS OR EQUAL UNSIGNED -------------
			srcdatatoreg <="00";
			wrendm <= '0';
			wrenrf <= '0';
			if((nzvc(0) or nzvc(2))='1') then--(C or Z)
				pc_source<="11";
			else
				pc_source <= "00";
			end if;
			rd_source<= '1';	
			ALUOP <= "11111";
			
       when "1101" => -----------13 CARRY CLEAR -------------
			srcdatatoreg <="00";
			wrendm <= '0';
			wrenrf <= '0';
			if((not nzvc(0))='1') then -- not C
			pc_source<="11";
			else
			pc_source <= "00";
			end if;
			rd_source<= '1';
			ALUOP <= "11111";
			
       when "0101" => -----------5 CARRY SET-------------
			srcdatatoreg <="00";
			wrendm <= '0';
			wrenrf <= '0';
			if((nzvc(0))='1') then -- C
			pc_source<="11";
			else
			pc_source <= "00";
			end if;
			rd_source<= '1';
			ALUOP <= "11111";
			
		when "1110" => -----------14 POSITIVE -------------
			srcdatatoreg <="00";
			wrendm <= '0';
			wrenrf <= '0';
			if((not nzvc(3))='1') then -- not N
			pc_source<="11";
			else
			pc_source <= "00";
			end if;
			rd_source<= '1';
			ALUOP <= "11111";
			
		when "0110" => -----------6 NEGATIVE -------------
			srcdatatoreg <="00";
			wrendm <= '0';
			wrenrf <= '0';
			if((nzvc(3))='1') then -- N
			pc_source<="11";
			else
			pc_source <= "00";
			end if;
			rd_source<= '1';
			ALUOP <= "11111";
			
		when "1111" => -----------15 OVERFLOW CLEAR -------------
			srcdatatoreg <="00";
			wrendm <= '0';
			wrenrf <= '0';
			if((not nzvc(1))='1') then -- not V
			pc_source<="11";
			else
			pc_source <= "00";
			end if;
			rd_source<= '1';
			ALUOP <= "11111";
			
		when "0111" => -----------7 OVERFLOW SET -------------
			srcdatatoreg <="00";
			wrendm <= '0';
			wrenrf <= '0';
			if((nzvc(1))='1') then -- V
			pc_source<="11";
			else
			pc_source <= "00";
			end if;
			rd_source<= '1';
			ALUOP <= "11111";
			
      when others =>     
			srcdatatoreg <="00";
			wrendm <= '0';
			wrenrf <= '0';
			pc_source <= "00";
			rd_source<= '1';
			ALUOP <= "11111";
			
	  end case;
	  else      --nop
	  srcdatatoreg <="00";
			wrendm <= '0';
			wrenrf <= '0';
			pc_source <= "00";
			rd_source<= '0';
			ALUOP <= "11111";
			end if;
	end if;
  
     if (OP = "10") then
      
      case (OP3) is 
		---------------------------------------- ARITMETICAS  ---------------------------------------------
		when "000000" => -------------add
			ALUOP <= "00000";
			 wrenrf<= '1';
			srcdatatoreg <= "00";
			wrendm<= '0';		
			pc_source <= "00";
			rd_source <= '1';
		when "111100" => ---------- save
			ALUOP <= "00000";
			wrenrf<= '1';----- duda de RD
			srcdatatoreg <= "00";
			wrendm<= '0';
			pc_source <= "00";
			rd_source <= '1';
		when "111101" => -----------restore
			ALUOP <= "00000";
			wrenrf<= '1';------ duda de RD
			srcdatatoreg <= "00";
			wrendm<= '0';
			pc_source <= "00";
			rd_source <= '1';
		when "000100" =>-------sub
			ALUOP <="00001";
			wrenrf<= '1';
			srcdatatoreg <= "00";
			wrendm<= '0';
			pc_source <= "00";
			rd_source <= '1';
		when "000010" =>-----------or
			ALUOP <="00010";	
			wrenrf<= '1';
			srcdatatoreg <= "00";
			wrendm<= '0';
			pc_source <= "00";
			rd_source <= '1';
		when "000001" =>-----------and
			ALUOP <="00011";
			wrenrf<= '1';
			srcdatatoreg <= "00";
			wrendm<= '0';
			pc_source <= "00";
			rd_source <= '1';
		when "000011" =>----------xor
			ALUOP <="00100";
			wrenrf<= '1';
			srcdatatoreg <= "00";
			wrendm<= '0';
			pc_source <= "00";
			rd_source <= '1';
      when "010100" =>---------subcc
			ALUOP <="00101";
			wrenrf<= '1';
			srcdatatoreg <= "00";
			wrendm<= '0';
			pc_source <= "00";
			rd_source <= '1';
		when "001100" =>----------subx
			ALUOP <="00110";
			wrenrf<= '1';
			srcdatatoreg <= "00";
			wrendm<= '0';
			pc_source <= "00";
			rd_source <= '1';
		when "011100" =>----------subxcc
			ALUOP <="00111";
			wrenrf<= '1';
			srcdatatoreg <= "00";
			wrendm<= '0';
			pc_source <= "00";
			rd_source <= '1';
		when "010000" =>-------------addcc
			ALUOP <="01000";
			wrenrf<= '1';
			srcdatatoreg <= "00";
			wrendm<= '0';
			pc_source <= "00";
			rd_source <= '1';
		when "001000" =>-------------addx
			ALUOP <="01001";
			wrenrf<= '1';
			srcdatatoreg <= "00";
			wrendm<= '0';
			pc_source <= "00";
			rd_source <= '1';
		when "011000" =>-------------addxcc
			ALUOP <="01011";
			wrenrf<= '1';
			srcdatatoreg <= "00";
			wrendm<= '0';
			pc_source <= "00";
			rd_source <= '1';
		when "010001" =>---------------andcc
			ALUOP <="01100";
			wrenrf<= '1';
			srcdatatoreg <= "00";
			wrendm<= '0';
			pc_source <= "00";
			rd_source <= '1';
		when "010010" =>-------------orcc
			ALUOP <="01101";
			wrenrf<= '1';
			srcdatatoreg <= "00";
			wrendm<= '0';
			pc_source <= "00";
			rd_source <= '1';
		when "010011" =>----------xorcc
			ALUOP <="01110";		
			wrenrf<= '1';
			srcdatatoreg <= "00";
			wrendm<= '0';
			pc_source <= "00";
			rd_source <= '1';
		
		when "111000" =>------------------JMPL--------------------
			ALUOP <="00000";		
			wrenrf<= '1';
			srcdatatoreg <= "11";--- duda 00 -> 11
			wrendm<= '0';
			pc_source <= "01";
			rd_source <= '1';
		
		
		when others =>--- FALTA SHIFT
			ALUOP <= "11111";
			wrenrf<= '0';
			srcdatatoreg <= "00";
			wrendm<= '0';
			pc_source <= "00";
			rd_source <= '1';
	end case;
	 
	elsif (OP = "11") then 
	
	case (OP3) is
	--pc_source <= "00";
		when "000000" => --------- load
			ALUOP <= "00000";
			wrenrf <= '1';
			wrendm<= '0';
			srcdatatoreg <="01";
			pc_source <= "00";
			rd_source <= '1';
		when "000100" => ----------- store
			ALUOP <= "00000";
			wrenrf <= '0';
			wrendm<= '1';
			srcdatatoreg <= "00";
			pc_source <= "00";
			rd_source <= '1';
	
		when others =>
			ALUOP <= "11111";
			wrenrf <= '0';
			srcdatatoreg <= "00";
			wrendm<= '0';
			rd_source <= '1';
			pc_source <= "00";
	
	end case;
	end if;
	--end if; -- clk de PRUEBA 1
  end process;
end arq_Controlunit;
