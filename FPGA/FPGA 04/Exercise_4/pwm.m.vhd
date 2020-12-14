---------------------------------------
-- lecture 02 shift register
-- just forwarding the signal
----------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------

entity pwm is

    port(   
        i_sl_CLK      :  in  std_logic;                                 -- clock
	i_sl_en	      :  in std_logic;
	i_sl_sixteen  :  in std_logic_vector(15 downto 0);
        o_sl_pwm      :  out std_logic_vector(1 downto 0);    -- pwm output
	o_sl_four     :  out std_logic_vector(3 downto 0)
    );
end pwm;  

----------------------------------------

architecture behavior of pwm is
signal slv_pwm_cnt : std_logic_vector(1 downto 0) := "00";
signal slv_pwm_four : std_logic_vector(3 downto 0) := "0000";


begin
    process(i_sl_CLK)
    begin
        if rising_edge(i_sl_CLK) then
		if (i_sl_en = '1') then
			slv_pwm_cnt <= std_logic_vector(unsigned(slv_pwm_cnt)+1);
			o_sl_pwm <= slv_pwm_cnt;
		end if;
		if (i_sl_en = '0') then 
			slv_pwm_cnt <= std_logic_vector(unsigned(slv_pwm_cnt)-1);
			o_sl_pwm <= slv_pwm_cnt;
		end if;
        end if;

	if (o_sl_pwm = "00") then
		slv_pwm_four <= i_sl_sixteen(3 downto 0);
	elsif (o_sl_pwm = "01") then
		slv_pwm_four <= i_sl_sixteen(7 downto 4);
	elsif (o_sl_pwm = "10") then
		slv_pwm_four <= i_sl_sixteen(11 downto 8);
	elsif (o_sl_pwm = "11") then
		slv_pwm_four <= i_sl_sixteen(15 downto 12);
	end if;

	o_sl_four <= slv_pwm_four;

	
    end process;

end behavior;

------------------------------------------
