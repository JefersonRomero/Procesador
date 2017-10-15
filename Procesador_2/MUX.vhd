----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:05:17 10/03/2017 
-- Design Name: 
-- Module Name:    MUX - Behavioral 
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

entity MUX is
    Port ( i : in  STD_LOGIC;
           IMM32 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           Crs2 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           Salida : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
end MUX;

architecture Behavioral of MUX is

begin
PROCESS (i, IMM32, Crs2) IS
       BEGIN
         CASE i IS
           WHEN '0' => Salida <= Crs2;
           WHEN '1' => Salida <= IMM32; 
           WHEN OTHERS => Salida <= (others => '0');
         END CASE;
END PROCESS;

end Behavioral;

