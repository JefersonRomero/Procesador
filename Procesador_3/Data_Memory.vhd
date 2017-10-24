----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:45:49 10/23/2017 
-- Design Name: 
-- Module Name:    Data_Memory - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Data_Memory is
    Port ( cRd : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           AluResult : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           Wrenmem : in  STD_LOGIC;
			  Reset : in  STD_LOGIC;
           DataToMemory : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
end Data_Memory;

architecture Behavioral of Data_Memory is

type reg is array (0 to 31) of std_logic_vector (31 downto 0);

signal myReg: reg; 

begin

process(Reset, Wrenmem)
Begin
	if(Reset='1') then
		myReg <= (others => x"00000000");
	else
		if(Wrenmem = '1') then --puede escribir, es un store
				Myreg(conv_integer(AluResult(4 downto 0))) <= cRd;
			end if;
		end if;
		
		DataToMemory <= Myreg(conv_integer(AluResult(4 downto 0)));
			
end process;

	

end Behavioral;

