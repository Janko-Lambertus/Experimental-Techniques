---------------------------------------
-- lecture 02 shift register
-- just forwarding the signal
----------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------

entity segment7 is
    port(   
        i_slv_number   :  in  std_logic_vector( 3 downto 0);  -- number input   0 - 9
        o_slv_segments :  out std_logic_vector( 6 downto 0)   -- segment output G - A
    );
end segment7;  

----------------------------------------

architecture behavior of segment7 is
begin
    process(i_slv_number)
    begin
        segLUT: case i_slv_number is       --"GFEDCBA"
            when "0000" => o_slv_segments <= "0111111"; -- 0
            when "0001" => o_slv_segments <= "0000011"; -- 1
            when "0010" => o_slv_segments <= "1011011"; -- 2
            when "0011" => o_slv_segments <= "1001111"; -- 3
            when "0100" => o_slv_segments <= "1100110"; -- 4
            when "0101" => o_slv_segments <= "1101101"; -- 5
            when "0110" => o_slv_segments <= "1111101"; -- 6
            when "0111" => o_slv_segments <= "0000111"; -- 7
            when "1000" => o_slv_segments <= "1111111"; -- 8
            when "1001" => o_slv_segments <= "1101111"; -- 9
            when others => 
                         o_slv_segments <= "1000000";

        end case segLUT;
    end process;
end behavior;

------------------------------------------
