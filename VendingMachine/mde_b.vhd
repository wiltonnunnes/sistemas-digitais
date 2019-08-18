library ieee;
use ieee.std_logic_1164.all;

entity mde_b is
	port (
		clk, c, tot_lt_s : in std_logic;
		curr_state : out std_logic_vector(1 downto 0);
		d, tot_ld, tot_clr : out std_logic
	);
end mde_b;

architecture ckt of mde_b is
	type state_type is (Inicio, Esperar, Somar, Fornecer);
	signal y_present, y_next : state_type;
begin
	process (c, tot_lt_s, y_present)
	begin
		case y_present is
			when Inicio =>
				curr_state <= "00";
				y_next <= Esperar;
			when Esperar =>
				curr_state <= "01";
				if c = '1' then
					y_next <= Somar;
				elsif tot_lt_s = '1' then
					y_next <= Esperar;
				else
					y_next <= Fornecer;
				end if;
			when Somar =>
				curr_state <= "10";
				y_next <= Esperar;
			when Fornecer =>
				curr_state <= "11";
				y_next <= Inicio;
		end case;
	end process;
	process (clk)
	begin
		if (clk'event and clk = '1') then
			y_present <= y_next;
		end if;
	end process;
	tot_ld <= '1' when y_present = Somar else '0';
	d <= '1' when y_present = Fornecer else '0';
	tot_clr <= '0' when y_present = Inicio else '1';
end ckt;