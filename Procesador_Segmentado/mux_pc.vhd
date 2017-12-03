----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:11:14 11/27/2017 
-- Design Name: 
-- Module Name:    mux_pc - Behavioral 
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

entity mux_pc is
    Port ( 
	 pc_source : in std_logic_vector (1 downto 0);
	 npc : in std_logic_vector (31 downto 0);
	 pc : in std_logic_vector ( 31 downto 0);
	 imm : in std_logic_vector (29 downto 0);
	 aluresult : in std_logic_vector (31 downto 0);
	 mpc_out : out std_logic_vector (31 downto 0)
	 
	 );
end mux_pc;

architecture arq_mux_pc of mux_pc is

begin

process(pc_source,pc,aluresult,imm)
begin
  case (pc_source) is
   when "10" =>------ CALL --------
     if(imm(29) = '0') then
        mpc_out <= pc + ("00" & imm);
		else
			mpc_out <= pc + ("11" & imm);
		end if;  	
  when "00" =>-------- NORMAL-----
	 mpc_out <= npc+"00000000000000000000000000000001";
	 
  when "01" =>---------- JMPL-------------
	 mpc_out <= aluresult;
	 
  when others =>------------- BRANCHES ------------
	 if(imm(21) = '0') then
			mpc_out <= pc + ("0000000000" & imm(21 downto 0));
	 elsif (imm(21)='1') then
			mpc_out <= pc + ("1111111111" & imm(21 downto 0));
	 end if;
  end case;


end process;

end arq_mux_pc;



