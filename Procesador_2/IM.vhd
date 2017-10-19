----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:50:17 09/28/2017 
-- Design Name: 
-- Module Name:    IM - Behavioral 
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
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IM is
    Port ( Address : in  STD_LOGIC_vector(31 downto 0);
           rst : in  STD_LOGIC;
           instruccion : out  STD_LOGIC_vector(31 downto 0));
end IM;

architecture Behavioral of IM is

type rom_type is array (0 to 63) of std_logic_vector (31 downto 0); 
CONSTANT ROM :rom_type:=(X"82102005", X"A0103FF8", X"A2102004", X"B1286002", X"B3346001", X"81E81000",
                         X"A0006003", X"81E01000", X"80A02004", X"84400001", X"90100010", X"00000000",
                         X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", 
                         X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", 
                         X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", 
                         X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", 
                         X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", 
                         X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", 
                         X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", 
                         X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", X"00000000", 
                         X"00000000", X"00000000", X"00000000", X"00000000");

				 
								 							
begin
process(Address, rst)
begin
	if rst = '1' then
		instruccion <= (others => '0');
	else 
		instruccion <= ROM(conv_integer(Address(5 downto 0)));

	end if;
end process;


end Behavioral;

