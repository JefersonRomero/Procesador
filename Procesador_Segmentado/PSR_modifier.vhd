----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:22:32 11/27/2017 
-- Design Name: 
-- Module Name:    PSR_modifier - Behavioral 
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

entity PSR_modifier is
    Port ( ALUResult : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  rst : in std_logic;
           ALUOP : in  STD_LOGIC_VECTOR (4 downto 0);
           psrm : out  STD_LOGIC_VECTOR (3 downto 0));
end PSR_modifier;

architecture arq_PSR_modifier of PSR_modifier is



begin
  process(crs1,Crs2,aluop,aluresult,rst)
  begin
  if(rst = '1') then
  psrm <= "0000" ;
  else
  case (ALUOP) is
  
  when "00111"=>
  
  psrm(3) <= aluresult(31);
  
  if(aluresult = "00000000000000000000000000000000" )then
  psrm(2) <= '1';
  
  else
  
  psrm(2) <= '0';
  
  end if ;
  
  psrm(1) <= (crs1(31) and(not crs2(31)) and ( not ALUResult(31)))or (( not crs1(31)) and (crs2(31) and ALUResult(31)));
 
 psrm(0)<=((not crs1(31)) and crs2(31)) or (ALUResult(31) and ((not crs1(31)) or crs2(31)));
  
  when "00101" =>
  
  psrm(3) <= aluresult(31);
  
  if(aluresult = "00000000000000000000000000000000" )then
  psrm(2) <= '1';
  
  else
  psrm(2) <= '0';
  
  end if ;
  psrm(1) <= (crs1(31) and(not crs2(31)) and ( not ALUResult(31)))or (( not crs1(31)) and crs2(31) and ALUResult(31));
  psrm(0)<=((not crs1(31)) and crs2(31)) or (ALUResult(31) and ((not crs1(31)) or crs2(31)));
  
  when "01000"  =>
  psrm(3) <= aluresult(31);
  
  if(aluresult = "00000000000000000000000000000000") then
  psrm(2) <= '1'; 
  else 
  psrm(2) <= '0';
  end if;
  
  psrm(1) <= (crs1(31) and crs2(31) and (not aluresult(31))) or ((not crs1(31)) and (not crs2(31)) and aluresult(31));
  psrm(0) <= (crs1(31) and crs2(31)) or ((not aluresult(31)) and (crs1(31) or crs2(31))); 
  
  when "01011"  =>
  psrm(3) <= aluresult(31);
  
  if(aluresult = "00000000000000000000000000000000") then
  psrm(2) <= '1'; 
  else 
  psrm(2) <= '0';
  end if;
  
  psrm(1) <= (crs1(31) and crs2(31) and (not aluresult(31))) or ((not crs1(31)) and (not crs2(31)) and aluresult(31));
  psrm(0) <= (crs1(31) and crs2(31)) or ((not aluresult(31)) and (crs1(31) or crs2(31)));  
  
  when "01100" =>
  psrm(3) <= aluresult(31);
  if (aluresult = "00000000000000000000000000000000") then
  psrm(2) <=  '1';
  else
  psrm(2) <= '0';
  end if;
  psrm(1) <= '0';
  psrm(0) <= '0';


  when "01101" =>
  psrm(3) <= aluresult(31);
  if (aluresult = "00000000000000000000000000000000") then
  psrm(2) <=  '1';
  else
  psrm(2) <= '0';
  end if;
  psrm(1) <= '0';
  psrm(0) <= '0';
  
  when "01110" =>
  psrm(3) <= aluresult(31);
  if (aluresult = "00000000000000000000000000000000") then
  psrm(2) <=  '1';
  else
  psrm(2) <= '0';
  end if;
  psrm(1) <= '0';
  psrm(0) <= '0';
  
  when others =>null;
  
  end case;
  end if;
  end process;
   
end arq_PSR_modifier;



