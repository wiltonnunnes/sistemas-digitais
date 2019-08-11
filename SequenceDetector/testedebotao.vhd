library ieee;
use ieee.std_logic_1164.all;

entity testedebotao is
    port (clk , r, bi: in std_logic ;
            bo : out std_logic);
end testedebotao ;

architecture button of testedebotao is
    type state_type is (a, b, c);
    signal y_present , y_next : state_type ;
    
begin
    process (bi, y_present )
    begin
        case y_present is
            when a =>
                if bi = '0' then y_next <= a;
                else y_next <= b; end if;
            when b =>
                y_next <= c;
                
            when c =>
                if bi = '0' then y_next <= a;
                else y_next <= c; end if;
        end case ;
    end process ;

    process (clk ,r)
    begin
        if r = '1' then
            y_present <= a;
        elsif (clk ' event and clk = '1') then
            y_present <= y_next ;
        end if;
    end process ;
        
    bo <= '1' when y_present = b else '0';
end button;