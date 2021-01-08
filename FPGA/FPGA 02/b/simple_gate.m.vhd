---------------------------------------
-- lecture 01 simple gate
-- just forwarding the signal
----------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
----------------------------------------
entity lecture01 is
port(	
	    i_sl_x : in  std_logic;
	    i_sl_dir : in std_logic;
	    i_sl_en : in std_logic;
	    o_slv_shift : out std_logic_vector(7 downto 0)
);
end lecture01;  

----------------------------------------

architecture behaviour of lecture01 is
	signal shift_reg : std_logic_vector(7 downto 0) := "00000000";
begin

    process(i_sl_x)
    begin
        -- compare to truth table
	if rising_edge(i_sl_x) then
		if (i_sl_en = '1') then
		    if (i_sl_dir = '1') then
			shift_reg <= std_logic_vector(unsigned(shift_reg)-1);
		    else 
			shift_reg <= std_logic_vector(unsigned(shift_reg)+1);
		    end if;
		end if;
	end if;
	o_slv_shift <= shift_reg;
    end process;
end behaviour;

------------------------------------------
