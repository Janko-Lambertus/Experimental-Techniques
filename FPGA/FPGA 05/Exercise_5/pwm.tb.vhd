library ieee;
use ieee.std_logic_1164.all;

ENTITY pwm_tb IS
END pwm_tb;

ARCHITECTURE tb OF pwm_tb IS 

    COMPONENT pwm is

        port(   
            i_sl_CLK      :  in  std_logic;                      -- clock
	    o_sl_number   :  out std_logic_vector(7 downto 0);
	    o_sl_twelve     :  out std_logic_vector(11 downto 0)
        );
    end COMPONENT;

    -- "local" signals
    -- signals for UUT
    -- input 
    signal CLK    : std_logic := '0';

    -- ouput
    signal o_sl_number : std_logic_vector(7 downto 0) := "00000000";
    signal o_sl_twelve   : std_logic_vector(11 downto 0) := "000000000000";


BEGIN 
    -- Instance of unit under test.
    uut: pwm 
    PORT MAP (
        i_sl_CLK    => CLK,
	o_sl_number => o_sl_number,
	o_sl_twelve   => o_sl_twelve

    );

-------------------------------------------------------------------------------
    -- test bench definition.
    tb_CLK :process
    begin
        CLK <= '0';
        wait for 3 ns;
        CLK <= '1';
        wait for 3 ns;
    end process;




END;

