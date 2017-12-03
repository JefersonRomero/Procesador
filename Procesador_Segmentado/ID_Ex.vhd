----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:14:10 11/27/2017 
-- Design Name: 
-- Module Name:    ID_Ex - Behavioral 
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

entity ID_Ex is
 port (
 PCI: in std_logic_vector (31 downto 0);--1
 rdi : in std_logic_vector (5 downto 0);--2
 aluopi : in std_logic_vector (4 downto 0);--3
 ii : in std_logic;--4
 wrenrfi : std_logic;--5
 wrendmi : in std_logic;--6
 crs1i : in std_logic_vector(31 downto 0);--7
 crs2i : in std_logic_vector(31 downto 0);--8
 immi: in std_logic_vector(31 downto 0);--9
 rfsourcei : in std_logic_vector ( 1 downto 0);--10
 crdi : in std_logic_vector(31 downto 0);--11
 clk : in std_logic;
 
 PCO : out std_logic_vector(31 downto 0);--1
 wrendmo : out std_logic;--6
 immo: out std_logic_vector(31 downto 0);--9
 crdo : out std_logic_vector (31 downto 0);--11
 crs1o : out std_logic_vector(31 downto 0);--7
 crs2o : out std_logic_vector(31 downto 0);--8
 wrenrfo : out std_logic;--5
 io : out std_logic;--4
 aluopo : out std_logic_vector(4 downto 0);--3
 rfsourceo : out std_logic_vector ( 1 downto 0);--10
 rdo : out std_logic_vector(5 downto 0)--2
 );

end ID_Ex;
	
architecture arq_ID of ID_Ex is

begin
	process(clk)
	begin
	if(rising_edge(clk)) then
	wrenrfo <= wrenrfi;
	io <= ii;
   rfsourceo <= rfsourcei;
	PCO <= PCI;
	wrendmo <= wrendmi ;
   rdo <= rdi;
	immo <= immi;
	aluopo<=aluopi;
	crdo<=crdi;
	crs1o<=crs1i;
	crs2o<=crs2i;
	end if;
end process;
end arq_ID;

