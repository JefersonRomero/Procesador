library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use std.textio.all;

entity instructionMemory is
    Port ( 
			  --clk : in STD_LOGIC;
			  address : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           outInstruction : out  STD_LOGIC_VECTOR (31 downto 0));
end instructionMemory;
architecture arqInstructionMemory of instructionMemory is

	type rom_type is array (0 to 63) of std_logic_vector (31 downto 0);
		
	impure function InitRomFromFile (RomFileName : in string) return rom_type is
		FILE RomFile : text open read_mode is RomFileName;
		variable RomFileLine : line;
		variable temp_bv : bit_vector(31 downto 0);
		variable temp_mem : rom_type;
		begin
			for I in rom_type'range loop
				readline (RomFile,RomFileLine);
			   --exit when endfile(RomFile) ;
				read(RomFileLine,temp_bv);
				temp_mem(i) := to_stdlogicvector(temp_bv);
			end loop;
		return temp_mem;
	end function;
	
   signal instructions : rom_type := InitRomFromFile("mult.data");
	-- programff -> mi programa
	---mul -> multiplicacion
	---
begin
--reset,address, instructions)
	process(reset,address, instructions)--clk)
	begin
	--0 restore 
	--1 or r0,2,r17
   --2 or r0,31,r23
	--3 or r0,16,r16
   --4 or r0,12,r18
	--5 add r16,r17,r19  --18
	--6 add r16,r18,r20 --28
	--7 sub r16,r17,r21 --14
	--8 sub r16,1,r22
	--9 or r0,15,r24
	--10 subcc r16,17,r0
	--11 add r16,1,r0 
	--12 or r0,7,r17
	--store r8,r0,4
	--13 subcc r16,16,r4
	--LOAD r16,r0,4
	--14 subcc r16,16,r0
	
		--if(rising_edge(clk))then
			if(reset = '1')then
				outInstruction <= (others=>'0');
			else
				outInstruction <= instructions(conv_integer(address(5 downto 0)));
			end if;
		--end if;
	end process;
end arqInstructionMemory;


