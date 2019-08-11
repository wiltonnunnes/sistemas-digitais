library ieee;
use ieee.std_logic_1164.all;

entity FIFO is
	port (
		CLOCK_27, KEY : in std_logic;
		HEX5, HEX4 : out std_logic_vector(6 downto 0);
		LEDR : out std_logic_vector(5 downto 0)
	);
end FIFO;

architecture ckt of FIFO is

	signal wire1, wire2 : std_logic;
	signal wires3 : std_logic_vector(5 downto 0);
	signal wires4, wires5 : std_logic_vector(3 downto 0);

	component CLK_Div
		port (
			clk_in : in std_logic;
			clk_out: out std_logic
		);
	end component;
	
	component bin_to_bcd_6b
		port (
			e5, e4, e3, e2, e1, e0 : in std_logic;
			d2, d1, d0, u3, u2, u1, u0 : out std_logic
		);
	end component;
	
	component bcd_7segment
		port (
			bcd : in std_logic_vector(3 downto 0);
			output : out std_logic_vector(6 downto 0)
		);
	end component;
	
	component counter4
		port (
			clk, cnt : in std_logic;
			C : out std_logic_vector(3 downto 0)
		);
	end component;

begin
	g1 : CLK_Div port map (CLOCK_27, wire1);
	g2 : counter4 port map (wire1, wire2, wires3);
	g3 : bin_to_bcd_6b port map (wires3(5), wires3(4), wires3(3), wires3(2), wires3(1), wires3(2), wires5(2), wires5(1), wires5(0), wires4(3), wires4(2), wires4(1), wires4(0));
	g4 : bcd_7segment port map (wires4, HEX4);
	g5 : bcd_7segment port map (wires5, HEX5);
	
	wire2 <= not KEY;
	LEDR(0) <= wire2;
	LEDR(1) <= wire1;
	LEDR(2) <= wire3(0);
	LEDR(3) <= wire3(1);
	LEDR(4) <= wire3(2);
	LEDR(5) <= wire3(3);
	wires5(3) <= '0';
end ckt;