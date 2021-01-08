library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY mux_tb IS
END mux_tb;

ARCHITECTURE tb OF mux_tb IS 

    constant OUTPUT_BITS    : integer := 4;  -- how many bits does each output have
    constant SLOTS          : integer := 2;  -- giving how many slots we would like to mux

    COMPONENT mux is
        GENERIC (
            OUTPUT_BITS    : integer := 4;  -- how many bits does each output have
            SLOTS          : integer := 2   -- giving how many slots we would like to mux
        );
        port(   
            i_slv_select  :   in std_logic_vector( 1 downto 0);
            i_slv_input   :   in std_logic_vector( OUTPUT_BITS**2 - 1 downto 0);
            o_slv_output  :  out std_logic_vector( OUTPUT_BITS -1 downto 0)
        );
    end COMPONENT;

    -- "local" signals

    -- signals for UUT
    -- input 
    signal sel : std_logic_vector( 1 downto 0) := (others => '0');

    signal input : std_logic_vector( OUTPUT_BITS**2-1 downto 0);

    -- ouput
    signal o_slv_output  : std_logic_vector( OUTPUT_BITS-1 downto 0);

BEGIN 
    -- Instance of unit under test.
    mux1: mux 
        GENERIC MAP(
            OUTPUT_BITS  => OUTPUT_BITS,
            SLOTS        => SLOTS
        )
        port map(   
            i_slv_select => sel,
            i_slv_input  => input,
            o_slv_output => o_slv_output
        );

-------------------------------------------------------------------------------
    -- test bench definition.
    tb_test :process
    begin
        input <= "1111000010100101";

        sel <= "00";
        wait for 2 ns;
        sel <= "01";
        wait for 2 ns;
        sel <= "10";
        wait for 2 ns;
        sel <= "11";
        wait for 2 ns;

    end process;

END;

