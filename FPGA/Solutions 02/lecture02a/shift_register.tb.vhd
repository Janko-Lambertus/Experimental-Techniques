library ieee;
use ieee.std_logic_1164.all;

ENTITY lecture02_tb IS
END lecture02_tb;

ARCHITECTURE tb OF lecture02_tb IS 

    COMPONENT lecture02 is
        port(	
		i_sl_CLK     :  in  std_logic;                      -- clock
		i_sl_en      :  in  std_logic;                      -- enable
		i_sl_dir     :  in  std_logic;                      -- direction
		o_slv_shift  :  out std_logic_vector(7 downto 0)    -- shift register
        );
    end COMPONENT;

    -- "local" signals

    -- signals for UUT
    -- input 
    signal CLK    : std_logic := '0';
    signal en     : std_logic := '0';
    signal dir    : std_logic := '0';

    -- ouput
    signal o_slv_shift : std_logic_vector(7 downto 0) := (others => '0');

BEGIN 
    -- Instance of unit under test.
    uut: lecture02 
    PORT MAP (
        i_sl_CLK    => CLK,
        i_sl_en     => en,
        i_sl_dir    => dir,
        o_slv_shift => o_slv_shift
    );

-------------------------------------------------------------------------------
    -- test bench definition.
    tb_CLK :process
    begin
        CLK <= '0';
        wait for 10 ns;
        CLK <= '1';
        wait for 10 ns;
    end process;

    tb_en : process
    begin
        en <= '0';
        wait for 600 ns;
        en <= '1';
        wait for 600 ns;
    end process;

    tb_dir : process
    begin
        dir <= '0';
        wait for 300 ns;
        dir <= '1';
        wait for 300 ns;
    end process;

END;

