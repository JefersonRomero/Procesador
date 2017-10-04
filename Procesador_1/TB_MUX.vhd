--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:08:54 10/03/2017
-- Design Name:   
-- Module Name:   C:/Users/lenovo/Desktop/Arquitectura/Clase_26_09_2017/Inicio_Procesador/TB_MUX.vhd
-- Project Name:  Inicio_Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX
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
 
ENTITY TB_MUX IS
END TB_MUX;
 
ARCHITECTURE behavior OF TB_MUX IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX
    PORT(
         i : IN  std_logic;
         IMM32 : IN  std_logic_vector(31 downto 0);
         Crs2 : IN  std_logic_vector(31 downto 0);
         Salida : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic := '0';
   signal IMM32 : std_logic_vector(31 downto 0) := (others => '0');
   signal Crs2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Salida : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
    
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX PORT MAP (
          i => i,
          IMM32 => IMM32,
          Crs2 => Crs2,
          Salida => Salida
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		i <= '1';
		IMM32 <= "00101011001010110010101100101011";
		Crs2  <= "00000000000000000000000000000010";
      wait for 100 ns;	
		
		i <= '0';
		IMM32 <= "00101011001010110010101100101011";
		Crs2  <= "00000000000000000000000000000010";
      wait for 100 ns;	
		
		i <= '1';
		IMM32 <= "11111111111111111111111111111111";
		Crs2  <= "00000000000000000000000000000010";
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
