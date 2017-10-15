--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:59:21 09/30/2017
-- Design Name:   
-- Module Name:   C:/Users/lenovo/Desktop/Arquitectura/Clase_26_09_2017/Inicio_Procesador/TB_Registro_32.vhd
-- Project Name:  Inicio_Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Registro_32
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
 
ENTITY TB_Registro_32 IS
END TB_Registro_32;
 
ARCHITECTURE behavior OF TB_Registro_32 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Registro_32
    PORT(
         CLK : IN  std_logic;
         rst : IN  std_logic;
         dataIn : IN  std_logic_vector(31 downto 0);
         DataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal rst : std_logic := '0';
   signal dataIn : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal DataOut : std_logic_vector(31 downto 0);

   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Registro_32 PORT MAP (
          CLK => CLK,
          rst => rst,
          dataIn => dataIn,
          DataOut => DataOut
        );

   
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		CLK <= '0';
      rst <= '1';
      dataIn <= "00000000000000000000000000000000";
		wait for 100 ns;	
		CLK <= '1';
      rst <= '0';
      dataIn <= "00000000000000000000000000000001";
		wait for 100 ns;
		CLK <= '0';
      rst <= '0';
      dataIn <= "00000000000000000000000000000001";
		wait for 100 ns;
		CLK <= '1';
      rst <= '0';
      dataIn <= "00000000000000000000000000000010";
		wait for 100 ns;
		CLK <= '0';
      rst <= '0';
      dataIn <= "00000000000000000000000000000010";
		wait for 100 ns;
		CLK <= '1';
      rst <= '0';
      dataIn <= "00000000000000000000000000000011";
		wait for 100 ns;
		CLK <= '0';
      rst <= '0';
      dataIn <= "00000000000000000000000000000011";
		wait for 100 ns;
		CLK <= '1';
      rst <= '0';
      dataIn <= "00000000000000000000000000000100";
		wait for 100 ns;
		CLK <= '0';
      rst <= '0';
      dataIn <= "00000000000000000000000000000100";
		wait for 100 ns;
		CLK <= '1';
      rst <= '1';
      dataIn <= "00000000000000000000000000000101";
		wait for 100 ns;
		CLK <= '0';
      rst <= '0';
      dataIn <= "00000000000000000000000000000100";
		wait for 100 ns;
		CLK <= '1';
      rst <= '0';
      dataIn <= "00000000000000000000000000000100";
      

      -- insert stimulus here 

      wait;
   end process;

END;
