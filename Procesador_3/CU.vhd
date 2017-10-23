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
		 NZVC : in STD_LOGIC_VECTOR (3 DOWNTO 0); --NZVC
		 Cond : in STD_LOGIC_VECTOR (3 DOWNTO 0);
		 we : out STD_LOGIC;
		 RFDEST : out STD_LOGIC;
		 RFSOURCE : out STD_LOGIC_VECTOR (1 DOWNTO 0);
		 WRENMEM : out STD_LOGIC;
		 PCSOURCE : out STD_LOGIC_VECTOR (1 DOWNTO 0);
       salida : out  STD_LOGIC_VECTOR (5 downto 0)); --AluOp
end CU;

architecture Behavioral of CU is



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
			
			
			
			
			if(op = "11") then
				case op3 is
					
					when "000000" => --load
						salida <= "000000";
					
					when "000100" => --Store
						salida <= "000000";
						
					when others =>
						Salida <= (others=>'1'); --error
				end case;
			end if;
			
			
		end process;	
		
		
	
	process(op, op3, NZVC, Cond)
		begin
		
			if(op = "11") then --formato3 de load y store
			
				if (op3 = "000100") then --store
					WRENMEM <= '1';
					we <= '0';
				else	--sino, es load
					WRENMEM <= '0';
					we <= '1';
				end if;
			else
				WRENMEM <= '0';
				we <= '1';
			end if;
			
			--proceso para mux2
			if (op = "01")then --es un call
				PCSOURCE <= "00";
				we <= '1';
			elsif (op = "00") then --es un branch
				PCSOURCE <= "01";
				we <= '0';
			elsif (op = "10") then 
				if(op3 = "111000") then --jumpl
					PCSOURCE <= "11"; --es la alu
					we <= '0';
				else --aritmetica
					PCSOURCE <= "10";
					we <= '1';
				end if;
				
			end if;
			
			
			
			---------------------------------------------------------
			--Pagina 178 The SPARC Architecture Manual: Version 8
			---------------------------------------------------------
			
			
			--proceso de saltos
			
			if(op = "00") then --formato2
				
				case Cond is
				
					when 	"1000" => --BA
						PCSOURCE <= "01"; --jumpl, pasa la alu
												
					when 	"0000" => --BN
						PCSOURCE <= "10"; --sigue contando normal
						
					when 	"1001" => --BNE
						if((not NZVC(2))='1') then --not z
							PCSOURCE <= "01"; --branch
						else 
							PCSOURCE <= "10"; --cuenta normal
						end if;
						
					when 	"0001" => --BE
						if(NZVC(2)='1') then --z
							PCSOURCE <= "01";
						else 
							PCSOURCE <= "10";
						end if;
						
					when 	"1010" => --BG
						if(( not(NZVC(2) or (NZVC(3) xor NZVC(1)) ) ) ='1') then --not(z or (n xor v))
							PCSOURCE <= "01";
						else 
							PCSOURCE <= "10";
						end if;
						
					when 	"0010" => --BLE
						if((NZVC(2) or (NZVC(3) xor NZVC(1)) )='1') then --z or (n xor v)
							PCSOURCE <= "01";
						else 
							PCSOURCE <= "10";
						end if;
						
					when 	"1011" => --BGE
						if(( not(NZVC(3) xor NZVC(1)) )='1') then --not(n xor v)
							PCSOURCE <= "01";
						else 
							PCSOURCE <= "10";
						end if;
						
					when 	"0011" => --BL
						if(( NZVC(3) xor NZVC(1) )='1') then --n xor v
							PCSOURCE <= "01";
						else 
							PCSOURCE <= "10";
						end if;
						
					when 	"1100" => --BGU
						if(( not(NZVC(0) or NZVC(2)) )='1') then --not(c or z)
							PCSOURCE <= "01";
						else 
							PCSOURCE <= "10";
						end if;
						
					when 	"0100" => --BLEU
						if(( NZVC(0) or NZVC(2) )='1') then --c or z
							PCSOURCE <= "01";
						else 
							PCSOURCE <= "10";
						end if;
						
					when 	"1101" => --BCC
						if(( not(NZVC(0)) )='1') then --not c
							PCSOURCE <= "01";
						else 
							PCSOURCE <= "10";
						end if;
						
					when 	"0101" => --BCS
						if((NZVC(0))='1') then --c 
							PCSOURCE <= "01";
						else 
							PCSOURCE <= "10";
						end if;
						
					when 	"1110" => --BPOS
						if(( not(NZVC(3)) )='1') then --not n
							PCSOURCE <= "01";
						else 
							PCSOURCE <= "10";
						end if;
						
					when 	"0110" => --BNEG
						if((NZVC(3))='1') then --n
							PCSOURCE <= "01";
						else 
							PCSOURCE <= "10";
						end if;
						
					when 	"1111" => --BVC
						if(( not(NZVC(1)))='1') then --not v
							PCSOURCE <= "01";
						else 
							PCSOURCE <= "10";
						end if;
						
					when 	"0111" => --BVS
						if((NZVC(1))='1') then --v
							PCSOURCE <= "01";
						else 
							PCSOURCE <= "10";
						end if;
						
					when others =>
						PCSOURCE <= (others=>'1'); --error
					
					end case;
						
			end if;
			
	end process;
	
	process(op)
		begin
			if (op="10") then --aritmeticas
				RFSOURCE <= "01";
				RFDEST <= '0';
			elsif (op="11") then --load
				RFSOURCE <= "00";
				RFDEST <= '0';
			elsif (op="01") then --call
				RFSOURCE <= "10";
				RFDEST <= '1';
			else	
				RFDEST <= '0';
			end if;
	end process;


end Behavioral;

