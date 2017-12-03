----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:18:33 11/27/2017 
-- Design Name: 
-- Module Name:    Procesador_monociclo_SI - Behavioral 
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

entity Procesador_monociclo_SI is

    Port ( 
	 rst : in STD_LOGIC;
	 clk : in STD_LOGIC;
	 data_out : out std_logic_vector(31 downto 0);
	 pc_act : out std_logic_vector (31 downto 0)
	 );

end Procesador_monociclo_SI;

architecture arq_SI of Procesador_monociclo_SI is



COMPONENT nPC
		
PORT(
				
			  PC_IN : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           PC_OUT : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
	
END COMPONENT;

COMPONENT InstructionMemory

		
PORT(
				--clk : in STD_LOGIC;
			  address : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           outInstruction : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
	
END COMPONENT;

COMPONENT IF_ID 
Port (PCI : in std_logic_vector (31 downto 0);
   InstructionI : in std_logic_vector (31 downto 0);
	clk : in std_logic;
	PCO : out std_logic_vector(31 downto 0);
   InstructionO : out std_logic_vector (31 downto 0)

		);

end COMPONENT;

COMPONENT PC
	
PORT(
				
			  PC_IN : in  STD_LOGIC_VECTOR (31 downto 0);
           CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           PC_OUT : out  STD_LOGIC_VECTOR (31 downto 0));
	
END COMPONENT;

COMPONENT Register_file	
PORT(
				
			  rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           rd : in  STD_LOGIC_VECTOR (5 downto 0);
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
			  --clk : in std_logic; -- PRUEBA 2
			  wrenrf : in std_logic;
           CRs1 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Crd : out std_logic_vector ( 31 downto 0);
           CRs2 : out  STD_LOGIC_VECTOR (31 downto 0)
			  
			  );
			  	
	

END COMPONENT;

COMPONENT Control_Unit

		
PORT(
				
			  OP : in  STD_LOGIC_VECTOR (1 downto 0);
			  op2 : in std_logic_vector(2 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  nzvc : in std_logic_vector (3 downto 0);
			  cond : in std_logic_vector (3 downto 0);
			  pc_source : out std_logic_VECTOR(1 downto 0);
			  rd_source : out STD_LOGIC;
			  wrenrf : out std_logic;
			  wrendm : out std_logic;
			  srcdatatoreg : out std_logic_vector(1 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (4 downto 0)
			  --clk : in std_logic --prueba 1
			 );
	
	

END COMPONENT;

COMPONENT windows_manager
		
PORT(
				
			  rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           cwp : in  STD_LOGIC_VECTOR (4 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  --rd_source : in std_logic;
			  rst : in std_logic;
           ncwp : out  STD_LOGIC_VECTOR (4 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0)
			  
			  );
	
	

END COMPONENT;


COMPONENT sumador

		
PORT(
				
			  A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           sumout : out  STD_LOGIC_VECTOR (31 downto 0)
			  
			 );
	
	

END COMPONENT;

component ID_Ex ----------- PIPELINE 2/4
 port (
 PCI: in std_logic_vector (31 downto 0);
 rdi : in std_logic_vector (5 downto 0);
 aluopi : in std_logic_vector (4 downto 0);
 ii : in std_logic;
 wrenrfi : std_logic;
 wrendmi : in std_logic;
  crs1i : in std_logic_vector(31 downto 0);
 crs2i : in std_logic_vector(31 downto 0);
 immi: in std_logic_vector(31 downto 0);
 crdi : in std_logic_vector ( 31 downto 0);
 rfsourcei : in std_logic_vector ( 1 downto 0);
 clk : in std_logic;
 
 PCO : out std_logic_vector(31 downto 0);
 wrendmo : out std_logic;
 immo: out std_logic_vector(31 downto 0);
 crdo : out std_logic_vector(31 downto 0);
  crs1o : out std_logic_vector(31 downto 0);
 crs2o : out std_logic_vector(31 downto 0);
 wrenrfo : out std_logic;
 io : out std_logic;
 aluopo : out std_logic_vector(4 downto 0);
 rfsourceo : out std_logic_vector ( 1 downto 0);
 rdo : out std_logic_vector(5 downto 0)
 );

end component;

COMPONENT ALU

		
PORT(
				
			  op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  ALUOP : in  STD_LOGIC_VECTOR (4 downto 0);
           ALUResult : out  STD_LOGIC_VECTOR (31 downto 0);
			  c : in std_logic
			 );
	

END COMPONENT;
COMPONENT SEU
	
PORT(
				
			  simm : in  STD_LOGIC_VECTOR (12 downto 0);
           imm : out  STD_LOGIC_VECTOR (31 downto 0));
	
END COMPONENT;
COMPONENT mux
	
PORT(
			  Crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           imm : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           mux_out : out  STD_LOGIC_VECTOR (31 downto 0));
	
END COMPONENT;

COMPONENT PSR

		
PORT(
				
			  psrm : in  STD_LOGIC_VECTOR (3 downto 0);
			  clk : in std_logic;
			  ncwp : in std_logic_vector(4 downto 0);
			  rst : in std_logic;
			  cwp : out std_logic_vector(4 downto 0);
			  nzvc : out std_logic_vector(3 downto 0);
           c : out  STD_LOGIC
			  
			 );
	
	

END COMPONENT;
COMPONENT PSR_modifier

		
PORT(
				
			  ALUResult : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALUOP : in  STD_LOGIC_VECTOR (4 downto 0);
           rst : in std_logic;
           psrm : out  STD_LOGIC_VECTOR (3 downto 0)
			  
			 );
END COMPONENT;

component Exe_mem is ------------------ PIPELINE 3/4
 port (
 PCI : in std_logic_vector(31 downto 0);
 aluri : in std_logic_vector(31 downto 0);
 wrenrfi : in std_logic;
 rfsourcei : in std_logic_vector (1 downto 0);
 wrendmi : in std_logic;
  rdi : in std_logic_vector(5 downto 0);
 crdi : in std_logic_vector(31 downto 0);
 clk : in std_logic;
 
 PCO : out std_logic_vector (31 downto 0 );
 aluro : out std_logic_vector(31 downto 0);
 rfsourceo : out std_logic_vector (1 downto 0);
  rdo : out std_logic_vector(5 downto 0);
 crdo : out std_logic_vector(31 downto 0);
 wrenrfo : out std_logic;
 wrendmo : out std_logic
 );
 end component;

component Data_memory is
    Port ( wrendm : in  STD_LOGIC;
           address : in  STD_LOGIC_VECTOR (31 downto 0);
			  crd : in std_logic_vector (31 downto 0);
			  rst : in std_logic;
			  clk : in std_logic;
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component muxdwr is
    Port ( data_out : in  STD_LOGIC_VECTOR (31 downto 0);
           aluresult : in  STD_LOGIC_VECTOR (31 downto 0);
			  
           pc : in STD_LOGIC_VECTOR(31 downto 0);
           srcdatatoreg : in  STD_LOGIC_VECTOR(1 downto 0);
           mux_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component mux_pc is
    Port ( 
	 pc_source : in std_logic_vector (1 downto 0);
	 npc : in std_logic_vector(31 downto 0);
	 pc : in std_logic_vector ( 31 downto 0);
	 imm : in std_logic_vector (29 downto 0);
	 aluresult : in std_logic_vector (31 downto 0);
	 mpc_out : out std_logic_vector (31 downto 0)
	 
	 );
	 
end component;
	
component Memwb is ------------------ PIPELINE 4/4
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

end component;	
	
	
component rd_mux is
Port (
       wm_out : in std_logic_vector(5 downto 0);
		 rd_source : in std_logic;
		 cwp : in std_logic_vector(4 downto 0);
		 mux_out : out std_logic_vector(5 downto 0)
		 
		 );

end component;	
	
SIGNAL npc_out : std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;
SIGNAL pc_out1 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;
SIGNAL pc_out2 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;--pipe1
SIGNAL pc_out3 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;--pipe2
SIGNAL pc_out4 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;--pipe3
SIGNAL pc_out5 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;--pipe4

SIGNAL im_out1 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;
SIGNAL im_out : std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;--pipe1

SIGNAL rf_1 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;
SIGNAL cr1 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;
SIGNAL cr2 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;
SIGNAL rf_2: std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;
SIGNAL rf_3: std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;
SIGNAL mux_out : std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;
SIGNAL ini : std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;
SIGNAL proc_out : std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;
SIGNAL seu_out: std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;
SIGNAL seu_out1: std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;
SIGNAL cu_out  : std_logic_vector (4 downto 0) := "00000";
SIGNAL cu_out1  : std_logic_vector (4 downto 0) := "00000";
SIGNAL psr_mod_out: std_logic_vector(3 downto 0) := "0000" ;
SIGNAL icc_sig: std_logic_vector(3 downto 0) := "0000" ;
SIGNAL nrs1 : std_logic_vector(5 downto 0) := "000000" ;
SIGNAL nrs2: std_logic_vector(5 downto 0) := "000000" ;
SIGNAL nrd: std_logic_vector(5 downto 0) := "000000" ;

SIGNAL rd1: std_logic_vector(5 downto 0) := "000000" ;
SIGNAL rd2: std_logic_vector(5 downto 0) := "000000" ;
SIGNAL rd3: std_logic_vector(5 downto 0) := "000000" ;

SIGNAL rd_mux_out : std_logic_vector (5 downto 0) := "000000";
SIGNAL ncwp: std_logic_vector(4 downto 0) := "00000" ;
SIGNAL cwp: std_logic_vector(4 downto 0) := "00000" ;
SIGNAL psr_out : std_logic := '0' ;

SIGNAL dm_out : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";	
SIGNAL dm_out1 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
SIGNAL alu_out : std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;	
SIGNAL alu_out1 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;
SIGNAL alu_out2 : std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;	
SIGNAL crd1: std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;
SIGNAL crd2: std_logic_vector(31 downto 0) := "00000000000000000000000000000000" ;

SIGNAL wrdm : std_logic;	
SIGNAL wrrf : std_logic;
SIGNAL wrdm1 : std_logic;	
SIGNAL wrrf1 : std_logic;
SIGNAL wrdm2 : std_logic;	
SIGNAL wrrf2 : std_logic;
SIGNAL wrrf3 : std_logic;

SIGNAL rds_sig : std_logic;
SIGNAL pcs_sig : STD_LOGIC_VECTOR(1 downto 0):= "00";
	
SIGNAL srcdata : STD_LOGIC_VECTOR(1 downto 0) := "00";
SIGNAL srcdata1 : STD_LOGIC_VECTOR(1 downto 0) := "00";--pipe2
SIGNAL srcdata2 : STD_LOGIC_VECTOR(1 downto 0) := "00";--pipe3
SIGNAL srcdata3 : STD_LOGIC_VECTOR(1 downto 0) := "00";--pipe4

SIGNAL i: std_logic;	

begin

	
	insnPC: PC PORT MAP(	
	PC_IN => ini,		--viene de mux pc
	CLK=> CLK,			
	RST => RST,		
	PC_OUT => npc_out-- va a PC		
	);
	
	insPC: PC PORT MAP(	
	PC_IN => npc_out,		-- viene de npc
	CLK=> CLK,			
	RST => RST,			
	PC_OUT => pc_out1-- va a IF_ID		
	);
	

	
	Muxpc: mux_pc PORT MAP(	
			pc_source =>pcs_sig,-- viene de CU
			npc =>npc_out, -- viene de npc
			pc =>pc_out1,-- viene de pc
			imm =>im_out(29 downto 0),-- viene de IM
			aluresult => alu_out1,-- viene de alu
			mpc_out  => ini	-- va a npc
	);
		
	IM: InstructionMemory PORT MAP(			
	address => pc_out1,-- viene de PC		
   reset => rst,	
	outInstruction => im_out1-- va a RF, seu, etc		
	);
	
	PIPELINE1 : IF_ID Port MAP(---------------- PIPELINE 1/4
	PCI => pc_out1,
	PCO =>pc_out2,
  
	clk =>CLK,
	
	InstructionI => im_out1,
   InstructionO =>im_out
	);

	WM : windows_manager	 PORT MAP(		
	        rs1 =>im_out(18 downto 14),-- viene de IM
           rs2 =>im_out(4 downto 0),
           rd =>im_out(29 downto 25),
           op => im_out(31 downto 30),
			  op3 =>im_out(24 downto 19),-- viene de IM
			  rst => rst,
			  cwp =>cwp,-- viene de psr
           ncwp =>ncwp,-- va a psr
           nRs1 =>nrs1,--va a RF
           nRs2 =>nrs2,--va a rf
			  nrd => nrd-- va a mux rd
		);
	Muxrd: rd_mux PORT MAP(	
			wm_out =>nrd,-- viene de WM
			rd_source =>rds_sig,-- viene de CU
			cwp =>cwp,-- viene de psr
			mux_out =>rd_mux_out--va a rf
	);
	
   RF : Register_file PORT MAP(		------------------ REGISTER FILE
	        rs1 =>nrs1,-- viene de WM
           rs2 =>nrs2,-- viene de WM
           rd =>rd3,--- viene de rd mux
			  wrenrf => wrrf2, -- viene de cu
           dwr =>proc_out,---viene de mux dwr
           rst =>rst,
			  --clk => clk, -- PRUEBA 2
           CRs1 =>rf_1,--va a ALU
			  Crd => rf_3,--va a DM
           CRs2 =>rf_2--va a mux op2
		);
	
	CU: Control_Unit PORT MAP(----------------- CONTROL UNIT
			OP =>im_out(31 downto 30),-- viene de IM
			op2 => im_out(24 downto 22),--viene de IM
			OP3 =>im_out(24 downto 19),-- viene de IM
			cond =>im_out(28 downto 25),--viene de IM
			nzvc =>psr_mod_out,--viene de psr --psr_mod_out(funciona mul) o icc_sig?
         --clk => clk, -- PRUEBA 1
			pc_source=>pcs_sig,--- al mux de pc
			rd_source=>rds_sig,--- al mu de rd
			wrenrf =>wrrf,---- al RF
			wrendm =>wrdm,--- al DM
			srcdatatoreg=>srcdata,---a el mux de dwr
			ALUOP=> cu_out1-- va a todo lado LOL
	);
	
	Inst_SEU: SEU PORT MAP(------------EXTENSION DE SIGNO
     
			  simm =>im_out(12 downto 0),-- viene de IM
           imm =>seu_out1 -- va a mux op2
	);
	
   pipeline2 : ID_Ex  port map (-------------------- PIPELINE 2/4
	PCI=>pc_out2,
	PCO =>pc_out3 ,
	
	
	ii =>im_out(13) ,
	io => i,
	
	crs1i =>rf_1 ,
	crs1o =>cr1 ,
	
	crs2i =>rf_2 ,
	crs2o =>cr2 ,
	
	wrenrfi => wrrf,
	wrenrfo => wrrf1,
	
	immi=> seu_out1,
	immo=> seu_out,
	
	rfsourcei => srcdata,
	rfsourceo => srcdata1,
	
	crdi => rf_3,
	crdo => crd1,
	
	clk =>CLK ,
 
	wrendmi => wrdm,
	wrendmo => wrdm1,
	
	aluopi => cu_out1,
	aluopo =>cu_out ,
	
	rdi => rd_mux_out,
	rdo =>rd1 
 );
	
	insmux: mux PORT MAP(
				Crs2 =>cr2,--- viene de RF
				imm =>seu_out,-- viene de SEU
				i =>i,-- viene deIM
				mux_out =>mux_out-- va a ALU, psr modifier
	);
	
	PSRM : PSR_modifier PORT MAP(
           ALUResult =>alu_out,-- viene de alu
           Crs1 =>cr1,-- viene de RF
           Crs2 =>mux_out,-- viene de mux op2
			  rst => rst,
           ALUOP =>cu_out,-- viene de CU
           psrm =>psr_mod_out-- va a psr
	);
	
	insPSR : PSR PORT MAP(
			psrm =>psr_mod_out,--viene de psr modifier
			ncwp => ncwp,-- viene de WM
			clk => clk,
			rst => rst,
			cwp => cwp,-- va a WM, mux rd
			nzvc => icc_sig,-- va a CU
			c =>psr_out -- va a ALU
	);
	
	insALU : ALU PORT MAP(
			op1 => cr1,-- viene de RF
			op2 => mux_out,-- viene de mux op2
			ALUOP => cu_out,-- viene de CU
			c => psr_out,-- viene de psr
			ALUResult =>alu_out1-- va a DM, mux dwr, psr modifier, mux pc,...
	);
	
	data_out<= proc_out;

 PIPELINE3 : Exe_mem  port MAP (------------------------ PIPELINE 3/4
		PCI => pc_out3,
		PCO  => pc_out4,
 
		aluri => alu_out1,
		aluro  => alu_out,
 
		rfsourcei  => srcdata1,
		rfsourceo  => srcdata2,
 
		rdi => rd1,
		rdo => rd2,
 

		wrenrfi  =>wrrf1 ,
		wrenrfo  => wrrf2,
 
		crdi => crd1,
		crdo =>crd2,
  
		clk  => clk,
 
		wrendmi  => wrdm1,
		wrendmo  => wrdm2
 );
 
 
	DM : Data_memory PORT MAP(
           wrendm =>wrdm2,--de cu
           address =>alu_out,-- de alu
			  rst => rst,
			  crd => crd2,-- viene de RF
			  clk => clk,
           data_out => dm_out -- a mux dwr
	);


 PIPELINE4 : Memwb port map ( -------------------- PIPELINE 4/4
		rdi => rd2,
		rdo  => rd3,
 
		PCI  => pc_out4,
		PCO  => pc_out5,
 
		dmi  => dm_out,
		dmo  => dm_out1,
 
		clk  => CLK,
 
		wrenrfi => wrrf2,
		wrenrfo  => wrrf3,
 
		aluri  => alu_out,
		aluro  => alu_out2,

		rfsourcei  => srcdata2,
		rfsourceo => srcdata3
 );

	
	Inst_muxdwr : muxdwr PORT MAP(
           data_out => dm_out1,--- de DM
           aluresult => alu_out2,-- de alu
			  pc =>pc_out5 ,-- de pc
           srcdatatoreg => srcdata3, -- de cu
           mux_out => proc_out -- a RF
	);
	
	
	pc_act<= pc_out1;


end arq_SI;





