library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bin_to_bcd_6b is
	port (
		binary : in std_logic_vector(5 downto 0);
		Tens, Ones : out std_logic_vector(3 downto 0)
	);
end bin_to_bcd_6b;

architecture ckt of bin_to_bcd_6b is
begin
	bcd1 : process(binary)
		variable z : STD_logic_vector(13 downto 0);
	begin
		for i in 0 to 13 loop
			z(i) := '0';
		end loop;
		
		z(5 downto 0) := binary;

		for i in 0 to 5 loop
			if z(9 downto 6) > 4 then
				z(9 downto 6) := z(9 downto 6) + 3;
			end if;
			if z(13 downto 10) > 4 then
				z(13 downto 10) := z(13 downto 10) + 3;
			end if;
			z(13 downto 1) := z(12 downto 0);
		end loop;
		
		Tens <= z(13 downto 10);
		Ones <= z(9 downto 6);
	end process bcd1;
end ckt;

