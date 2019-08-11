library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bin_to_bcd_13b is
	port (
		binary : in std_logic_vector(12 downto 0);
		Thousands, Hundreds, Tens, Ones : out std_logic_vector(3 downto 0)
	);
end bin_to_bcd_13b;

architecture ckt of bin_to_bcd_13b is
begin
	bcd1 : process(binary)
		variable z : STD_logic_vector(28 downto 0);
	begin
		for i in 0 to 28 loop
			z(i) := '0';
		end loop;
		
		z(12 downto 0) := binary;

		for i in 0 to 12 loop
			if z(16 downto 13) > 4 then
				z(16 downto 13) := z(16 downto 13) + 3;
			end if;
			if z(20 downto 17) > 4 then
				z(20 downto 17) := z(20 downto 17) + 3;
			end if;
			if z(24 downto 21) > 4 then
				z(24 downto 21) := z(24 downto 21) + 3;
			end if;
			if z(28 downto 25) > 4 then
				z(28 downto 25) := z(28 downto 25) + 3;
			end if;
			z(28 downto 1) := z(27 downto 0);
		end loop;
		
		Thousands <= z(28 downto 25);
		Hundreds <= z(24 downto 21);
		Tens <= z(20 downto 17);
		Ones <= z(16 downto 13);
	end process bcd1;
end ckt;

