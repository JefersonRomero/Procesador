----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:16:28 10/21/2017 
-- Design Name: 
-- Module Name:    MUX_2 - Behavioral 
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

entity MUX_2 is
    Port ( Suma_Call : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
           Suma_Branch : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
           Suma_Normal : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
           AluResultado : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
           Mux_Out_2 : out  STD_LOGIC_VECTOR (31 DOWNTO 0);
           PCSource : in  STD_LOGIC_VECTOR(1 DOWNTO 0));
end MUX_2;

architecture Behavioral of MUX_2 is

begin
Process(Suma_Call, Suma_Branch, Suma_Normal, AluResultado, PCSource)
Begin

	if (PCSource="00") then
		Mux_Out_2 <= Suma_Call;
		
	elsif (PCSource="01") then 
		Mux_Out_2 <= Suma_Branch;
		
	elsif (PCSource="10") then
		Mux_Out_2 <= Suma_Normal;
		
	elsif (PCSource="11") then
		Mux_Out_2 <= AluResultado;
		
	end if;
end process;	

end Behavioral;

