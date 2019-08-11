library ieee;
use ieee.std_logic_1164.all;

entity register4 is                                                                                                                                                                                                                                                                                                                                           
	port (
		I : in std_logic_vector(3 downto 0);
		clock, load : in std_logic;
		Q : out std_logic_vector(3 downto 0)
	);
end register4;

architecture ckt of register4 is

	signal wire1, wire2 : std_logic_vector(3 downto 0);

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
	g1 : mux2x1 port map (wire2(0), I(0), load, wire1(0));
	g2 : ffd port map (clock, wire1(0), '1', '1', wire2(0));
	g3 : mux2x1 port map (wire2(1), I(1), load, wire1(1));
	g4 : ffd port map (clock, wire1(1), '1', '1', wire2(1));
	g5 : mux2x1 port map (wire2(2), I(2), load, wire1(2));
	g6 : ffd port map (clock, wire1(2), '1', '1', wire2(2));
	g7 : mux2x1 port map (wire2(3), I(3), load, wire1(3));
	g8 : ffd port map (clock, wire1(3), '1', '1', wire2(3));
	
	Q <= wire2;
end ckt;