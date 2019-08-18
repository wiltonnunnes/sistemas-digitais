library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bin_to_bcd_6b is
	port (
		e5, e4, e3, e2, e1, e0 : in std_logic;
		d2, d1, d0, u3, u2, u1, u0 : out std_logic
	);
end bin_to_bcd_6b;

architecture ckt of bin_to_bcd_6b is
begin
	d2 <= e5 and (e4 or (not e4 and e3));
	d1 <= (e4 and ((not e5 and (e3 or (not e3 and e2))) or (e5 and e3 and e2))) or (e5 and not e4 and not e3);
	d0 <= e5 and (not e3 and (not e4 or e4 and (e2 or not e2 and e1)) or e4 and e3 and not e2) or not e5 and (e3 and (not e4 and (e2 or not e2 and e1) or e4 and e2 and e1) or e4 and not e3 and not e2);
	u3 <= e4 and (not e2 and (not e3 and (not e5 and e1 or e5 and not e1) or e5 and e3 and e1) or not e5 and e3 and e2 and not e1) or not e4 and (not e5 and e3 and not e2 and not e1 or e5 and not e3 and e2 and e1);
	u2 <= not e4 and (e2 and (not e5 and (not e3 or e3 and e1) or e5 and (e3 or not e3 and not e1)) or e5 and not e3 and not e2 and e1) or e4 and (not e2 and (not e5 and (e3 or not e3 and not e1) or e5 and e3 and not e1) or e5 and not e3 and e2 and e1);
	u1 <= not e4 and (not e3 and (not e5 and e1 or e5 and not e1) or e3 and (e5 and e1 or not e5 and e2 and not e1)) or e4 and (not e5 and (not e3 and (not e2 and not e1 or e2 and e1) or e3 and not e2 and e1) or e5 and (e2 and (not e3 and not e1 or e3 and e1) or e3 and not e2 and not e1));
	u0 <= e0;
end ckt;

