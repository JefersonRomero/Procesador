----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:14:40 11/27/2017 
-- Design Name: 
-- Module Name:    IF_ID - Behavioral 
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

entity IF_ID is
Port (PCI : in std_logic_vector (31 downto 0);
      InstructionI : in std_logic_vector (31 downto 0);
	   clk : in std_logic;
		PCO : out std_logic_vector(31 downto 0);
      InstructionO : out std_logic_vector (31 downto 0)

		);

end IF_ID;

architecture arq_IF of IF_ID is

begin
	process(clk)
	begin
	if(rising_edge(clk)) then
   PCO <= PCI ;
	InstructionO <= InstructionI;
	end if;
	end process;
end arq_IF;

