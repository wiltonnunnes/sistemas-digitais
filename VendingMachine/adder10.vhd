library ieee;
use ieee.std_logic_1164.all;

entity adder10 is
	port (
		x1, x2 : in std_logic_vector(9 downto 0);
		y : out std_logic_vector(9 downto 0)
	);
end adder10;

architecture ckt of adder10 is

	signal wires : std_logic_vector(8 downto 0);

	component half_adder
		port (
			a, b : in std_logic;
			co, s : out std_logic
		);
	end component;
	
	component full_adder
		port (
			a, b, ci : in std_logic;
			s, co : out std_logic
		);
	end component;
	
begin
	g1 : half_adder port map (x1(0), x2(0), wires(0), y(0));
	g2 : full_adder port map (x1(1), x2(1), wires(0), y(1), wires(1));
	g3 : full_adder port map (x1(2), x2(2), wires(1), y(2), wires(2));
	g4 : full_adder port map (x1(3), x2(3), wires(2), y(3), wires(3));
	g5 : full_adder port map (x1(4), x2(4), wires(3), y(4), wires(4));
	g6 : full_adder port map (x1(5), x2(5), wires(4), y(5), wires(5));
	g7 : full_adder port map (x1(6), x2(6), wires(5), y(6), wires(6));
	g8 : full_adder port map (x1(7), x2(7), wires(6), y(7), wires(7));
	g9 : full_adder port map (x1(8), x2(8), wires(7), y(8), wires(8));
	g10 : full_adder port map (x1(9), x2(9), wires(8), y(9), open);
end ckt;