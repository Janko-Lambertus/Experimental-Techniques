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
        i_slv_val     :  in  std_logic_vector(DATA_WIDTH-1 downto 0);   -- pwm value
        o_sl_pwm      :  out std_logic                                  -- pwm output
    );
end pwm;  

----------------------------------------

architecture behavior of pwm is
    COMPONENT counter is
        generic(
            DATA_WIDTH    :  integer := 8
        );
        port(   
            i_sl_CLK      :  in  std_logic;                      -- clock
            i_sl_en       :  in  std_logic;                      -- enable
            i_sl_dir      :  in  std_logic;                      -- direction
            i_sl_rst      :  in  std_logic;                                 -- reset
            o_slv_counter :  out std_logic_vector(DATA_WIDTH-1 downto 0)    -- counter
        );
    end COMPONENT;

    signal slv_pwm_cnt : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');

begin
    pwm_cnt: counter 
    GENERIC MAP(
        DATA_WIDTH => DATA_WIDTH
    )
    PORT MAP (
        i_sl_CLK    => i_sl_clk,
        i_sl_en     => '1',         -- assing constant values
        i_sl_dir    => '0',
        i_sl_rst    => '0',
        o_slv_counter => slv_pwm_cnt
    );


    process(i_sl_CLK)
    begin
        if rising_edge(i_sl_CLK) then
	    if unsigned(slv_pwm_cnt) >= unsigned(i_slv_val) then
                o_sl_pwm <= '0';
            else
                o_sl_pwm <= '1';
            end if;
        end if;
    end process;

end behavior;

------------------------------------------
