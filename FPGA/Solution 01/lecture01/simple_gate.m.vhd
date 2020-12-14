---------------------------------------
-- lecture 01 simple gate
-- just forwarding the signal
----------------------------------------

library ieee;
use ieee.std_logic_1164.all;

----------------------------------------

entity lecture01 is
    port(   
        i_sl_x    :  in  std_logic;
        i_sl_y    :  in  std_logic;
        o_sl_and  :  out std_logic;
        o_sl_or   :  out std_logic;
        o_sl_nand :  out std_logic;
        o_sl_nor  :  out std_logic;
        o_sl_xor  :  out std_logic;
        o_sl_not  :  out std_logic
    );
end lecture01;  

----------------------------------------

architecture behaviour of lecture01 is
begin

    process(i_sl_x, i_sl_y)
    begin
        o_sl_and  <= i_sl_x  and i_sl_y;
        o_sl_or   <= i_sl_x   or i_sl_y;
        o_sl_nand <= i_sl_x nand i_sl_y;
        o_sl_nor  <= i_sl_x  nor i_sl_y;
        o_sl_xor  <= i_sl_x  xor i_sl_y;
        o_sl_not  <= not i_sl_x;
    end process;

end behaviour;

------------------------------------------
