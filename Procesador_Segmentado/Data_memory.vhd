----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:03:18 11/27/2017 
-- Design Name: 
-- Module Name:    Data_memory - Behavioral 
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

entity Data_memory is
    Port ( wrendm : in  STD_LOGIC;
           address : in  STD_LOGIC_VECTOR (31 downto 0);
			  crd : in std_logic_vector (31 downto 0);
			  rst : in std_logic ;
			  clk : in std_logic ;
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end Data_memory;


architecture arq_data_memory of Data_memory is

type ram_type is array (0 to 63) of std_logic_vector (31 downto 0);

SIGNAL DM : ram_type:= (others =>"00000000000000000000000000000000");
  
begin
--wrendm,address,crd)---------
process(clk)--,rst)
	begin
		if(rising_edge(clk)) then 
		 if(rst='1') then
		   data_out <= "00000000000000000000000000000000";
			else
				if(wrendm = '1') then
					DM(conv_integer(address(5 downto 0))) <= crd;
				elsif (wrendm = '0') then
					data_out <= DM(conv_integer(address(5 downto 0)));
				end if;
			end if;
		end if;
	end process;

end arq_data_memory;



