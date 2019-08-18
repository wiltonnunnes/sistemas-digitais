library ieee;
use ieee.std_logic_1164.all;

entity counter4 is
	port (
		clk, cnt : in std_logic;
		C : out std_logic_vector(3 downto 0)
	);
end counter4;

architecture ckt of counter4 is
	
	signal wire1, wire2 : std_logic_vector(3 downto 0);
	
	component register4                                                                                                                                                                                                                                                                                                                                          
		port (
			I : in std_logic_vector(3 downto 0);
			clock, load : in std_logic;
			Q : out std_logic_vector(3 downto 0)
		);
	end component;
	
	component incrementer4
		port (
			a3, a2, a1, a0 : in std_logic;
			s3, s2, s1, s0 : out std_logic
		);
	end component;
	
begin
	g1 : register4 port map (wire2, clk, cnt, wire1);
	g2 : incrementer4 port map (wire1(3), wire1(2), wire1(1), wire1(0), wire2(3), wire2(2), wire2(1), wire2(0));
	
	C <= wire1;
end ckt;