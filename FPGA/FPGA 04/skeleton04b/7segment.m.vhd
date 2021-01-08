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
	    Bums: case i_slv_number is
			when "0000" => o_slv_segments <= "0000001";
			when "0001" => o_slv_segments <= "0000011";
			when "0010" => o_slv_segments <= "0000111";
			when "0011" => o_slv_segments <= "0001111";
			when "0100" => o_slv_segments <= "0011111";
			when "0101" => o_slv_segments <= "0111111";
			when "0110" => o_slv_segments <= "1111111";
			when "0111" => o_slv_segments <= "1010101";
			when "1000" => o_slv_segments <= "0101010";
			when others => o_slv_segments <= "0001111";
		    end case bums;
	end process;

end behavior;

------------------------------------------
