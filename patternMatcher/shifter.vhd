library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;

entity shifter is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
			  alt 	: std_logic;
           output : out  STD_LOGIC_VECTOR (255 downto 0));
end shifter;

architecture arch of shifter is
	signal mah_data: std_logic_vector(255 downto 0);
	signal alt_old: std_logic;
begin
	
	process(clk, reset) is
	begin
		if(reset='1') then
			mah_data <= (others => '0');
		elsif(rising_edge(clk) and alt /= alt_old) then
			alt_old <= alt;
			mah_data <= mah_data(247 downto 0) & data_in;
		end if;
	end process;
	
	output <= mah_data;

end arch;

