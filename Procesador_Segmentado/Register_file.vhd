----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:23:49 11/27/2017 
-- Design Name: 
-- Module Name:    Register_file - Behavioral 
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

entity Register_file is
    Port ( rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           rd : in  STD_LOGIC_VECTOR (5 downto 0);
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
			  --clk : in std_logic; -- PRUEBA 2
			  wrenrf : in std_logic;
           CRs1 : out  STD_LOGIC_VECTOR (31 downto 0);
			  CRd : out std_logic_vector (31 downto 0);
           CRs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end Register_file;

architecture arc_Register_file of Register_file is
type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);

SIGNAL RF : ram_type:= (others =>"00000000000000000000000000000000");


begin

process(rst, rd,rs1,rs2,dwr,wrenrf,RF)--,clk)
begin
    --if(rising_edge(clk))then-- BEGIN prueba 2
	 if (rst = '1') then
		CRs1 <= "00000000000000000000000000000000";
		CRs2 <= "00000000000000000000000000000000";
		RF(0)<="00000000000000000000000000000000";
		Crd <= "00000000000000000000000000000000";
	else
		CRs1 <= RF(conv_integer(rs1));
		CRs2 <= RF(conv_integer(rs2));
		crd <= RF(conv_integer(rd));
	   if (wrenrf='1') then
			if (rd /= 0) then
				RF(conv_integer(rd)) <= dwr;
			end if;
		end if;
	end if;
	--end if;-- END PRUEBA 2
end process;

end arc_Register_file;


