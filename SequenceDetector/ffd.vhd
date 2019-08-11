library ieee;
use ieee.std_logic_1164.all;

entity ffd is
	port (
		clk, d, p, c : in std_logic;
		q : out std_logic
	);
end ffd;

architecture ckt of ffd is
	signal qs : std_logic;
begin
	process(clk, p, c)
	begin
		if p = '0' then
			qs <= '1';
		elsif c = '0' then
			qs <= '0';
		elsif clk = '1' and clk'event then
			qs <= d;
		end if;
	end process;
	q <= qs;
end ckt;