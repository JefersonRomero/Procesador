----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:48:56 09/30/2017 
-- Design Name: 
-- Module Name:    SEU - Behavioral 
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

entity SEU is
    Port ( IMM13 : in  STD_LOGIC_VECTOR(12 DOWNTO 0);
           SEUIMM : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
end SEU;

architecture Behavioral of SEU is

--si el inmediato es negativo, rellena de unos, si no, rellena de ceros

CONSTANT  aux1: std_logic_vector(18 downto 0):=(others=>'0');
CONSTANT  aux2: std_logic_vector(18 downto 0):=(others=>'1');

begin

process(IMM13)
	begin
	
		if(IMM13(12) = '0') then 
			SEUIMM <= aux1 & IMM13;
		else 
			SEUIMM <= aux2 & IMM13;
		end if;
		
end process;


end Behavioral;

