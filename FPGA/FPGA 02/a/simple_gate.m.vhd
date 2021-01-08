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
	    o_slv_shift : out std_logic_vector(7 downto 0)
);
end lecture01;  

----------------------------------------

architecture behaviour of lecture01 is
	signal shift_reg : std_logic_vector(7 downto 0) := "00000001";
begin

    process(i_sl_x)
    begin
        -- compare to truth table
	if rising_edge(i_sl_x) then
		shift_reg <= shift_reg(6 downto 0) & shift_reg(7);
	end if;
	o_slv_shift <= shift_reg;
    end process;
end behaviour;

------------------------------------------
