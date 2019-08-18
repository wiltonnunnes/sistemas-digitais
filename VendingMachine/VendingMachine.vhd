library ieee;
use ieee.std_logic_1164.all;

entity VendingMachine is
	port (
		CLOCK_27, KEY2, KEY3 : in std_logic;
		SW : in std_logic_vector(7 downto 0);
		LEDR : out std_logic_vector(3 downto 0);
		HEX5, HEX4, HEX2, HEX1, HEX0 : out std_logic_vector(6 downto 0)
	);
end VendingMachine;

architecture ckt of VendingMachine is

	signal wire1, wire2, wire3, wire4, wire5 : std_logic;
	signal wires1, wires2, wires3 : std_logic_vector(3 downto 0);
	signal wires4 : std_logic_vector(5 downto 0);
	signal wires5, wires6, wires7 : std_logic_vector(9 downto 0);
	signal wires8, wires9, wires10 : std_logic_vector(3 downto 0);
	
	component sbutton
		port ( 
			clock, bi: in std_logic ;
			bo : out std_logic 
		);
	end component;
	
	component CLK_Div
		port (
			clk_in : in std_logic;
			clk_out : out std_logic
		);
	end component;
	
	component counter4
		port (
			clk, cnt, clr : in std_logic;
			C : out std_logic_vector(3 downto 0)
		);
	end component;
	
	component ROM
		port (
			address : in std_logic_vector(3 downto 0);
			clock : in std_logic;
			q : out std_logic_vector(5 downto 0)
		);
	end component;
	
	component bin_to_bcd_6b
		port (
			binary : in std_logic_vector(5 downto 0);
			Tens, Ones : out std_logic_vector(3 downto 0)
		);
	end component;
	
	component bcd_7segment
		port (
			bcd : in std_logic_vector(3 downto 0);
			output : out std_logic_vector(6 downto 0)
		);
	end component;
	
	component register10
		port (
			I : in std_logic_vector(9 downto 0);
			clock, load, clear : in std_logic;
			Q : out std_logic_vector(9 downto 0)
		);
	end component;
	
	component adder10
		port (
			x1, x2 : in std_logic_vector(9 downto 0);
			y : out std_logic_vector(9 downto 0)
		);
	end component;
	
	component comp10
		port (
			x1, x2 : in std_logic_vector(9 downto 0);
			AltB : out std_logic
		);
	end component;
	
	component bin_to_bcd_10b
		port (
			binary : in std_logic_vector(9 downto 0);
			Hundreds, Tens, Ones : out std_logic_vector(3 downto 0)
		);
	end component;
	
	component mde_b
		port (
			clk, c, tot_lt_s : in std_logic;
			curr_state : out std_logic_vector(1 downto 0);
			d, tot_ld, tot_clr : out std_logic
		);
	end component;
	
begin
	g1 : CLK_Div port map (CLOCK_27, wire1);
	g2 : sbutton port map (wire1, KEY2, wire2);
	g3 : counter4 port map (wire1, wire2, KEY3, wires1);
	g4 : ROM port map (wires1, wire1, wires4);
	g5 : bin_to_bcd_6b port map (wires4, wires3, wires2);
	g6 : bcd_7segment port map (wires2, HEX4);
	g7 : bcd_7segment port map (wires3, HEX5);
	g8 : adder10 port map (wires5, wires4, wires6);
	g9 : register10 port map (wires6, wire1, wire3, wire4, wires5);
	g10 : mde_b port map (wire1, wire2, wire5, LEDR(3 downto 2), LEDR(0), wire3, wire4);
	g11 : comp10 port map (wires5, wires7, wire5);
	g12 : bin_to_bcd_10b port map (wires5, wires10, wires9, wires8);
	g13 : bcd_7segment port map (wires8, HEX0);
	g14 : bcd_7segment port map (wires9, HEX1);
	g15 : bcd_7segment port map (wires10, HEX2);
	
	LEDR(1) <= wire1;
	wires7(9 downto 8) <= "00";
	wires7(7 downto 0) <= SW;
end ckt;