----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:16:13 11/27/2017 
-- Design Name: 
-- Module Name:    muxdwr - Behavioral 
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

entity muxdwr is
    Port ( data_out : in  STD_LOGIC_VECTOR (31 downto 0);
           aluresult : in  STD_LOGIC_VECTOR (31 downto 0);
           srcdatatoreg : in  STD_LOGIC_VECTOR(1 downto 0);
			  pc : in STD_LOGIC_VECTOR(31 downto 0);
           mux_out : out  STD_LOGIC_VECTOR (31 downto 0));
end muxdwr;

architecture arq_muxdwr of muxdwr is

begin

process(data_out,aluresult,srcdatatoreg,pc)
begin
  if (srcdatatoreg="01") then
  mux_out <= data_out;
  elsif(srcdatatoreg="00") then
   mux_out<= aluresult;
	elsif (srcdatatoreg = "11") then
	mux_out <= pc;
	else
	mux_out <= (others =>'0');
  end if;


end process;

end arq_muxdwr;

