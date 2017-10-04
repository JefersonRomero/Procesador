----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:50:16 09/30/2017 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
Port ( Oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
       Oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
		 ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
       Salida : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is


-- ADD : 000000
-- SUB : 000001
-- AND : 000010
-- OR  : 000011


begin
process(ALUOP, Oper1,Oper2)
	begin
		case ALUOP is
		
			when 	"000000" => 
				Salida <= Oper1 + Oper2;
										
			when 	"000001" => 
				Salida <= Oper1 - Oper2;
				
			when 	"000010" => 
				Salida <= Oper1 and Oper2;
													
			when 	"000011" => 
				Salida <= Oper1 or Oper2;
										
			
			when others =>
				Salida <= (others=>'1'); --error
			
			end case;

	end process;	


end Behavioral;

