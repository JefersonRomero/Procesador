----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:59:22 11/27/2017 
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
    Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ALUOP : in  STD_LOGIC_VECTOR (4 downto 0);
			  c : in std_logic;
           ALUResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture arq_ALU of ALU is

begin

 process(ALUOP,op1,op2,c) 
   begin 
	
   case (ALUOP) is 
      -------------------aritmeticas-----------------
		when "00000" => --add--load--store--jmpl
		ALUResult <=op1+op2;
      
		when "00001" =>--sub
		ALUResult <=op1-op2;	
      
		when "00010" =>--or
		ALUResult <= op1 OR op2;
      
		when "00011" =>--and
		ALUResult <= op1 AND op2;
      
		when "00100" =>--xor
		ALUResult <= op1 XOR op2;
      
		when "00101" =>--subcc
		ALUResult <= op1-op2;
		
		when "00110" =>--subx
		ALUResult <= op1-op2-c;
		
		when "00111" =>--subxcc
		ALUResult <= op1-op2-c;
      
		when "01000" =>--addcc
		ALUResult <= op1+op2;
		
		when "01001" =>--addx
		ALUResult <= op1+op2+c;
		
		when "01011" =>--addxcc
		ALUResult <= op1+op2+c; 
      
		when "01100" =>--andcc
		ALUResult <= op1 and op2; 
      
		when "01101" =>--orcc
		ALUResult <= op1 or op2;
      
		when "01110" =>--xorcc
		ALUResult <= op1 xor op2; 
		
		when others =>
		ALUResult <="00000000000000000000000000000000";
   
	end case;

end process;

end arq_ALU;

