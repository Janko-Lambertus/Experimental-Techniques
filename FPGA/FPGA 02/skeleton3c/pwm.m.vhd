---------------------------------------
-- lecture 02 shift register
-- just forwarding the signal
----------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------

entity pwm is
    generic(
        DATA_WIDTH    :  integer := 8
    );
    port(   
        i_sl_CLK      :  in  std_logic;                                 -- clock
	i_sl_reset    :  in std_logic;
        i_slv_en     :  in  std_logic;   -- pwm value
        o_sl_pwm      :  out std_logic_vector(DATA_WIDTH-1 downto 0)    -- pwm output
    );
end pwm;  

----------------------------------------

architecture behavior of pwm is
signal slv_pwm_cnt : std_logic_vector(DATA_WIDTH-1 downto 0) := "00000001";
signal reseter : std_logic_vector(DATA_WIDTH-1 downto 0) := "00000001";

begin
    process(i_sl_CLK)
    begin
	if (i_slv_en = '1') then
            if rising_edge(i_sl_CLK) then
		    slv_pwm_cnt <= slv_pwm_cnt(8-2 downto 0) & slv_pwm_cnt(8-1);
		    o_sl_pwm <= slv_pwm_cnt;
            end if;
	end if;
	if rising_edge(i_sl_reset) then
	    slv_pwm_cnt <= reseter;
	end if;
    end process;

end behavior;

------------------------------------------
