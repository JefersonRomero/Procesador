----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:21:55 11/27/2017 
-- Design Name: 
-- Module Name:    PSR - Behavioral 
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

entity PSR is
    Port ( psrm : in  STD_LOGIC_VECTOR (3 downto 0);
	        CLK : in std_logic ;
			  rst : in std_logic;
			  ncwp : in std_logic_vector(4 downto 0);
           c : out  STD_LOGIC;
			  nzvc : out std_logic_vector (3 downto 0);
			  cwp : out std_logic_vector (4 downto 0));
end PSR;

architecture arq_PSR of PSR is

 SIGNAL reg_psr : std_logic_vector (31 downto 0) := "00000000000000000000000000000000" ;

begin
  process(psrm,clk,ncwp,rst)
  begin
  --if (rising_edge(CLK)) then
		if(rst = '1') then
			cwp <= "00000";
			c <= '0';
			reg_psr(23 downto 20)<= "0000";
			reg_psr(4 downto 0) <= "00000";
			nzvc <= "0000";
		else
			reg_psr(4 downto 0) <= ncwp;	
		if (rising_edge(CLK)) then
		 reg_psr(23 downto 20) <= psrm;
			cwp <= reg_psr(4 downto 0);
			c <= reg_psr(20);
			nzvc <= reg_psr(23 downto 20);
		end if;
  
  
  end if;
  end process;

end arq_PSR;



