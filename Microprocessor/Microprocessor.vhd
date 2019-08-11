library ieee;
use ieee.std_logic_1164.all;

entity Microprocessor is
	port (
		SW : in std_logic_vector(3 downto 0);
		HEX0 : out std_logic_vector(6 downto 0)
	);
end Microprocessor;

architecture ckt of Microprocessor is

	component bcd_7segment
		port (
			bcd : in std_logic_vector(3 downto 0);
			output : out std_logic_vector(6 downto 0)
		);
	end component;
	
begin
	g1 : bcd_7segment port map (SW, HEX0);
end ckt;