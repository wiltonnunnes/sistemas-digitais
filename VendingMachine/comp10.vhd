library ieee;
use ieee.std_logic_1164.all;

entity comp10 is
	port (
		a9, a8, a7, a6, a5, a4, a3, a2, a1, a0, b9, b8, b7, b6, b5, b4, b3, b2, b1, b0 : in std_logic;
		AltB : out std_logic
	);
end comp10;

architecture ckt of comp10 is

	signal wires1, wires2, wires3 : std_logic_vector(8 downto 0);

	component comp
		port (
			a, b, in_gt, in_eq, in_lt : in std_logic;
			out_gt, out_eq, out_lt : out std_logic
		);
	end component;

begin
	g1 : comp port map (a9, b9, '0', '1', '0', wires1(8), wires2(8), wires3(8));
	g2 : comp port map (a8, b8, wires1(8), wires2(8), wires3(8), wires1(7), wires2(7), wires3(7));
	g3 : comp port map (a7, b7, wires1(7), wires2(7), wires3(7), wires1(6), wires2(6), wires3(6));
	g4 : comp port map (a6, b6, wires1(6), wires2(6), wires3(6), wires1(5), wires2(5), wires3(5));
	g5 : comp port map (a5, b5, wires1(5), wires2(5), wires3(5), wires1(4), wires2(4), wires3(4));
	g6 : comp port map (a4, b4, wires1(4), wires2(4), wires3(4), wires1(3), wires2(3), wires3(3));
	g7 : comp port map (a3, b3, wires1(3), wires2(3), wires3(3), wires1(2), wires2(2), wires3(2));
	g8 : comp port map (a2, b2, wires1(2), wires2(2), wires3(2), wires1(1), wires2(1), wires3(1));
	g9 : comp port map (a1, b1, wires1(1), wires2(1), wires3(1), wires1(0), wires2(0), wires3(0));
	g10 : comp port map (a0, b0, wires1(0), wires2(0), wires3(0), open, open, AltB);
end ckt;