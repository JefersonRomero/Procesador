----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:08:46 10/15/2017 
-- Design Name: 
-- Module Name:    Windows_Manager - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Windows_Manager is
    Port ( RS1 : in  STD_LOGIC_VECTOR (4 DOWNTO 0);
           RS2 : in  STD_LOGIC_VECTOR (4 DOWNTO 0);
           RD : in  STD_LOGIC_VECTOR (4 DOWNTO 0);
           OP : in  STD_LOGIC_VECTOR (1 DOWNTO 0);
           OP3 : in  STD_LOGIC_VECTOR (5 DOWNTO 0);
           CWP : in  STD_LOGIC;
           nRS1 : out  STD_LOGIC_VECTOR (5 DOWNTO 0);
           nRS2 : out  STD_LOGIC_VECTOR (5 DOWNTO 0);
           nRD : out  STD_LOGIC_VECTOR (5 DOWNTO 0);
           nCWP : out  STD_LOGIC);
end Windows_Manager;

architecture Behavioral of Windows_Manager is


begin

Process(RS1, RS2, RD, OP, OP3, CWP)
Begin
	
	--save
	if (OP = "10" and OP3 = "111100") then
		nCWP <= '0';
	--restore
	elsif (OP = "10" and OP3 = "111101") then
		nCWP <= '1';
	end if;
	
	-- rs1
	if (RS1 >= "10000" and RS1 <= "10111") then
		nRS1 <= conv_std_logic_vector(( conv_integer(RS1) + conv_integer(CWP) * 16),6); --local 
	
	elsif (RS1 >= "11000" and RS1 <= "11111") then
		nRS1 <=conv_std_logic_vector(( conv_integer(RS1) - conv_integer(CWP) * 16),6);  --input
	
	elsif (RS1 >= "01000" and RS1 <= "01111") then
		nRS1 <=conv_std_logic_vector(( conv_integer(RS1) + conv_integer(CWP) * 16),6); --output
	
	elsif (RS1 >= "00000" and RS1 <= "00111") then 
		nRS1 <=conv_std_logic_vector(( conv_integer(RS1)),6);
			
		
	end if;
	
	
	
	-- rs2
	if (RS2 >= "10000" and RS2 <= "10111") then
		nRS2 <=conv_std_logic_vector(( conv_integer(RS2) + conv_integer(CWP) * 16),6); --local 
	
	elsif (RS2 >= "11000" and RS2 <= "11111") then
		nRS2 <=conv_std_logic_vector(( conv_integer(RS2) - conv_integer(CWP) * 16),6);  --input
	
	elsif (RS2 >= "01000" and RS2 <= "01111") then
		nRS2 <=conv_std_logic_vector(( conv_integer(RS2) + conv_integer(CWP) * 16),6); --output
		
	elsif (RS2 >= "00000" and RS2 <= "00111") then 
		nRS2 <=conv_std_logic_vector(( conv_integer(RS2)),6);	
	
	end if;
	
	
	--rd
	if (RD >= "10000" and RD <= "10111") then
		nRD <=conv_std_logic_vector(( conv_integer(RD) + conv_integer(CWP) * 16),6); --local 
	
	elsif (RD >= "11000" and RD<= "11111") then
		nRD <=conv_std_logic_vector(( conv_integer(RD) - conv_integer(CWP) * 16),6);  --input
	
	elsif (RD >= "01000" and RD <= "01111") then
		nRD <=conv_std_logic_vector(( conv_integer(RD) + conv_integer(CWP) * 16),6); --output
	
	elsif (RD >= "00000" and RD <= "00111") then 
		nRD <=conv_std_logic_vector((conv_integer(RD)),6);	
	end if;
			

END PROCESS;
end Behavioral;

