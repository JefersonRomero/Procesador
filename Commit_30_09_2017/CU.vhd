----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:37:43 09/30/2017 
-- Design Name: 
-- Module Name:    CU - Behavioral 
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

entity CU is
Port ( op : in  STD_LOGIC_VECTOR (1 downto 0); --formato
       op3 : in  STD_LOGIC_VECTOR (5 downto 0); --operacion
       salida : out  STD_LOGIC_VECTOR (5 downto 0));
end CU;

architecture Behavioral of CU is

-- ADD : 000000
-- SUB : 000001
-- AND : 000010
-- OR  : 000011


begin
process(op, op3)
		begin
		
			if(op = "10") then --formato3
			
				case op3 is
				
					when 	"000000" => --Add
						salida <= "000000";
												
					when 	"000100" => --Sub
						salida <= "000001";
						
					when "000001"	 => -- And
						salida <= "000010";
												
					
					when "000010"	 => --or
						salida <= "000011";
												
								
					when others =>
						salida <= (others=>'1'); --error
					
					end case;
			else
				salida <= (others=>'1'); --No existe
			end if;
			
			
		end process;	
	


end Behavioral;

