library ieee;
use ieee.std_logic_1164.all;

entity adder10 is
	port (
		a9, a8, a7, a6, a5, a4, a3, a2, a1, a0, b9, b8, b7, b6, b5, b4, b3, b2, b1, b0 : in std_logic;
		s9, s8, s7, s6, s5, s4, s3, s2, s1, s0 : in std_logic
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
	g1 : half_adder port map (a0, b0, wires(0), s0);
	g2 : full_adder port map (a1, b1, wires(0), s1, wires(1));
	g3 : full_adder port map (a2, b2, wires(1), s2, wires(2));
	g4 : full_adder port map (a3, b3, wires(2), s3, wires(3));
	g5 : full_adder port map (a4, b4, wires(3), s4, wires(4));
	g6 : full_adder port map (a5, b5, wires(4), s5, wires(5));
	g7 : full_adder port map (a6, b6, wires(5), s6, wires(6));
	g8 : full_adder port map (a7, b7, wires(6), s7, wires(7));
	g9 : full_adder port map (a8, b8, wires(7), s8, wires(8));
	g10 : full_adder port map (a9, b9, wires(8), s9, wires(9));
end ckt;