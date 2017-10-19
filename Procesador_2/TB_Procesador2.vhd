--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:54:58 10/16/2017
-- Design Name:   
-- Module Name:   C:/Users/lenovo/Desktop/Inicio_Procesador/TB_Procesador2.vhd
-- Project Name:  Inicio_Procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Porcesador
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
 
ENTITY TB_Procesador2 IS
END TB_Procesador2;
 
ARCHITECTURE behavior OF TB_Procesador2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Porcesador
    PORT(
         CLKIn : IN  std_logic;
         rstIn : IN  std_logic;
         ALURESULT : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLKIn : std_logic := '0';
   signal rstIn : std_logic := '0';

 	--Outputs
   signal ALURESULT : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLKIn_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Porcesador PORT MAP (
          CLKIn => CLKIn,
          rstIn => rstIn,
          ALURESULT => ALURESULT
        );

   -- Clock process definitions
   CLKIn_process :process
   begin
		CLKIn <= '0';
		wait for CLKIn_period/2;
		CLKIn <= '1';
		wait for CLKIn_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 20 ns.
      wait for CLKIn_period/2;
		rstIn<='1';
      wait for CLKIn_period/2;
		rstIn<='0';

      -- insert stimulus here 

      wait;
   end process;

END;
