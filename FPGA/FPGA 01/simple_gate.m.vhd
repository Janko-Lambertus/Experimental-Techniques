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
	    i_sl_y : in  std_logic;
            o_sl_AND  : out std_logic;
            o_sl_OR   : out std_logic;
            o_sl_NAND : out std_logic;
            o_sl_NOR  : out std_logic;
            o_sl_XOR  : out std_logic;
            o_sl_NOT  : out std_logic
);
end lecture01;  

----------------------------------------

architecture behaviour of lecture01 is
begin

    process(i_sl_x)
    begin
        -- compare to truth table
        o_sl_AND <= i_sl_x AND i_sl_y;
        o_sl_OR <= i_sl_x OR i_sl_y;
        o_sl_NAND <= i_sl_x NAND i_sl_y;
        o_sl_NOR <= i_sl_x NOR i_sl_y;
        o_sl_XOR <= i_sl_x XOR i_sl_y;
        o_sl_NOT <= NOT i_sl_y;

    end process;
end behaviour;

------------------------------------------
