library ieee;
use ieee.std_logic_1164.all;

ENTITY pwm_tb IS
END pwm_tb;

ARCHITECTURE tb OF pwm_tb IS 

    COMPONENT pwm is

        port(   
            i_sl_CLK      :  in  std_logic;                      -- clock
	    i_sl_en	  :  in  std_logic;
	    i_sl_sixteen  :  in std_logic_vector(15 downto 0);
            o_sl_pwm      :  out std_logic_vector(1 downto 0);   -- output
	    o_sl_four     :  out std_logic_vector(3 downto 0)
        );
    end COMPONENT;

    -- "local" signals
    -- signals for UUT
    -- input 
    signal CLK    : std_logic := '0';
    signal en     : std_logic := '0';
    signal sixteen : std_logic_vector(15 downto 0) := "0000010110101111";
    -- ouput
    signal o_sl_pwm : std_logic_vector(1 downto 0) := "00";
    signal o_sl_four : std_logic_vector(3 downto 0) := "0000";

BEGIN 
    -- Instance of unit under test.
    uut: pwm 
    PORT MAP (
        i_sl_CLK    => CLK,
	i_sl_en     => en,
	i_sl_sixteen => sixteen,
        o_sl_pwm    => o_sl_pwm,
	o_sl_four   => o_sl_four
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
        en <= '1';
        wait for 20 ns;
        en <= '0';
        wait for 20 ns;
    end process;


END;

