library ieee;
use ieee.std_logic_1164.all;

entity incrementer6 is
	port (
		a5, a4, a3, a2, a1, a0 : in std_logic;
		s5, s4, s3, s2, s1, s0 : out std_logic
	);
end incrementer6;

architecture ckt of incrementer6 is

	signal wires : std_logic_vector(4 downto 0);

	component half_adder
		port (
			a, b : in std_logic;
			co, s : out std_logic
		);
	end component;
	
begin
	g1 : half_adder port map (a0, '1', wires(0), s0);
	g2 : half_adder port map (a1, wires(0), wires(1), s1);
	g3 : half_adder port map (a2, wires(1), wires(2), s2);
	g4 : half_adder port map (a3, wires(2), wires(3), s3);
	g5 : half_adder port map (a4, wires(3), wires(4), s4);
	g6 : half_adder port map (a5, wires(4), open, s5);
end ckt;