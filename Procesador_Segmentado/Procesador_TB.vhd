--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:30:31 11/27/2017
-- Design Name:   
-- Module Name:   C:/Users/lenovo/Desktop/Procesador segmentado/Segmentado/Procesador_TB.vhd
-- Project Name:  Segmentado
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Procesador_monociclo_SI
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
 
ENTITY Procesador_TB IS
END Procesador_TB;
 
ARCHITECTURE behavior OF Procesador_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Procesador_monociclo_SI
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         data_out : OUT  std_logic_vector(31 downto 0);
         pc_act : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(31 downto 0);
   signal pc_act : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador_monociclo_SI PORT MAP (
          rst => rst,
          clk => clk,
          data_out => data_out,
          pc_act => pc_act
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for clk_period/2;
		rst <= '1';
		wait for clk_period/2;
		rst <= '0';
		
      

      -- insert stimulus here 

      wait;
   end process;

END;
