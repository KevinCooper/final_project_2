LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY match_tester IS
END match_tester;
 
ARCHITECTURE behavior OF match_tester IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pattern
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         test : IN  std_logic_vector(7 downto 0);
			alt  : in 	std_logic;
         bad : OUT  std_logic;
			debug: out STD_LOGIC_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal test : std_logic_vector(7 downto 0) := (others => '0');
	signal alt	: std_logic := '0';
 	--Outputs
   signal bad : std_logic;
	signal debug: std_logic_vector(7 downto 0);
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pattern PORT MAP (
          clk => clk,
          reset => '0',
          test => test,
			 alt => alt,
          bad => bad,
			 debug => debug
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
		reset <= '1';
		wait for clk_period;
		reset <= '0';
		alt <= '0';
      wait for 100 ns;	
		test <= x"62";
		alt <= not alt;
		wait for clk_period;
		test <= x"61";
		alt <= not alt;
		wait for clk_period;
		test <= x"64";
		alt <= not alt;
		wait for clk_period;
		test <= x"61";
		alt <= not alt;
		wait for clk_period;
		test <= x"70";
		alt <= not alt;
		wait for clk_period;
		test <= x"70";
		alt <= not alt;
		wait for clk_period;
		test <= x"6c";
		alt <= not alt;
		wait for clk_period;
		test <= x"65";
		alt <= not alt;
		wait for clk_period;
		test <= x"00";
		wait for clk_period;
		test <= x"00";
		wait for clk_period;
		test <= x"00";
		wait for clk_period;
		test <= x"00";
		wait for clk_period;
		test <= x"00";
		wait for clk_period;
		test <= x"00";
		wait for clk_period;
		test <= x"00";
		wait for clk_period;
		test <= x"00";
		wait for clk_period;
		test <= x"00";
		wait for clk_period;
		test <= x"00";
		wait for clk_period;
		test <= x"00";
		wait for clk_period;
		test <= x"00";
		wait for clk_period;
		test <= x"00";
		wait for clk_period;
		test <= x"00";
		for I in 0 to 1000 loop
			alt <= not alt;
			wait for clk_period;
		end loop;


      wait;
   end process;

END;
