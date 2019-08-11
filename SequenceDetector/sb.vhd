library ieee;
use ieee.std_logic_1164.all;

entity SB is
	port (
		clock, bi : in std_logic;
		bo	: out std_logic
	);
end SB;

architecture ckt of SB is

	signal e1, e0, n1, n0 : std_logic;

	component ffd
		port (
			clk, d, p, c : in std_logic;
			q : out std_logic
		);
	end component;

begin
	g1 : ffd port map (clock, n1, '1', '1', e1);
	g2 : ffd port map (clock, n1, '1', '1', e1);
	
	n1 <= (e1 and not bi) or (e0 and not bi);
	n0 <= not e1 and not e0 and not bi;
	bo <= e0;
end ckt;