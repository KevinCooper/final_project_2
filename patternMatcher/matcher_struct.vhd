library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity apple_matcher is
    Port ( data_in : in  STD_LOGIC_VECTOR (255 downto 0);
           match : out  STD_LOGIC);
end apple_matcher;

architecture arch of apple_matcher is
		signal word_one, word_two, word_three, word_four, word_five, word_six, word_seven, word_eight : std_logic_vector(7 downto 0);
begin
		word_one <= data_in(255 downto 248);
		word_two <= data_in(247 downto 240);
		word_three <= data_in(239 downto 232);
		word_four <= data_in(231 downto 224);
		word_five <= data_in(223 downto 216);
		word_six <= data_in(215 downto 208);
		word_seven <= data_in(207 downto 200);
		word_eight <= data_in(199 downto 192);
		
		match <= '1' when word_one=x"61" and word_two = x"70" and word_three = x"70" and word_four = x"6c" and word_five = x"65"
					else '0';	
end arch;

