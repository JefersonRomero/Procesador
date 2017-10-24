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
USE IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
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
           OUT_PROCESADOR : out  STD_LOGIC_VECTOR (31 DOWNTO 0));
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
			Dato1 : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
			Dato2 : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
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
		 Carry : in STD_LOGIC;
       Salida : out  STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT;	
	

COMPONENT CU
Port ( op : in  STD_LOGIC_VECTOR (1 downto 0); --formato
       op3 : in  STD_LOGIC_VECTOR (5 downto 0); --operacion
		 NZVC : in STD_LOGIC_VECTOR (3 DOWNTO 0); --NZVC
		 Cond : in STD_LOGIC_VECTOR (3 DOWNTO 0);
		 we : out STD_LOGIC;
		 RFDEST : out STD_LOGIC;
		 RFSOURCE : out STD_LOGIC_VECTOR (1 DOWNTO 0);
		 WRENMEM : out STD_LOGIC;
		 PCSOURCE : out STD_LOGIC_VECTOR (1 DOWNTO 0);
       salida : out  STD_LOGIC_VECTOR (5 downto 0)); --AluOp
	END COMPONENT;	
	

COMPONENT MUX
PORT(	
		 i : in  STD_LOGIC;
       IMM32 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
       Crs2 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
       Salida : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
	END COMPONENT;	
	
COMPONENT MUX_2
Port ( Suma_Call : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
       Suma_Branch : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
       Suma_Normal : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
       AluResultado : in  STD_LOGIC_VECTOR (31 DOWNTO 0);
       Mux_Out_2 : out  STD_LOGIC_VECTOR (31 DOWNTO 0);
       PCSource : in  STD_LOGIC_VECTOR(1 DOWNTO 0));
	END COMPONENT;		 


COMPONENT MUX_3	
Port ( RD : in  STD_LOGIC_VECTOR (5 downto 0);
       RFDEST : in  STD_LOGIC;
       nRD : out  STD_LOGIC_VECTOR (5 downto 0));
	END COMPONENT;	


COMPONENT MUX_4
Port ( DataToMem : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
       AluResult : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
       PC : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
       RFSource : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
       Mux_out_4 : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
	END COMPONENT;
	

COMPONENT Data_Memory
Port ( cRd : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
       AluResult : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
       Wrenmem : in  STD_LOGIC;
		 Reset : in  STD_LOGIC;
       DataToMemory : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
	END COMPONENT;
	
	
COMPONENT RF
 Port ( RS1 : in  STD_LOGIC_VECTOR(5 DOWNTO 0);
        RS2 : in  STD_LOGIC_VECTOR(5 DOWNTO 0);
        RD : in  STD_LOGIC_VECTOR(5 DOWNTO 0);
        DWR : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
        Rst_RF : in  STD_LOGIC;
		  We : in STD_LOGIC;
		  CRd : out STD_LOGIC_VECTOR(31 DOWNTO 0);
        CRS1 : out  STD_LOGIC_VECTOR(31 DOWNTO 0);
        CRS2 : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
	END COMPONENT;	

	
COMPONENT SEU13
PORT(	
		 IMM13 : in  STD_LOGIC_VECTOR(12 DOWNTO 0);
       SEUIMM : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
	END COMPONENT;	
	
	
COMPONENT SEU22	
Port ( IMM22 : in  STD_LOGIC_VECTOR(21 DOWNTO 0);
       SEUIMM : out  STD_LOGIC_VECTOR(31 DOWNTO 0));
	END COMPONENT;

	
COMPONENT SEU30
Port ( imm30 : in  STD_LOGIC_VECTOR (29 downto 0);
       imm32 : out  STD_LOGIC_VECTOR (31 downto 0));
	END COMPONENT;	 

	
COMPONENT PSR_Modifier
 Port ( crs1 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
		  crs2 : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
		  Aluop : in  STD_LOGIC_VECTOR(5 DOWNTO 0);
		  Aluresult : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
		  Reset : in  STD_LOGIC;
		  NZVC : out  STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;


COMPONENT PSR
 Port ( NZVC : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
		  Reset : in  STD_LOGIC;
		  Clk : in  STD_LOGIC;
		  nCWP: in STD_LOGIC;
		  CWP: out STD_LOGIC;
		  icc: out STD_LOGIC_VECTOR(3 DOWNTO 0);
		  C : out  STD_LOGIC);
END COMPONENT;


COMPONENT Windows_Manager
Port ( RS1 : in  STD_LOGIC_VECTOR (4 DOWNTO 0);
	    RS2 : in  STD_LOGIC_VECTOR (4 DOWNTO 0);
	    RD : in  STD_LOGIC_VECTOR (4 DOWNTO 0);
	    OP : in  STD_LOGIC_VECTOR (1 DOWNTO 0);
       OP3 : in  STD_LOGIC_VECTOR (5 DOWNTO 0);
	    CWP : in  STD_LOGIC;
	    nRS1 : out  STD_LOGIC_VECTOR (5 DOWNTO 0);
	    nRS2 : out  STD_LOGIC_VECTOR (5 DOWNTO 0);
	    nRD : out  STD_LOGIC_VECTOR (5 DOWNTO 0);
	    nCWP : out  STD_LOGIC);
END COMPONENT;			  
			  
	
-- Programe Counter	
SIGNAL AUX_nPC: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_PC: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";

-- Sumadores 
SIGNAL AUX_SUMADOR1: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_SUMADOR2: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_SUMADOR3: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";

-- Instruction Memory
SIGNAL AUX_IM: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";

--Register File
SIGNAL AUX_CRS1: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_CRS2: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_CRD: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";

-- Alu
SIGNAL AUX_Salida_ALU: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";

--Control Unit
SIGNAL AUX_Salida_CU: STD_LOGIC_VECTOR(5 DOWNTO 0):="000000";
SIGNAL AUX_RFDEST: STD_LOGIC := '0';
SIGNAL AUX_RFSOURCE: STD_LOGIC_VECTOR (1 DOWNTO 0);
SIGNAL AUX_WRENMEM: STD_LOGIC := '0';
SIGNAL AUX_WE: STD_LOGIC := '0';
SIGNAL AUX_PCSource : STD_LOGIC_VECTOR(1 DOWNTO 0);

-- SEU'2
SIGNAL AUX_SEU13: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_SEU22: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_SEU30: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";

--Multiplexores
SIGNAL AUX_Salida_MUX: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_Salida_MUX2: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";
SIGNAL AUX_Salida_MUX3: STD_LOGIC_VECTOR(5 DOWNTO 0):="000000";
SIGNAL AUX_Salida_MUX4: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";



--PSR MODIFIER
SIGNAL AUX_NZVC: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";

-- PSR
SIGNAL AUX_icc: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
SIGNAL AUX_C: STD_LOGIC := '0';
SIGNAL AUX_CWP: STD_LOGIC := '0';


-- Windows Manager
SIGNAL AUX_NCWP: STD_LOGIC := '0';
SIGNAL AUX_nRS1: STD_LOGIC_VECTOR(5 DOWNTO 0) := "000000";
SIGNAL AUX_nRS2: STD_LOGIC_VECTOR(5 DOWNTO 0) := "000000";
SIGNAL AUX_nRD: STD_LOGIC_VECTOR(5 DOWNTO 0) := "000000";


-- Data Memory
SIGNAL AUX_Data_Memory: STD_LOGIC_VECTOR(31 DOWNTO 0):="00000000000000000000000000000000";




begin



nPC: Registro_32 PORT MAP(
	CLK => CLKIn,
	rst => rstIn,
	dataIn => AUX_Salida_MUX2, 
   DataOut =>AUX_nPC
);

PC: Registro_32 PORT MAP(
	CLK => CLKIn,
	rst => rstIn,
	dataIn => AUX_nPC, 
   DataOut =>AUX_PC
);

Module_Seu22: SEU22 PORT MAP(
	IMM22 => AUX_IM(21 DOWNTO 0),
   SEUIMM => AUX_SEU22
);

Module_Seu30: SEU30 PORT MAP(
	imm30 => AUX_IM(29 DOWNTO 0),
   imm32 => AUX_SEU30
);

SUM1: Sumador PORT MAP(
	Dato1 => AUX_PC,
	Dato2 => "00000000000000000000000000000001",
	Salida => AUX_SUMADOR1
);

SUM2: Sumador PORT MAP(
	Dato1 => AUX_PC,
	Dato2 => AUX_SEU22,
	Salida => AUX_SUMADOR2
);

SUM3: Sumador PORT MAP(
	Dato1 => AUX_PC,
	Dato2 => AUX_SEU30,
	Salida => AUX_SUMADOR3
);


Multiplexor2: MUX_2 PORT MAP(
	Suma_Call => AUX_SUMADOR3,
   Suma_Branch => AUX_SUMADOR2,
   Suma_Normal => AUX_SUMADOR1,
   AluResultado => AUX_Salida_ALU,
   Mux_Out_2 => AUX_Salida_MUX2,
   PCSource => AUX_PCSource
);

Instrution_Memory: IM PORT MAP(
	Address => AUX_PC,
   rst => rstIn,
   instruccion => AUX_IM
);

WindowsManeger: Windows_Manager PORT MAP(
	 RS1 => AUX_IM (18 downto 14), 
	 RS2 => AUX_IM (4 downto 0), 
	 RD => AUX_IM (29 downto 25),  
	 OP => AUX_IM (31 downto 30), 
	 OP3 => AUX_IM (24 downto 19) , 
	 CWP => AUX_CWP, 
	 nRS1 => AUX_nRS1,
	 nRS2 =>	AUX_nRS2,
	 nRD => AUX_nRD, 
	 nCWP => AUX_NCWP  

);

Multiplexor3: MUX_3 PORT MAP(
	 RD => AUX_nRD,
    RFDEST => AUX_RFDEST,
    nRD => AUX_Salida_MUX3
);


Register_File: RF PORT MAP(
	RS1 => AUX_nRS1,
   RS2 => AUX_nRS2,
   RD => AUX_Salida_MUX3, 
   DWR => AUX_Salida_MUX4, 
	We => AUX_WE,
   Rst_RF => rstIn, 
   CRS1 => AUX_CRS1, 
   CRS2 => AUX_CRS2, 
	CRd => AUX_CRD
);

Control_Unit: CU PORT MAP(
	op => AUX_IM (31 downto 30),
   op3 => AUX_IM (24 downto 19) ,
	NZVC => AUX_icc,
	Cond => AUX_IM (28 downto 25) , 
	we => AUX_WE,
	RFDEST => AUX_RFDEST,
	RFSOURCE => AUX_RFSOURCE,
	WRENMEM => AUX_WRENMEM,
	PCSOURCE => AUX_PCSource,
   salida => AUX_Salida_CU
);

Module_Seu13: SEU13 PORT MAP(
	IMM13 => AUX_IM (12 downto 0),
   SEUIMM => AUX_SEU13
);


Multiplexor: MUX PORT MAP(
	i => AUX_IM(13),
   IMM32 => AUX_SEU13 , 
   Crs2 => AUX_CRS2, 
   Salida => AUX_Salida_MUX
);


Arithmetic_Logic_Unit: ALU PORT MAP(
	Oper1 => AUX_CRS1,
   Oper2 => AUX_Salida_MUX,
   ALUOP => AUX_Salida_CU,
	Carry => AUX_C,
   Salida => AUX_Salida_ALU
);


PSRModifier : PSR_MODIFIER PORT MAP(
	crs1 => AUX_CRS1,
   crs2 => AUX_Salida_MUX,
   Aluop => AUX_Salida_CU,
   Aluresult => AUX_Salida_ALU,
   Reset => rstIn,
   NZVC => AUX_NZVC
);

PSR_MODULE: PSR PORT MAP(
	NZVC => AUX_NZVC,
   Reset => rstIn,
   Clk => CLKIn,
	nCWP => AUX_NCWP,
   CWP => AUX_CWP,
	icc => AUX_icc,
   C => AUX_C
);


DataMemory: Data_Memory PORT MAP(
	cRd => AUX_CRD,
   AluResult => AUX_Salida_ALU,
   Wrenmem => AUX_WRENMEM,
	Reset => rstIn,
   DataToMemory => AUX_Data_Memory
);

Multiplexor4: MUX_4 PORT MAP(
	DataToMem => AUX_Data_Memory,
   AluResult => AUX_Salida_ALU,
   PC => AUX_PC,
   RFSource => AUX_RFSOURCE,
   Mux_out_4 => AUX_Salida_MUX4
);

OUT_PROCESADOR <= AUX_Salida_ALU;

end Behavioral;

