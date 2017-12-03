----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:25:36 11/27/2017 
-- Design Name: 
-- Module Name:    windows_manager - Behavioral 
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
use IEEE.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity windows_manager is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           cwp : in  STD_LOGIC_VECTOR (4 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  rst : in std_logic;
           ncwp : out  STD_LOGIC_VECTOR (4 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0));
end windows_manager;


architecture arq_wm of windows_manager is

SIGNAL r1 : integer range 0 to 39 ;
SIGNAL r2 : integer range 0 to 39 ;
SIGNAL r3 : integer range 0 to 39 ;
begin
 process(rs1,rs2,rd,op,op3,cwp,rst)
 begin
-- if ( rst = '1') then
--	 ncwp <= "00000";
--	 nrs1 <= "000000";
--	 nrs2 <= "000000";
--	 nrd <= "000000";
-- else
   if ( op = "10" and op3 = "111100") then ---save
			ncwp <= cwp - "00001";
			if(rd >= "11000" and rd <= "11111") then
				r3 <= conv_integer(rd) ;
			elsif ((conv_integer(rd) >= 16) and (conv_integer(rd) <= 23) ) then
				r3 <= conv_integer(rd);
			elsif (conv_integer(rd) >= 8 and conv_integer(rd) <= 15) then
				r3 <= conv_integer(rd);
			else
				r3 <= conv_integer(rd);
			end if;
	elsif ( op = "10" and op3 = "111101") then --restore
			ncwp <= cwp + "00001";
			if(rd >= "11000" and rd <= "11111") then
				r3 <= conv_integer(rd) - 16;
			elsif ((conv_integer(rd) >= 16) and (conv_integer(rd) <= 23) ) then
				r3 <= conv_integer(rd) + 16;
			elsif (conv_integer(rd) >= 8 and conv_integer(rd) <= 15) then
				r3 <= conv_integer(rd) + 16;
			else
				r3 <= conv_integer(rd);
			end if;
	else
		ncwp <= cwp;
		if(rd >= "11000" and rd <= "11111") then
			r3 <= conv_integer(rd) - (conv_integer(cwp) * 16);
		elsif ((conv_integer(rd) >= 16) and (conv_integer(rd) <= 23) ) then
			r3 <= conv_integer(rd) + (conv_integer(cwp) * 16);
		elsif (conv_integer(rd) >= 8 and conv_integer(rd) <= 15) then
			r3 <= conv_integer(rd) + (conv_integer(cwp) * 16);
		else
			r3 <= conv_integer(rd);
		end if;
   end if;	 
	
	
	 if(rs1 >= "11000" and rs1 <= "11111") then
	  r1 <= conv_integer(rs1) - (conv_integer(cwp) * 16);
	 elsif (rs1 >= "10000" and rs1 <= "10111" ) then
	 r1 <= conv_integer(rs1) + (conv_integer(cwp) * 16);
	 elsif (rs1 >= "01000" and rs1 <= "01111") then
	 r1 <= conv_integer(rs1) + (conv_integer(cwp) * 16);
	 else
	 r1 <= conv_integer(rs1);
	 end if;

	 if(conv_integer(rs2) >= 24 and conv_integer(rs2) <= 31) then
	  r2 <= conv_integer(rs2) - (conv_integer(cwp) * 16);
	 elsif (conv_integer(rs2) >= 16 and conv_integer(rs2) <= 23 ) then
	 r2 <= conv_integer(rs2) + (conv_integer(cwp) * 16);
	 elsif (conv_integer(rs2) >= 8 and conv_integer(rs2) <= 15) then
	 r2 <= conv_integer(rs2) + (conv_integer(cwp) * 16);
	 else
	 r2 <= conv_integer(rs2);
	 end if;
	 
	 
    
--end if;--cierra rst
end process;

	 nrs1 <=CONV_STD_LOGIC_VECTOR(r1,6);
	 nrs2 <=CONV_STD_LOGIC_VECTOR(r2,6);
	 nrd <=CONV_STD_LOGIC_VECTOR(r3,6);
end arq_wm;


