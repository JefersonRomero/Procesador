--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:06:59 10/03/2017
-- Design Name:   
-- Module Name:   C:/Users/lenovo/Desktop/Arquitectura/Clase_26_09_2017/Inicio_Procesador/TB_CU.vhd
-- Project Name:  Inicio_Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CU
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
 
ENTITY TB_CU IS
END TB_CU;
 
ARCHITECTURE behavior OF TB_CU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CU
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         salida : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CU PORT MAP (
          op => op,
          op3 => op3,
          salida => salida
        );

   
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      op<="10";
		op3<="000000"; --ADD
		wait for 100 ns;	
		
		op<="10";
		op3<="000001"; --SUB
		wait for 100 ns;
		
		op<="10";
		op3<="000010"; --AND
		wait for 100 ns;
		
		op<="10";
		op3<="000011"; --OR
		wait for 100 ns;
		
		op<="00";
		op3<="101011"; --NO EXISTE
		wait for 100 ns;
		
		

      -- insert stimulus here 

      wait;
   end process;

END;
