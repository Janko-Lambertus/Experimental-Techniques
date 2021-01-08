---------------------------------------
-- lecture 02 shift register
-- just forwarding the signal
----------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

----------------------------------------

entity counter is
    generic(
        DATA_WIDTH    :  integer := 8
    );
    port(   
        i_sl_CLK      :  in  std_logic;                                 -- clock
        i_sl_en       :  in  std_logic;                                 -- enable
        i_sl_dir      :  in  std_logic;                                 -- direction
        i_sl_rst      :  in  std_logic;                                 -- reset
        o_slv_counter :  out std_logic_vector(DATA_WIDTH-1  downto 0)   -- counter
    );
end counter;  

----------------------------------------

architecture behavior of counter is
    signal cnt : unsigned(DATA_WIDTH-1 downto 0) := (others => '0');  -- define signal, because we cannot readback outputs
begin

    process(i_sl_CLK)
    begin
        if rising_edge(i_sl_CLK) then
            if (i_sl_en = '1') then
                if(i_sl_dir = '0') then
                    cnt <= cnt + 1;
                else
                    cnt <= cnt - 1;
                end if;
            elsif ( i_sl_rst = '1') then
                cnt <= (others => '0');
            end if;
            o_slv_counter <= std_logic_vector(cnt);
        end if;
    end process;

end behavior;

------------------------------------------
