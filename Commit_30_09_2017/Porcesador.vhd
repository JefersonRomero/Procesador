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
    Port ( CLKIn : in  STD_LOGIC;
			  rstIn : in  STD_LOGIC;
           AddressOut : out  STD_LOGIC_VECTOR (31 DOWNTO 0));
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
	
COMPONENT IM
PORT(	
			Address : in  STD_LOGIC_vector(31 downto 0);
         rst : in  STD_LOGIC;
         instruccion : out  STD_LOGIC_vector(31 downto 0));
	END COMPONENT;
	

SIGNAL AUX_nPC: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_PC: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_SUMADOR: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_IM: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
	
begin



nPC: Registro_32 PORT MAP(
	CLK => CLKIn,
	rst => rstIn,
	dataIn => AUX_SUMADOR, 
   DataOut =>AUX_nPC
);

PC: Registro_32 PORT MAP(
	CLK => CLKIn,
	rst => rstIn,
	dataIn => AUX_nPC, 
   DataOut =>AUX_PC
);

SUM: Sumador PORT MAP(
	Dato => AUX_PC,
	Salida => AUX_SUMADOR
);

Instrution_Memory: IM PORT MAP(
	Address => AUX_PC,
   rst => rstIn,
   instruccion => AUX_IM
);

AddressOut <= AUX_IM;

end Behavioral;

