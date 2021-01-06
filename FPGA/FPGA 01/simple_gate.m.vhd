---------------------------------------
-- lecture 01 simple gate
-- just forwarding the signal
----------------------------------------

library ieee;
use ieee.std_logic_1164.all;

----------------------------------------

entity lecture01 is
port(	
	i_sl_x : in  std_logic;
	o_sl_F: out std_logic
);
end lecture01;  

----------------------------------------

architecture behaviour of lecture01 is
begin

    process(i_sl_x)
    begin
        -- compare to truth table
        if (i_sl_x = '1') then
            o_sl_F <= '1';
        else
            o_sl_F <= '0';
        end if;
    end process;
end behaviour;

------------------------------------------
