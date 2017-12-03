----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:39 11/27/2017 
-- Design Name: 
-- Module Name:    Memwb - Behavioral 
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

entity Memwb is
 port (
 rdi : in std_logic_vector(5 downto 0);
 wrenrfi : in std_logic;
 PCI : in std_logic_vector(31 downto 0);
 rfsourcei: in std_logic_vector(1 downto 0);
 aluri: in std_logic_vector(31 downto 0);
 dmi : in std_logic_vector ( 31 downto 0);
 clk : in std_logic;
 
 rdo : out std_logic_vector(5 downto 0);
 wrenrfo : out std_logic;
 dmo : out std_logic_vector(31 downto 0);
 aluro : out std_logic_vector(31 downto 0);
 PCO : out std_logic_vector (31 downto 0);
 rfsourceo: out std_logic_vector(1 downto 0)
 );

end Memwb;

architecture arq_MemWB of MemWB is

begin
	process(clk)
	begin
	if(rising_edge(clk)) then
   rfsourceo <= rfsourcei;
	rdo<= rdi;
	PCO<= PCI;
   wrenrfo<=wrenrfi;
   aluro<=aluri;
	dmo<=dmi;


	end if;
end process;
end arq_MemWB;




