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
        if (i_sl_en = '1') then
            if ONE_HOT then
                adecoded <= (others => '0');
                adecoded( to_integer( unsigned(i_slv_address))  ) <= '1';
            else
                adecoded <= (others => '1');
                adecoded( to_integer( unsigned(i_slv_address))  ) <= '0';
            end if;
        end if;
    end process;

    o_slv_decoder <= std_logic_vector(adecoded);

end behavior;

------------------------------------------
