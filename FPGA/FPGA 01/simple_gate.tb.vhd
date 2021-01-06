library ieee;
use ieee.std_logic_1164.all;

ENTITY lecture01_tb IS
END lecture01_tb;

ARCHITECTURE tb OF lecture01_tb IS 
    COMPONENT lecture01 is
        port(	
            i_sl_x : in  std_logic;
            o_sl_F : out std_logic
        );
    end COMPONENT;

    -- "local" signals

    -- signals for UUT
    -- input 
    signal x    : std_logic := '0';

    -- ouput
    signal F    : std_logic := '0';

BEGIN 
    -- Instance of unit under test.
    uut: lecture01 
    PORT MAP (
        i_sl_x  => x,
        o_sl_F  => F
    );

-------------------------------------------------------------------------------
    -- test bench definition.
    tb_process :process
    begin
        x <= '0';
        wait for 10 ns;
        x <= '1';
        wait for 10 ns;
    end process;

END;

