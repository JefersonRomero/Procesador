----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:31:56 10/21/2017 
-- Design Name: 
-- Module Name:    SEU22 - Behavioral 
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

entity SEU22 is
    Port ( IMM22 : in  STD_LOGIC_VECTOR(21 DOWNTO 0);
           SEUIMM : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
end SEU22;

architecture Behavioral of SEU22 is

CONSTANT  aux1: std_logic_vector(9 downto 0):=(others=>'0');
CONSTANT  aux2: std_logic_vector(9 downto 0):=(others=>'1');

begin

process(IMM22)
	begin
	
		if(IMM22(21) = '0') then 
			SEUIMM <= aux1 & IMM22;
		else 
			SEUIMM <= aux2 & IMM22;
		end if;
		
end process;

end Behavioral;

