----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:53:50 10/15/2017 
-- Design Name: 
-- Module Name:    PSR_Modifier - Behavioral 
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

entity PSR_Modifier is
    Port ( crs1 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           crs2 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           Aluop : in  STD_LOGIC_VECTOR(5 DOWNTO 0);
           Aluresult : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
			  Reset : in  STD_LOGIC;
           NZVC : out  STD_LOGIC_VECTOR(3 DOWNTO 0));
end PSR_Modifier;

architecture Behavioral of PSR_Modifier is

begin

Process(crs1, crs2, Aluop, Aluresult, Reset)
Begin
	if(Reset = '1') then
		NZVC <= "0000";
		
	else	
		--Logicas Andcc Nandcc Orcc Norcc Xorcc Xnorcc 
		if Aluop = "001000" or Aluop = "001001" or Aluop = "001010" or ALuop = "001011" or Aluop = "001100" or ALuop = "001101" then 
			NZVC(3) <= Aluresult(31);
			if Aluresult = "00000000000000000000000000000000" then 
				NZVC(2) <= '1';
			else
				NZVC(2) <= '0';
			end if;
			NZVC(1) <= '0';
			NZVC(0) <= '0';
		end if;	

		
		--Aritmeticas
				
				
			--Add
			if ALuop = "001110" or Aluop = "010000" then
				NZVC(3) <= Aluresult(31);
				if Aluresult = "00000000000000000000000000000000" then 
					NZVC(2) <= '1';
				else
					NZVC(2) <= '0';
				end if;
				NZVC(1) <= (crs1(31) and crs2(31) and (not ALuresult(31))) or ((not crs1(31)) and (not crs2(31)) and Aluresult(31));
				NZVC(0) <= (crs1(31) and crs2(31)) or ((not ALuresult(31)) and (crs1(31) or crs2(31)));
			end if;
					
					--Sub
			if ALuop = "010001" or Aluop = "010011" then
				NZVC(3) <= Aluresult(31);
				if Aluresult = "00000000000000000000000000000000" then 
					NZVC(2) <= '1';
				else
					NZVC(2) <= '0';
				end if;
				NZVC(1) <= (crs1(31) and (not crs2(31)) and (not ALuresult(31))) or ((not crs1(31)) and crs2(31) and Aluresult(31));
				NZVC(0) <= ((not crs1(31)) and crs2(31)) or (Aluresult(31) and ((not crs1(31)) or crs2(31)));
			end if;
			
		end if;
	end process;


end Behavioral;

