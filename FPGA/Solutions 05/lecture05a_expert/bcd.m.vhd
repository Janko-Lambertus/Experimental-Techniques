---------------------------------------
-- lecture 02 shift register
-- just forwarding the signal
----------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use ieee.MATH_REAL.all;

----------------------------------------

entity bcd is
--    GENERIC (
--    );
    port(   
        i_slv_binary   :   in std_logic_vector( 7     downto 0);
        o_slv_decimal  :  out std_logic_vector( 3*4-1 downto 0) 
    );
end bcd;  

----------------------------------------

architecture behavior of bcd is


begin
    process(i_slv_binary)
        -- temporarly variables
        variable huns : std_logic_vector ( 3 downto 0) := (others => '0');
        variable tens : std_logic_vector ( 3 downto 0) := (others => '0');
        variable ones : std_logic_vector ( 3 downto 0) := (others => '0');
    begin
        -- reset all outputs
        huns := (others => '0');
        tens := (others => '0');
        ones := (others => '0');

        for i in 7 downto 0 loop
            
            if ( unsigned(huns) >= 5 ) then
                huns := std_logic_vector( unsigned(huns) + 3);
            end if;
            if ( unsigned(tens) >= 5 ) then
                tens := std_logic_vector( unsigned(tens) + 3);
            end if;
            if ( unsigned(ones) >= 5 ) then
                ones := std_logic_vector( unsigned(ones) + 3);
            end if;

            huns := huns(2 downto 0) & tens(3);
            tens := tens(2 downto 0) & ones(3);
            ones := ones(2 downto 0) & i_slv_binary(i);

        end loop;

        o_slv_decimal <=  huns & tens & ones;

    end process;
end behavior;

------------------------------------------
