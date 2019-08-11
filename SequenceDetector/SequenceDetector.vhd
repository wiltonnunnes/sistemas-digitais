library ieee;
use ieee.std_logic_1164.all;

entity SequenceDetector is
	port (
		CLOCK_27, KEY0, KEY1, KEY2, KEY3, SW : in std_logic;
		LEDR : out std_logic_vector(1 downto 0);
		HEX0 : out std_logic_vector(6 downto 0)
	);
end SequenceDetector;

architecture ckt of SequenceDetector is

	signal ck, b0, b1, b2, b3 : std_logic;
	signal state : std_logic_vector(3 downto 0);

	component sbutton
		port (
			clock, bi : in std_logic;
			bo	: out std_logic
		);
	end component;
	
	component CLK_Div
		port (
			clk_in : in std_logic;
			clk_out : out std_logic
		);
	end component;
	
	component mde_b
		port (
			clk, K0, K1, K2, K3, S : in std_logic;
			L : out std_logic;
			curr_state : out std_logic_vector(3 downto 0)
		);
	end component;
	
	component bcd_7segment
		port (
			bcd : in std_logic_vector(3 downto 0);
			output : out std_logic_vector(6 downto 0)
		);
	end component;
	
begin
	g1 : sbutton port map (ck, KEY0, b0);
	g2 : sbutton port map (ck, KEY1, b1);
	g3 : sbutton port map (ck, KEY2, b2);
	g4 : sbutton port map (ck, KEY3, b3);
	g5 : CLK_Div port map (CLOCK_27, ck);
	g6 : bcd_7segment port map (state, HEX0);
	g7 : mde_b port map (ck, b0, b1, b2, b3, SW, LEDR(0), state);
	LEDR(1) <= ck;
end ckt;