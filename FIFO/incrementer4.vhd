library ieee;
use ieee.std_logic_1164.all;

entity incrementer4 is
	port (
		a3, a2, a1, a0 : in std_logic;
		s3, s2, s1, s0 : out std_logic
	);
end incrementer4;

architecture ckt of incrementer4 is

	signal wires : std_logic_vector(2 downto 0);

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
	g4 : half_adder port map (a3, wires(2), open, s3);
end ckt;