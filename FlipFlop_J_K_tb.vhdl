library ieee;
use ieee.std_logic_1164.all;

entity flipflop_J_K_tb is
end flipflop_J_K_tb;

architecture behavioral of flipflop_J_K_tb is

  component flipflop_J_K
  port(
    j: in std_logic;
    k: in std_logic;
    clk: in std_logic;
    rst: in std_logic;
    q: out std_logic;
    qb: out std_logic);
  end component;

  signal j : std_logic := '0';
  signal k : std_logic := '0';
  signal clk : std_logic := '0';
  signal rst : std_logic := '0';
  signal q : std_logic;
  signal qb : std_logic;

  constant clk_period : time := 10 ns;

  begin

    flipflop_J_K_0: flipflop_J_K port map (
          j => j,
          k => k,
          clk => clk,
          rst => rst,
          q => q,
          qb => qb
        );

        clk_process :process
    begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
    end process;

    stim_proc: process
    begin

    rst <= '1';
    wait for 50 ns;

    rst <= '0';
    j <= '0';
    k <= '1';
    wait for 50 ns;

    rst <= '0';
    j <= '1';
    k <= '0';
    wait for 50 ns;

    rst <= '0';
    j <= '1';
    k <= '1';
    wait for 50 ns;

    rst <= '0';
    j <= '0';
    k <= '0';
    wait for 50 ns;
    assert false report "end of test" severity note;
    wait;
  end process;
end behavioral;
