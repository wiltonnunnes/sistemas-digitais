library ieee;
use ieee.std_logic_1164.all;

entity mde_b is
	port (
		clk, K0, K1, K2, K3, S : in std_logic;
		L : out std_logic;
		curr_state : out std_logic_vector(3 downto 0)
	);
end mde_b;

architecture ckt of mde_b is
	type state_type is (start_state, wait_state, dig1, dig2, dig3, dig4, dig5, end_state);
	signal y_present, y_next : state_type;
begin
	process (K0, K1, K2, K3, S, y_present)
		variable E0, E1, E2 : std_logic;
	begin
		E0 := K1 or K2;
		E1 := K0 or K2;
		E2 := K0 or K1;
		case y_present is
			when start_state =>
				curr_state <= "0000";
				y_next <= wait_state;
			when wait_state =>
				curr_state <= "0001";
				if K3 = '1' then
					y_next <= dig1;
				else
					y_next <= wait_state;
				end if;
			when dig1 =>
				curr_state <= "0010";
				if E1 = '1' then
					y_next <= wait_state;
				elsif K1 = '1' then
					y_next <= dig2;
				else
					y_next <= dig1;
				end if;
			when dig2 =>
				curr_state <= "0011";
				if K3 = '1' then
					y_next <= dig1;
				elsif E0 = '1' then
					y_next <= wait_state;
				elsif K0 = '1' then
					y_next <= dig3;
				else
					y_next <= dig2;
				end if;
			when dig3 =>
				curr_state <= "0100";
				if K3 = '1' then
					y_next <= dig1;
				elsif E2 = '1' then
					y_next <= wait_state;
				elsif K2 = '1' then
					y_next <= dig4;
				else
					y_next <= dig3;
				end if;
			when dig4 =>
				curr_state <= "0101";
				if K3 = '1' then
					y_next <= dig1;
				elsif E2 = '1' then
					y_next <= wait_state;
				elsif K2 = '1' then
					y_next <= dig5;
				else
					y_next <= dig4;
				end if;
			when dig5 =>
				curr_state <= "0110";
				if K3 = '1' then
					y_next <= dig1;
				elsif E1 = '1' then
					y_next <= wait_state;
				elsif K1 = '1' then
					y_next <= end_state;
				else
					y_next <= dig5;
				end if;
			when end_state =>
				curr_state <= "0111";
				if s = '0' then
					y_next <= end_state;
				else
					y_next <= start_state;
				end if;
		end case;
	end process;
	process (clk)
	begin
		if (clk'event and clk = '1') then
			y_present <= y_next;
		end if;
	end process;
	L <= '1' when y_present = end_state else '0';
end ckt;