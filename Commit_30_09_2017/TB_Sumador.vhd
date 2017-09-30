--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:53:59 09/30/2017
-- Design Name:   
-- Module Name:   C:/Users/lenovo/Desktop/Arquitectura/Clase_26_09_2017/Inicio_Procesador/TB_Sumador.vhd
-- Project Name:  Inicio_Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sumador
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
 
ENTITY TB_Sumador IS
END TB_Sumador;
 
ARCHITECTURE behavior OF TB_Sumador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sumador
    PORT(
         Dato : IN  std_logic_vector(31 downto 0);
         Salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Dato : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Salida : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador PORT MAP (
          Dato => Dato,
          Salida => Salida
        );

   
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      Dato <= "00000000000000000000000000000000";
		wait for 100 ns;	
		Dato <= "00000000000000000000000000000001";
		wait for 100 ns;	
		Dato <= "00000000000000000000000000000010";
		wait for 100 ns;	
		Dato <= "00000000000000000000000000000011";
		wait for 100 ns;	
		Dato <= "00000000000000000000000000000100";
		wait for 100 ns;	
		Dato <= "00000000000000000000000000000101";
		wait for 100 ns;	
		Dato <= "00000000000000000000000000000110";
		wait for 100 ns;	
		Dato <= "00000000000000000000000000000111";
		wait for 100 ns;	
		Dato <= "00000000000000000000000000001000";
		wait for 100 ns;	
		Dato <= "00000000000000000000000000001001";
		wait for 100 ns;	 
		Dato <= "00000000000000000000000000001010";
		wait for 100 ns;	
		Dato <= "00000000000000000000000000001011";
		
            

      wait;
   end process;

END;
