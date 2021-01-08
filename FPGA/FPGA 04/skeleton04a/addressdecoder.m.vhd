---------------------------------------
-- lecture 02 shift register
-- just forwarding the signal
----------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------

entity addressdecoder is
    generic(
        DATA_BITS     :  integer := 3;
        ONE_HOT       :  std_logic := '1'
    );
    port(   
        i_sl_en       :  in  std_logic;                                 -- enable
        i_slv_address :  in  std_logic_vector(DATA_BITS-1 downto 0);     -- address input
        o_slv_decoder :  out std_logic_vector( (2**DATA_BITS) -1  downto 0)   -- decoded output
    );
end addressdecoder;  

----------------------------------------

architecture behavior of addressdecoder is
    signal adecoded : unsigned( (2**DATA_BITS)-1 downto 0) := (others => '0');  -- define signal, because we cannot readback outputs
begin

    process(i_slv_address, i_sl_en)
    begin
	o_slv_decoder <= 

    end process;

end behavior;

------------------------------------------
