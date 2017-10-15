----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:18:19 09/21/2017 
-- Design Name: 
-- Module Name:    Registro_32 - Behavioral 
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

entity Registro_32 is
    Port ( CLK : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
           dataIn : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
           DataOut : out  STD_LOGIC_VECTOR (31 DOWNTO 0));
end Registro_32;

architecture Behavioral of Registro_32 is

begin

PROCESS(CLK, rst)
BEGIN
	IF(rst = '1') then
		DataOut <= (others => '0');
	
	ELSIF (Rising_edge(CLK)) THEN
		DataOut<= dataIn;
		end if;
	end process;
	


end Behavioral;

