library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity pattern is
    Port ( 
	 clk  : in  STD_LOGIC;
	 reset: in  STD_LOGIC;
	 test : in  STD_LOGIC_VECTOR(7 downto 0);
	 alt  : in 	std_logic;
	 bad  : out std_logic;
	 debug: out std_logic_vector(7 downto 0)
	 );
end pattern;

architecture Behavioral of pattern is
	signal match_apple: std_logic;
	signal match_bad: std_logic;
	signal inter_data: std_logic_vector(255 downto 0);
begin

	shifty: entity work.shifter
		port map(
			clk => clk,
			reset => reset,	
			data_in => test,
			alt 	=> alt,
			output => inter_data
			);

	bad_matcher: entity work.bad_matcher
		port map(
			data_in => inter_data,
			match   => match_bad
		);
	apple_matcher: entity work.apple_matcher
		port map(
			data_in => inter_data,
			match   => match_apple
		);
		
		debug <= inter_data(255 downto 248);
		bad <= match_bad or match_apple;

end Behavioral;

