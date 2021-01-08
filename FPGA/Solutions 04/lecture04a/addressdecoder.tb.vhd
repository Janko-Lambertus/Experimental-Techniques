library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY addressdecoder_tb IS
END addressdecoder_tb;

ARCHITECTURE tb OF addressdecoder_tb IS 

    constant DATA_BITS : integer := 3;   -- 3 bits address input => 2**3 possible addresses

    COMPONENT addressdecoder is
        generic(
            DATA_BITS     :  integer := 3;
            ONE_HOT       :  std_logic := '1'
        );
        port(   
            i_sl_en       :  in  std_logic;                                 -- enable
            i_slv_address :  in  std_logic_vector(DATA_BITS-1 downto 0);     -- address input
            o_slv_decoder :  out std_logic_vector( (2**DATA_BITS) -1  downto 0)   -- decoded output
        );
    end COMPONENT;

    -- "local" signals

    -- signals for UUT
    -- input 
    signal en     : std_logic := '1';

    signal address : std_logic_vector( DATA_BITS -1 downto 0) := (others => '0');

    -- ouput
    signal o_slv_decoder1hot  : std_logic_vector( (2**DATA_BITS)-1 downto 0) := (others => '0');
    signal o_slv_decoder1cold : std_logic_vector( (2**DATA_BITS)-1 downto 0) := (others => '0');

BEGIN 
    -- Instance of unit under test.
    AD1HOT: addressdecoder 
    generic map(
        DATA_BITS     => DATA_BITS,
        ONE_HOT       => '1'
    )
    PORT MAP (
        i_sl_en       => en,
        i_slv_address => address,
        o_slv_decoder => o_slv_decoder1hot
    );
    AD1COLD: addressdecoder 
    generic map(
        DATA_BITS     => DATA_BITS,
        ONE_HOT       => '0'
    )
    PORT MAP (
        i_sl_en       => en,
        i_slv_address => address,
        o_slv_decoder => o_slv_decoder1cold
    );

-------------------------------------------------------------------------------
    -- test bench definition.
    tb_CLK :process
    begin
        for AD in 0 to (2**DATA_BITS)-1 loop
            address <= std_logic_vector(to_unsigned(AD, DATA_BITS));
            wait for 2 ns;
        end loop;
    end process;

END;

