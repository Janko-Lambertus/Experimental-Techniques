library ieee;
use ieee.std_logic_1164.all;

ENTITY pwm_tb IS
END pwm_tb;

ARCHITECTURE tb OF pwm_tb IS 

    -- some constant values
    constant DATA_WIDTH : integer := 4;

    COMPONENT pwm is
        generic(
            DATA_WIDTH    :  integer := 8
        );
        port(   
            i_sl_CLK      :  in  std_logic;                      -- clock
            i_slv_val     :  in  std_logic_vector(DATA_WIDTH-1 downto 0);    -- pwm value
            o_sl_pwm      :  out std_logic                       -- output
        );
    end COMPONENT;

    -- "local" signals

    -- signals for UUT
    -- input 
    signal CLK    : std_logic := '0';

    signal i_slv_val : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');

    -- ouput
    signal o_sl_pwm : std_logic := '0';

BEGIN 
    -- Instance of unit under test.
    uut: pwm 
    GENERIC MAP(
        DATA_WIDTH  => DATA_WIDTH
    )
    PORT MAP (
        i_sl_CLK    => CLK,
        i_slv_val   => i_slv_val,
        o_sl_pwm    => o_sl_pwm
    );

-------------------------------------------------------------------------------
    -- test bench definition.
    tb_CLK :process
    begin
        CLK <= '0';
        wait for 1 ns;
        CLK <= '1';
        wait for 1 ns;
    end process;

    tb_rst: process
    begin
        wait for 300 ns;
        i_slv_val <= "0011";
        wait for 10 us;
    end process;

END;

