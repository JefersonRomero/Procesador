----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:23:53 10/23/2017 
-- Design Name: 
-- Module Name:    MUX_4 - Behavioral 
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

entity MUX_4 is
    Port ( DataToMem : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           AluResult : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           PC : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           RFSource : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
           Mux_out_4 : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
end MUX_4;

architecture Behavioral of MUX_4 is

begin
process (RFSource,DataToMem,AluResult,PC) 
Begin
	if (RFSource="00") then --pasa el load
		Mux_out_4 <= DataToMem;
	elsif (RFSource="01") then --pasa aritmeticas
		Mux_out_4 <= AluResult;
	elsif (RFSource<="10") then
		Mux_out_4 <= PC; --pasa el call
	end if;
end process;


end Behavioral;

