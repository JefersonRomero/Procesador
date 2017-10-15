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
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

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
           ALURESULT : out  STD_LOGIC_VECTOR (31 DOWNTO 0));
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

COMPONENT ALU
PORT(	
		 Oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
       Oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
		 ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
       Salida : out  STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT;	
	

COMPONENT CU
PORT(	
		 op : in  STD_LOGIC_VECTOR (1 downto 0); 
       op3 : in  STD_LOGIC_VECTOR (5 downto 0); 
       salida : out  STD_LOGIC_VECTOR (5 downto 0));
	END COMPONENT;	
	

COMPONENT MUX
PORT(	
		 i : in  STD_LOGIC;
       IMM32 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
       Crs2 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
       Salida : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
	END COMPONENT;	
	
	
COMPONENT RF
PORT(	
		 RS1 : in  STD_LOGIC_VECTOR(4 DOWNTO 0);
       RS2 : in  STD_LOGIC_VECTOR(4 DOWNTO 0);
       RD : in  STD_LOGIC_VECTOR(4 DOWNTO 0);
       DWR : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
       Rst_RF : in  STD_LOGIC;
       CRS1 : out  STD_LOGIC_VECTOR(31 DOWNTO 0);
       CRS2 : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
	END COMPONENT;	
	
COMPONENT SEU
PORT(	
		 IMM13 : in  STD_LOGIC_VECTOR(12 DOWNTO 0);
       SEUIMM : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
	END COMPONENT;	
	
SIGNAL AUX_nPC: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_PC: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_SUMADOR: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_IM: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_CRS1: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_CRS2: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_Salida_ALU: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_Salida_CU: STD_LOGIC_VECTOR(5 DOWNTO 0):="000000";
SIGNAL AUX_SEU: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_Salida_MUX: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";

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

Register_File: RF PORT MAP(
	RS1 => AUX_IM (18 downto 14), 
   RS2 => AUX_IM (4 downto 0), 
   RD => AUX_IM (29 downto 25), 
   DWR => AUX_Salida_ALU, 
   Rst_RF => rstIn, 
   CRS1 => AUX_CRS1, 
   CRS2 => AUX_CRS2 
);

Control_Unit: CU PORT MAP(
	op => AUX_IM (31 downto 30),
   op3 => AUX_IM (24 downto 19) ,
   salida => AUX_Salida_CU
);

Module_Seu: SEU PORT MAP(
	IMM13 => AUX_IM (12 downto 0),
   SEUIMM => AUX_SEU
);


Multiplexor: MUX PORT MAP(
	i => AUX_IM(13),
   IMM32 => AUX_SEU , 
   Crs2 => AUX_CRS2, 
   Salida => AUX_Salida_MUX
);


Arithmetic_Logic_Unit: ALU PORT MAP(
	Oper1 => AUX_CRS1,
   Oper2 => AUX_Salida_MUX,
   ALUOP => AUX_Salida_CU,
   Salida => AUX_Salida_ALU
);

ALURESULT <= AUX_Salida_ALU;

end Behavioral;

