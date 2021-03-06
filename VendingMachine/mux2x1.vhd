library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
	port (
		i0, i1, s0 : in std_logic;
		d : out std_logic
	);
end mux2x1;

architecture ckt of mux2x1 is
begin
	d <= (i0 and not s0) or (i1 and s0);
end ckt;