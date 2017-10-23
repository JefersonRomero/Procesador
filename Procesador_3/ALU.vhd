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
		 Carry : in STD_LOGIC;
       Salida : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

-- ADD : 000000
-- SUB : 000001
-- AND : 000010
-- ANDN (op1 and not op2) : 000011
-- OR : 000100
-- ORN : 000101
-- XOR : 000110
-- XNOR : 000111


begin
process(ALUOP, Oper1,Oper2)
	begin
		case ALUOP is
		
			when 	"000000" => 
				Salida <= Oper1 + Oper2; --Add
										
			when 	"000001" => 
				Salida <= Oper1 - Oper2; --Sub
				
			when 	"000010" => 
				Salida <= Oper1 and Oper2; --And
										
			when 	"000011" => 
				Salida <= Oper1 and not Oper2; --Andn
			
			when 	"000100" => 
				Salida <= Oper1 or Oper2; --Or
										
			when 	"000101" => 
				Salida <= Oper1 or not Oper2; --Orn
			
			when 	"000110" => 
				Salida <= Oper1 xor Oper2; --Xor
										
			when 	"000111" => 
				Salida <= Oper1 xnor Oper2; --Xnor
			
			when "001000" => 
				Salida <= Oper1 and Oper2; --Andcc
				
			when "001001" => 
				Salida <= Oper1 nand Oper2; --Nandcc
				
			when "001010" => 
				Salida <= Oper1 or Oper2; --Orcc
				
			when "001011" => 
				Salida <= Oper1 nor Oper2; --Norcc
				
			when "001100" => 
				Salida <= Oper1 xor Oper2; --Xorcc
				
			when "001101" => 
				Salida <= Oper1 xnor Oper2; -- Xnorcc
				
			when "001110" => 
				Salida <= Oper1 + Oper2; --Addc
				
			when "001111" => 
				Salida <= Oper1 + Oper2 + Carry; --Addx
				
			when "010000" => 
				Salida <= Oper1 + Oper2 + Carry; --Addxcc
				
			when "010001" => 
				Salida <= Oper1 - Oper2; --Subcc
				
			when "010010" => 
				Salida <= Oper1 - Oper2 - Carry; --Subx
				
			when "010011" => 
				Salida <= Oper1 - Oper2 - Carry; --Subxcc
				
			when "010100" =>
				Salida <= to_stdlogicvector(to_bitvector(Oper1) sll conv_integer(Oper2)); --SLL
				
			when "010101" => 
				Salida <= to_stdlogicvector(to_bitvector(Oper1) srl conv_integer(Oper2)); --SRL
				
										
			
			when others =>
				Salida <= (others=>'1'); --error
			
			end case;

	end process;	


end Behavioral;

