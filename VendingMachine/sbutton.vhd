library ieee;
use ieee.std_logic_1164.all;

entity sbutton is
	port ( 
		clock, bi: in std_logic ;
		bo : out std_logic );
end sbutton;

architecture ckt of sbutton is
	type state_type is (a, b, c);
	signal y_present , y_next : state_type ;
begin
	process (bi, y_present)
	begin
		case y_present is
			when a =>
				if bi = '0' then 
					y_next <= b;
				else
					y_next <= a;
				end if;
			when b =>
				if bi = '0' then
					y_next <= c;
				else
					y_next <= a;
				end if;
			when c =>
				if bi = '0' then
					y_next <= c;
				else
					y_next <= a;
				end if;
		end case;
	end process;
	process (clock)
	begin
		if (clock'event and clock = '1') then
			y_present <= y_next;
		end if;
	end process;
	bo <= '1' when y_present = b else '0';
end ckt ;