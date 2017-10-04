--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:36:25 10/03/2017
-- Design Name:   
-- Module Name:   C:/Users/lenovo/Desktop/Arquitectura/Clase_26_09_2017/Inicio_Procesador/TB_SEU.vhd
-- Project Name:  Inicio_Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SEU
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_SEU IS
END TB_SEU;
 
ARCHITECTURE behavior OF TB_SEU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU
    PORT(
         IMM13 : IN  std_logic_vector(12 downto 0);
         SEUIMM : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal IMM13 : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal SEUIMM : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU PORT MAP (
          IMM13 => IMM13,
          SEUIMM => SEUIMM
        );

   
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		IMM13<= "0001000101010";
		wait for 100 ns;	
		IMM13<= "1111000101010";
		wait for 100 ns;	
		IMM13<= "0001000101010";
		wait for 100 ns;	
		IMM13<= "1111111111110";
		wait for 100 ns;	
      

      wait;
   end process;

END;
