library ieee;
use ieee.std_logic_1164.all;

ENTITY pwm_tb IS
END pwm_tb;

ARCHITECTURE tb OF pwm_tb IS 

    COMPONENT pwm is
    generic(
        DATA_WIDTH    :  integer := 8
    );
        port(   
            i_sl_CLK      :  in  std_logic;                      -- clock
	    i_sl_en	  :  in  std_logic;
            o_sl_pwm      :  out std_logic_vector(DATA_WIDTH-1 downto 0)   -- output
        );
    end COMPONENT;

    -- "local" signals
    constant DATA_WIDTH : integer := 8;
    -- signals for UUT
    -- input 
    signal CLK    : std_logic := '0';
    signal en     : std_logic := '0';
    -- ouput
    signal o_sl_pwm : std_logic_vector(DATA_WIDTH-1 downto 0) := "00000001";

BEGIN 
    -- Instance of unit under test.
    uut: pwm 
    PORT MAP (
        i_sl_CLK    => CLK,
	i_sl_en     => en,
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

    tb_en :process
    begin
        en <= '0';
        wait for 20 ns;
        en <= '1';
        wait for 20 ns;
    end process;


END;

