---------------------------------------
-- lecture 02 shift register
-- just forwarding the signal
----------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.MATH_REAL.all;

----------------------------------------

entity pwm is

    port(   
        i_sl_CLK      :  in  std_logic;                                 -- clock
	o_sl_number   :  out std_logic_vector(7 downto 0);
	o_sl_twelve     :  out std_logic_vector(11 downto 0)
    );
end pwm;  

----------------------------------------

architecture behavior of pwm is



signal slv_pwm_number : std_logic_vector(7 downto 0) := "00000000";


begin
    process(i_sl_CLK)
	variable slv_pwm_ones : unsigned(3 downto 0) := (others => '0');
	variable slv_pwm_tens : unsigned(3 downto 0) := (others => '0');
	variable slv_pwm_huns : unsigned(3 downto 0) := (others => '0');
    begin
	if rising_edge(i_sl_CLK) then
		slv_pwm_number <= std_logic_vector(unsigned(slv_pwm_number)+1);
	end if;
	slv_pwm_ones := (others => '0');
	slv_pwm_tens := (others => '0');
	slv_pwm_huns := (others => '0');
	for i in 7 downto 0 loop
		if (slv_pwm_ones >= 5) then
			slv_pwm_ones := slv_pwm_ones + 3;
		end if;
		if (slv_pwm_tens >= 5) then
			slv_pwm_tens := slv_pwm_tens + 3;
		end if;
		if (slv_pwm_huns >= 5) then
			slv_pwm_huns := slv_pwm_huns + 3;
		end if;
		
		slv_pwm_huns := slv_pwm_huns(2 downto 0) & slv_pwm_tens(3);
		slv_pwm_tens := slv_pwm_tens(2 downto 0) & slv_pwm_ones(3);
		slv_pwm_ones := slv_pwm_ones(2 downto 0) & slv_pwm_number(i);

	
		
	end loop;

	o_sl_number <= slv_pwm_number;
	o_sl_twelve <= std_logic_vector(slv_pwm_huns) & std_logic_vector(slv_pwm_tens) & std_logic_vector(slv_pwm_ones);
	
    end process;

end behavior;

------------------------------------------
