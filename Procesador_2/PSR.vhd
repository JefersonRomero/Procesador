----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:31:35 10/15/2017 
-- Design Name: 
-- Module Name:    PSR - Behavioral 
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

entity PSR is
    Port ( NZVC : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
			  Reset : in  STD_LOGIC;
			  Clk : in  STD_LOGIC;
			  nCWP: in STD_LOGIC;
			  CWP: out STD_LOGIC;
           C : out  STD_LOGIC);
end PSR;

architecture Behavioral of PSR is

begin

	process(Clk)
	begin
		if rising_edge(Clk) then
			if Reset='1' then
				C <= '0';
				CWP <= '0';
			else
				C<=NZVC(0);
				CWP <= nCWP;
			end if;
		end if;
	end process;

end Behavioral;

