library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bin_to_bcd_10b is
	port (
		binary : in std_logic_vector(9 downto 0);
		Hundreds, Tens, Ones : out std_logic_vector(3 downto 0)
	);
end bin_to_bcd_10b;

architecture ckt of bin_to_bcd_10b is
begin
	bcd1 : process(binary)
		variable z : STD_logic_vector(21 downto 0);
	begin
		for i in 0 to 21 loop
			z(i) := '0';
		end loop;
		
		z(9 downto 0) := binary;

		for i in 0 to 9 loop
			if z(13 downto 10) > 4 then
				z(13 downto 10) := z(13 downto 10) + 3;
			end if;
			if z(17 downto 14) > 4 then
				z(17 downto 14) := z(17 downto 14) + 3;
			end if;
			if z(21 downto 18) > 4 then
				z(21 downto 18) := z(21 downto 18) + 3;
			end if;
			z(21 downto 1) := z(20 downto 0);
		end loop;
		
		Hundreds <= z(21 downto 18);
		Tens <= z(17 downto 14);
		Ones <= z(13 downto 10);
	end process bcd1;
end ckt;

