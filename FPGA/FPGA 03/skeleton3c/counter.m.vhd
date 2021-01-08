---------------------------------------
-- lecture 01 simple gate
-- just forwarding the signal
----------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
----------------------------------------
entity counter is
generic(DATA_WIDTH : integer := 8);
port(	
	    i_sl_CLK : in  std_logic;
	    i_sl_dir : in std_logic;
	    i_sl_en : in std_logic;
	    i_sl_rst : in std_logic;
	    o_slv_counter : out std_logic_vector(data_width-1 downto 0)
);
end counter;  

----------------------------------------

architecture behaviour of counter is
	signal shift_reg : std_logic_vector(data_width-1 downto 0) := (others => '0');
	signal reset : std_logic_vector(data_width-1 downto 0) := (others =>'0');
begin

    process(i_sl_CLK)
    begin
        -- compare to truth table
	if rising_edge(i_sl_CLK) then
		if (i_sl_en = '1') then
		    if (i_sl_dir = '1') then
			shift_reg <= std_logic_vector(unsigned(shift_reg)-1);
		    else 
			shift_reg <= std_logic_vector(unsigned(shift_reg)+1);
		    end if;
		end if;
	end if;
	if (i_sl_rst = '1') then
	    shift_reg <= reset;
	end if;
	o_slv_counter <= shift_reg;

    end process;
end behaviour;

------------------------------------------
