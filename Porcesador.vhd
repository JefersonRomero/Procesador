----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:52:09 09/26/2017 
-- Design Name: 
-- Module Name:    Porcesador - Behavioral 
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

entity Porcesador is
    Port ( rst : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Address : out  STD_LOGIC_VECTOR (31 DOWNTO 0));
end Porcesador;

architecture Behavioral of Porcesador is

COMPONENT Registro_32
PORT(	
			CLK : in  STD_LOGIC;
			rst : in  STD_LOGIC;
         dataIn : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
         DataOut : out  STD_LOGIC_VECTOR (31 DOWNTO 0));
	END COMPONENT;
	
COMPONENT Sumador
PORT(
			Dato : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
         Salida : out  STD_LOGIC_VECTOR (31 DOWNTO 0));
	END COMPONENT;	
	

SIGNAL AUX_NUM1: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_NUM2: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_NUM3: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
	
begin



nPC: Registro_32 PORT MAP(
	CLK => CLK,
	rst => rst,
	dataIn => AUX_NUM3, 
   DataOut =>AUX_NUM1
);

PC: Registro_32 PORT MAP(
	CLK => CLK,
	rst => rst,
	dataIn => AUX_NUM1, 
   DataOut =>AUX_NUM2
);

SUM: Sumador PORT MAP(
	Dato => AUX_NUM2,
	Salida => AUX_NUM3
);

Address <= AUX_NUM3;

end Behavioral;

