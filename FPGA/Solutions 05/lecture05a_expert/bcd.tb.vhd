library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use ieee.MATH_REAL.all;

ENTITY bcd_tb IS
END bcd_tb;

ARCHITECTURE tb OF bcd_tb IS 

    COMPONENT bcd is
    --    GENERIC (
    --    );
        port(   
            i_slv_binary   :   in std_logic_vector( 7     downto 0);
            o_slv_decimal  :  out std_logic_vector( 3*4-1 downto 0) 
        );
    end component bcd;  

    -- "local" signals

    -- signals for UUT
    -- input 
    signal binary   : std_logic_vector( 7 downto 0) := (others => '0') ; 

    -- ouput
    signal decimal  : std_logic_vector( 3*4-1 downto 0);

    signal ones : std_logic_vector(3 downto 0);
    signal tens : std_logic_vector(3 downto 0);
    signal hundrets : std_logic_vector(3 downto 0);

BEGIN 
    -- Instance of unit under test.
    bcd1: bcd 
        port map(   
            i_slv_binary  => binary,
            o_slv_decimal => decimal
        );


    ones     <= decimal(3 downto 0);
    tens     <= decimal(7 downto 4);
    hundrets <= decimal(11 downto 8);

-------------------------------------------------------------------------------
    -- test bench definition.
    tb_test :process
    begin
        for bin in 0 to 255 loop
            binary <= std_logic_vector(to_unsigned(bin, 8));
            wait for 2 ns;
        end loop;

    end process;

--    tb_test2 : process
--    begin
--        for i in 0 to 8 loop
--            report integer'image(i);
--        end loop;
--    end process;

END;

