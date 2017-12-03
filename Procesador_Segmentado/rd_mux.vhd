----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:23:09 11/27/2017 
-- Design Name: 
-- Module Name:    rd_mux - Behavioral 
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

entity rd_mux is
Port (
       wm_out : in std_logic_vector(5 downto 0);
		 rd_source : in std_logic;
		 cwp : in std_logic_vector(4 downto 0);
		 mux_out : out std_logic_vector(5 downto 0)
		 
		 );

end rd_mux;

architecture arq_rd_mux of rd_mux is

begin
process(rd_source,wm_out,cwp)
begin
  
  if(rd_source='1') then
  mux_out <= wm_out;
  else
  mux_out <=CONV_STD_LOGIC_VECTOR( 15 + (conv_integer(cwp)*16),6);
  end if ;
  
  
end process;

end arq_rd_mux;
