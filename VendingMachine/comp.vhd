library ieee;
use ieee.std_logic_1164.all;

entity comp is
	port (
		a, b, in_gt, in_eq, in_lt : in std_logic;
		out_gt, out_eq, out_lt : out std_logic
	);
end comp;

architecture ckt of comp is
begin
	out_gt <= in_gt or (in_eq and a and not b);
	out_lt <= in_lt or (in_eq and not a and b);
	out_eq <= in_eq and (a xnor b);
end ckt;