library ieee;
use ieee.std_logic_1164.all;

entity register10 is
	port (
		I : in std_logic_vector(9 downto 0);
		clock, load : in std_logic;
		Q : out std_logic_vector(9 downto 0)
	);
end register10;

architecture ckt of register10 is

	signal wire1, wire2 : std_logic_vector(9 downto 0);

	component mux2x1
		port (
			i0, i1, s0 : in std_logic;
			d : out std_logic
		);
	end component;
	
	component ffd
		port (
			clk, d, p, c : in std_logic;
			q : out std_logic
		);
	end component; 

begin
	g1 : mux2x1 port map (I(0), wire2(0), load, wire1(0));
	g2 : ffd port map (clock, wire1(0), '1', '1', wire2(0));
	g3 : mux2x1 port map (I(1), wire2(1), load, wire1(1));
	g4 : ffd port map (clock, wire1(1), '1', '1', wire2(1));
	g5 : mux2x1 port map (I(2), wire2(2), load, wire1(2));
	g6 : ffd port map (clock, wire1(2), '1', '1', wire2(2));
	g7 : mux2x1 port map (I(3), wire2(3), load, wire1(3));
	g8 : ffd port map (clock, wire1(3), '1', '1', wire2(3));
	g9 : mux2x1 port map (I(4), wire2(4), load, wire1(4));
	g10 : ffd port map (clock, wire1(4), '1', '1', wire2(4));
	g11 : mux2x1 port map (I(5), wire2(5), load, wire1(5));
	g12 : ffd port map (clock, wire1(5), '1', '1', wire2(5));
	g13 : mux2x1 port map (I(6), wire2(6), load, wire1(6));
	g14 : ffd port map (clock, wire1(6), '1', '1', wire2(6));
	g15 : mux2x1 port map (I(7), wire2(7), load, wire1(7));
	g16 : ffd port map (clock, wire1(7), '1', '1', wire2(7));
	g17 : mux2x1 port map (I(8), wire2(8), load, wire1(8));
	g18 : ffd port map (clock, wire1(8), '1', '1', wire2(8));
	g19 : mux2x1 port map (I(9), wire2(9), load, wire1(9));
	g20 : ffd port map (clock, wire1(9), '1', '1', wire2(9));
	
	Q <= wire2;
end ckt;