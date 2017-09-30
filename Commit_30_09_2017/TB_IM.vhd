--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:11:29 09/30/2017
-- Design Name:   
-- Module Name:   C:/Users/lenovo/Desktop/Arquitectura/Clase_26_09_2017/Inicio_Procesador/TB_IM.vhd
-- Project Name:  Inicio_Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IM
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
 
ENTITY TB_IM IS
END TB_IM;
 
ARCHITECTURE behavior OF TB_IM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IM
    PORT(
         Address : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         instruccion : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';

 	--Outputs
   signal instruccion : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IM PORT MAP (
          Address => Address,
          rst => rst,
          instruccion => instruccion
        );

     
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		rst <= '1';
		Address <= "00000000000000000000000000000000";
      wait for 100 ns;	
		rst <= '0';
		Address <= "00000000000000000000000000000001";
      wait for 100 ns;	
		rst <= '0';
		Address <= "00000000000000000000000000000010";
      wait for 100 ns;
		rst <= '0';
		Address <= "00000000000000000000000000000011";
      wait for 100 ns;
		rst <= '0';
		Address <= "00000000000000000000000000000100";
      wait for 100 ns;
		rst <= '0';
		Address <= "00000000000000000000000000000101";
      wait for 100 ns;
		rst <= '0';
		Address <= "00000000000000000000000000000111";
      wait for 100 ns;
      

      -- insert stimulus here 

      wait;
   end process;

END;
