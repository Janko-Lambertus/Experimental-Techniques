---------------------------------------
-- lecture 02 shift register
-- just forwarding the signal
----------------------------------------

library ieee;
use ieee.std_logic_1164.all;

----------------------------------------

entity lecture02 is
    port(   
        i_sl_CLK     :  in  std_logic;                      -- clock
        i_sl_en      :  in  std_logic;                      -- enable
        i_sl_dir     :  in  std_logic;                      -- direction
        o_slv_shift  :  out std_logic_vector(7 downto 0)    -- shift register
    );
end lecture02;  

----------------------------------------

architecture behavior of lecture02 is
    signal shift_reg : std_logic_vector(7 downto 0) := "00000001";  -- define signal, because we cannot readback outputs
begin

    process(i_sl_CLK)
    begin
        if rising_edge(i_sl_CLK) then
            if (i_sl_en = '1') then
                if(i_sl_dir = '1') then
                    shift_reg <= shift_reg(6 downto 0) & shift_reg(7);
                else
                    shift_reg <= shift_reg(0) & shift_reg(7 downto 1);
                end if;
            end if;
            o_slv_shift <= shift_reg;
        end if;
    end process;

end behavior;

------------------------------------------
