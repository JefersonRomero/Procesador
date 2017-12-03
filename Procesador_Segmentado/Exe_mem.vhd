----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:13:21 11/27/2017 
-- Design Name: 
-- Module Name:    Exe_mem - Behavioral 
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

entity Exe_mem is
 port (
 PCI : in std_logic_vector(31 downto 0);
 aluri : in std_logic_vector(31 downto 0);
 wrenrfi : in std_logic;
 rfsourcei : in std_logic_vector (1 downto 0);
 wrendmi : in std_logic;
 clk : in std_logic;
 rdi : in std_logic_vector(5 downto 0);
 crdi : in std_logic_vector(31 downto 0);
 
 PCO : out std_logic_vector (31 downto 0 );
 aluro : out std_logic_vector(31 downto 0);
 rfsourceo : out std_logic_vector (1 downto 0);
  rdo : out std_logic_vector(5 downto 0);
 crdo : out std_logic_vector(31 downto 0);
 wrenrfo : out std_logic;
 wrendmo : out std_logic
 );

end Exe_mem;

architecture arq_Exe of Exe_mem is

begin
	process(clk)
	begin
	if(rising_edge(clk)) then
	rdo<= rdi;
	crdo<=crdi;
   wrendmo <= wrendmi;
	wrenrfo<=wrenrfi;
	PCO<=PCI;
   rfsourceo <= rfsourcei ;
	aluro<=aluri;
	end if;
end process;
end arq_Exe;


