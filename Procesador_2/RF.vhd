----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:34:58 10/03/2017 
-- Design Name: 
-- Module Name:    RF - Behavioral 
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
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RF is
    Port ( RS1 : in  STD_LOGIC_VECTOR(4 DOWNTO 0);
           RS2 : in  STD_LOGIC_VECTOR(4 DOWNTO 0);
           RD : in  STD_LOGIC_VECTOR(4 DOWNTO 0);
           DWR : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           Rst_RF : in  STD_LOGIC;
           CRS1 : out  STD_LOGIC_VECTOR(31 DOWNTO 0);
           CRS2 : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
end RF;

architecture Behavioral of RF is

type reg is array (0 to 31) of std_logic_vector (31 downto 0);

signal MyReg : reg := (others => x"00000000");



begin
process(RS1,RS2,RD,DWR,Rst_RF)
Begin
	MyReg(0) <= x"00000000";
	if Rst_RF = '0' then
			if(RD/="00000")then
				Myreg(conv_integer(RD)) <= DWR; 
			end if;
			
			CRS1 <= Myreg(conv_integer(RS1));
			CRS2 <= Myreg(conv_integer(RS2));
		else 
			CRS1 <= (others=>'0');
			CRS2 <= (others=>'0');
		end if;
	end process;


end Behavioral;

