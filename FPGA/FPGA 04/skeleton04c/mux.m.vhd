---------------------------------------
-- lecture 02 shift register
-- just forwarding the signal
----------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------

entity mux is
    GENERIC (
        OUTPUT_BITS    : integer := 4;  -- how many bits does each output have
        SLOTS          : integer := 2   -- giving how many slots we would like to mux
    );
    port(   
        i_slv_select  :   in std_logic_vector( 1 downto 0);
        i_slv_input   :   in std_logic_vector( 15 downto 0);-- insert size here
        o_slv_output  :  out std_logic_vector( OUTPUT_BITS-1 downto 0)-- insert size here
    );
end mux;  

----------------------------------------

architecture behavior of mux is
begin
	process(i_slv_input, i_slv_select)
	begin
		o_slv_output <= i_slv_input(to_integer(unsigned(i_slv_select))*4+3 downto to_integer(unsigned(i_slv_select))*4);
	end process;
end behavior;

------------------------------------------
