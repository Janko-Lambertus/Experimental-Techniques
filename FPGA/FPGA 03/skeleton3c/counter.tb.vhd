library ieee;
use ieee.std_logic_1164.all;

ENTITY counter_tb IS
END counter_tb;

ARCHITECTURE tb OF counter_tb IS 
    COMPONENT counter is
	generic(DATA_WIDTH : integer :=8);
        port(	
            i_sl_CLK      : in  std_logic;
	    i_sl_dir    : in  std_logic;
	    i_sl_en     : in  std_logic;
	    i_sl_rst  : in  std_logic;
	    o_slv_counter : out std_logic_vector(DATA_WIDTH-1 downto 0)
        );
    end COMPONENT;

    -- "local" signals
    constant DATA_WIDTH : integer := 8;
    -- signals for UUT
    -- input 
    signal CLK    : std_logic := '0';
    signal dir    : std_logic := '0';
    signal en    : std_logic := '0';
    signal rst : std_logic := '0';


    -- ouput
    signal o_slv_shift : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');

BEGIN 
    -- Instance of unit under test.
    uut: counter
    GENERIC MAP(DATA_WIDTH => 8)
    PORT MAP (
        i_sl_CLK  => CLK,
	i_sl_dir => dir,
	i_sl_en => en,
	i_sl_rst => rst,
	o_slv_counter => o_slv_counter
    );

-------------------------------------------------------------------------------
    -- test bench definition.
    tb_CLK :process
    begin
        CLK <= '0';
        wait for 1 ns;
        CLK <= '1';
        wait for 1 ns;
    end process;

    tb_rst: process
    begin
        wait for 300 ns;
        rst <= '1';
        wait for 1 ns;
        en  <= '0';
        wait for 1 ns;
        en  <= '1';
        rst <= '0';
        wait for 10 us;
    end process;

END;
