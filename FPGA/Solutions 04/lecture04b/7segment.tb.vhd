library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY segment7_tb IS
END segment7_tb;

ARCHITECTURE tb OF segment7_tb IS 

    COMPONENT segment7 is
        port(   
            i_slv_number   :  in  std_logic_vector( 3 downto 0);  -- number input
            o_slv_segments :  out std_logic_vector( 6 downto 0)   -- segments output
        );
    end COMPONENT;

    -- "local" signals

    -- signals for UUT
    -- input 
    signal number : std_logic_vector( 3 downto 0) := (others => '0');

    -- ouput
    signal o_slv_segments  : std_logic_vector( 6 downto 0) := (others => '0');

BEGIN 
    -- Instance of unit under test.
    segment1: segment7 
    PORT MAP (
        i_slv_number   => number,
        o_slv_segments => o_slv_segments
    );

-------------------------------------------------------------------------------
    -- test bench definition.
    tb_CLK :process
    begin
        for num in 0 to 9 loop
            number <= std_logic_vector(to_unsigned(num, 4));
            wait for 2 ns;
        end loop;
    end process;

END;

