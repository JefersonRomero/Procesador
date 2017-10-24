----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:08:12 10/23/2017 
-- Design Name: 
-- Module Name:    SEU30 - Behavioral 
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

entity SEU30 is
Port ( imm30 : in  STD_LOGIC_VECTOR (29 downto 0);
       imm32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU30;

architecture Behavioral of SEU30 is

signal aux1: std_logic_vector(1 downto 0):=(others=>'0');
signal aux2: std_logic_vector(1 downto 0):=(others=>'1');

begin

process(imm30)
	begin
	
		if(imm30(29) = '0') then 
			imm32 <= aux1 & imm30;
		else 
			imm32 <= aux2 & imm30;
		end if;
		
end process;

end Behavioral;


