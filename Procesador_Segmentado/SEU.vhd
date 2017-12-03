----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:24:25 11/27/2017 
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
    Port ( simm : in  STD_LOGIC_VECTOR (12 downto 0);
           imm : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture arq_SEU of SEU is

begin

process (simm)
begin
    if (simm(12) = '1') then
	    imm <="1111111111111111111" & simm;
	 else
	    imm <="0000000000000000000" & simm;
	 
	 end if;

end process;


end arq_SEU;
