library ieee;
use ieee.std_logic_1164.all;

ENTITY lecture01_tb IS
END lecture01_tb;

ARCHITECTURE tb OF lecture01_tb IS 
    COMPONENT lecture01 is
        port(	
            i_sl_x : in  std_logic;
	    i_sl_y : in  std_logic;
	    o_sl_and: out std_logic;
	    o_sl_or: out std_logic;
	    o_sl_nand: out std_logic;
	    o_sl_nor: out std_logic;
	    o_sl_xor: out std_logic;
	    o_sl_not: out std_logic
        );
    end COMPONENT;

    -- "local" signals

    -- signals for UUT
    -- input 
    signal x    : std_logic := '0';
    signal y	: std_logic := '0';

    -- ouput
    signal o_and    : std_logic := '0';
    signal o_or    : std_logic := '0';
    signal o_nand    : std_logic := '0';
    signal o_nor    : std_logic := '0';
    signal o_xor    : std_logic := '0';
    signal o_not    : std_logic := '0';

BEGIN 
    -- Instance of unit under test.
    uut: lecture01 
    PORT MAP (
        i_sl_x  => x,
	i_sl_y  => y,
        o_sl_and  => o_and,
        o_sl_or  => o_or,
        o_sl_nand  => o_nand,
        o_sl_nor  => o_nor,
        o_sl_xor  => o_xor,
        o_sl_not  => o_not
    );

-------------------------------------------------------------------------------
    -- test bench definition.
    tb_process :process
    begin
        x <= '0';
	wait for 10 ns;
	y <= '0';
        wait for 10 ns;
        x <= '1';
	wait for 10 ns;
	y <= '1';
        wait for 10 ns;
    end process;

END;
