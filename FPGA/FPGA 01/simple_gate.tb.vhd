library ieee;
use ieee.std_logic_1164.all;

ENTITY lecture01_tb IS
END lecture01_tb;

ARCHITECTURE tb OF lecture01_tb IS 
    COMPONENT lecture01 is
        port(	
            i_sl_x    : in  std_logic;
	    i_sl_y    : in std_logic;
            o_sl_AND  : out std_logic;
            o_sl_OR   : out std_logic;
            o_sl_NAND : out std_logic;
            o_sl_NOR  : out std_logic;
            o_sl_XOR  : out std_logic;
            o_sl_NOT  : out std_logic
        );
    end COMPONENT;

    -- "local" signals

    -- signals for UUT
    -- input 
    signal x    : std_logic := '0';
    signal y    : std_logic := '0';

    -- ouput
    signal o_sl_AND : std_logic := '0';
    signal o_sl_OR : std_logic := '0';
    signal o_sl_NAND : std_logic := '0';
    signal o_sl_NOR : std_logic := '0';
    signal o_sl_XOR : std_logic := '0';
    signal o_sl_NOT : std_logic := '0';
BEGIN 
    -- Instance of unit under test.
    uut: lecture01 
    PORT MAP (
        i_sl_x  => x,
	i_sl_y  => y,
	o_sl_AND => o_sl_AND,
	o_sl_OR => o_sl_OR,
	o_sl_NAND => o_sl_NAND,
	o_sl_NOR => o_sl_NOR,
	o_sl_XOR => o_sl_XOR,
	o_sl_NOT => o_sl_NOT
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
    tb_process_y :process
    begin
        y <= '0';
        wait for 20 ns;
        y <= '1';
        wait for 20 ns;
    end process;


END;

