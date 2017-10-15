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
-- ANDN : 000011
-- OR : 000100
-- ORN : 000101
-- XOR : 000110
-- XNOR : 000111
-- Andcc : 010001
-- Nandcc : 010101  
-- Orcc :	010010  
-- Norcc : 010110  
-- Xorcc : 010011  
-- Xnorcc : 010111  
-- Addcc : 010000  
-- Addx :	001000  
-- Addxcc : 011000  
-- Subcc : 010100  
-- Subx :	001100  
-- Subxcc : 011100  
-- SLL : 100101  
-- SRL :	100110 

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
												
					when "000101"	 => --Andn
						salida <= "000011";
					
					when "000010"	 => --or
						salida <= "000100";
												
					when "000110"	 => --orn
						salida <= "000101";
					
					when "000011"	 => --xor
						salida <= "000110";
												
					when 	"000111" => --xnor
						salida <= "000111";
					
					when "010001" => --Andcc
						salida <= "001000"; 
						
					when "010101" => --Nandcc
						salida <= "001001"; 
						
					when "010010" => --Orcc
						salida <= "001010"; 
						
					when "010110" => --Norcc
						salida <= "001011"; 
					
					when "010011" => --Xorcc
						salida <= "001100"; 
					
					when "010111" => --Xnorcc
						salida <= "001101"; 
					
					when "010000" => --Addcc
						salida <= "001110"; 
					
					when "001000" => --Addx
						salida <= "001111"; 
					
					when "011000" => --Addxcc
						salida <= "010000"; 
					
					when "010100" => --Subcc
						salida <= "010001"; 
					
					when "001100" => --Subx
						salida <= "010010"; 
					
					when "011100" => --Subxcc
						salida <= "010011"; 
					
					when "100101" => --SLL
						salida <= "010100"; 
					
					when "100110" => --SRL
						salida <= "010101"; 
					
					when others =>
						Salida <= (others=>'1'); --error
					
					end case;
			else
				salida <= (others=>'1'); --No existe
			end if;
			
			
		end process;	
	


end Behavioral;

