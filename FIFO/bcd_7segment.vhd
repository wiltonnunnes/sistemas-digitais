library ieee;
use ieee.std_logic_1164.all;

entity bcd_7segment is
	port (
		bcd : in std_logic_vector(3 downto 0);
		output : out std_logic_vector(6 downto 0)
	);
end bcd_7segment;

architecture ckt of bcd_7segment is
begin
	output(6) <= (not bcd(3) and not bcd(2) and not bcd(1)) or (not bcd(3) and bcd(2) and bcd(1) and bcd(0)) or (bcd(3) and bcd(2) and not bcd(1) and not bcd(0));
	output(5) <= (not bcd(3) and not bcd(2) and bcd(0)) or (not bcd(3) and not bcd(2) and bcd(1)) or (not bcd(3) and bcd(1) and bcd(0)) or (bcd(3) and bcd(2) and not bcd(1) and bcd(0));
	output(4) <= (not bcd(3) and bcd(0)) or (not bcd(2) and not bcd(1) and bcd(0)) or (not bcd(3) and bcd(2) and not bcd(1));
	output(3) <= (bcd(2) and bcd(1) and bcd(0)) or (not bcd(3) and not bcd(2) and not bcd(1) and bcd(0)) or (not bcd(3) and bcd(2) and not bcd(1) and not bcd(0)) or (bcd(3) and not bcd(2) and bcd(1) and not bcd(0));
	output(2) <= (bcd(3) and bcd(2) and not bcd(0)) or (bcd(3) and bcd(2) and bcd(1)) or (not bcd(3) and not bcd(2) and bcd(1) and not bcd(0));
	output(1) <= (bcd(2) and bcd(1) and not bcd(0)) or (bcd(3) and bcd(1) and bcd(0)) or (bcd(3) and bcd(2) and not bcd(0)) or (not bcd(3) and bcd(2) and not bcd(1) and bcd(0));
	output(0) <= (not bcd(3) and not bcd(2) and not bcd(1) and bcd(0)) or (not bcd(3) and bcd(2) and not bcd(1) and not bcd(0)) or (bcd(3) and not bcd(2) and bcd(1) and bcd(0)) or (bcd(3) and bcd(2) and not bcd(1) and bcd(0));
end ckt;
