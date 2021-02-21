-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity pgcd_tb is
end;

architecture bench of pgcd_tb is

  component pgcd
  port (
      CLK      : in  STD_LOGIC;
      RESET    : in  STD_LOGIC;
      idata_a  : in  STD_LOGIC_VECTOR (31 downto 0);
      idata_b  : in  STD_LOGIC_VECTOR (31 downto 0);
      idata_en : in  STD_LOGIC;
      odata    : out STD_LOGIC_VECTOR (31 downto 0);
      odata_en : out STD_LOGIC
  );
  end component;

  signal CLK: STD_LOGIC;
  signal RESET: STD_LOGIC;
  signal idata_a: STD_LOGIC_VECTOR (31 downto 0);
  signal idata_b: STD_LOGIC_VECTOR (31 downto 0);
  signal idata_en: STD_LOGIC;
  signal odata: STD_LOGIC_VECTOR (31 downto 0);
  signal odata_en: STD_LOGIC ;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: pgcd port map ( CLK      => CLK,
                       RESET    => RESET,
                       idata_a  => idata_a,
                       idata_b  => idata_b,
                       idata_en => idata_en,
                       odata    => odata,
                       odata_en => odata_en );

  stimulus: process
  begin
  
    -- Put initialisation code here
    idata_a <= (others => '0');
    idata_b <= (others => '0');
    idata_en <= '0';
    reset <= '1';
    wait for 5 ns;
    reset <= '0';
    wait for 5 ns;
    

    -- Put test bench stimulus code here
    
    idata_a <= std_logic_vector(to_unsigned(45298, 32));
    idata_b <= std_logic_vector(to_unsigned(22081, 32));
    idata_en <= '1';
    wait for clock_period;
    while odata_en = '0' loop
        idata_en <= '0';
        wait for clock_period;
    end loop;
    assert (unsigned(odata) = to_unsigned(71, 32)) severity error;
    
    idata_a <= std_logic_vector(to_unsigned(64677, 32));
    idata_b <= std_logic_vector(to_unsigned(44710, 32));
    idata_en <= '1';
    wait for clock_period;
    while odata_en = '0' loop
        idata_en <= '0';
        wait for clock_period;
    end loop;
    assert (unsigned(odata) = to_unsigned(1, 32)) severity error;
    
    idata_a <= std_logic_vector(to_unsigned(20738, 32));
    idata_b <= std_logic_vector(to_unsigned(30280, 32));
    idata_en <= '1';
    wait for clock_period;
    while odata_en = '0' loop
        idata_en <= '0';
        wait for clock_period;
    end loop;
    assert (unsigned(odata) = to_unsigned(2, 32)) severity error;
    
    idata_a <= std_logic_vector(to_unsigned(48946, 32));
    idata_b <= std_logic_vector(to_unsigned(47937, 32));
    idata_en <= '1';
    wait for clock_period;
    while odata_en = '0' loop
        idata_en <= '0';
        wait for clock_period;
    end loop;
    assert (unsigned(odata) = to_unsigned(1, 32)) severity error;
    
    idata_a <= std_logic_vector(to_unsigned(17079, 32));
    idata_b <= std_logic_vector(to_unsigned(50101, 32));
    idata_en <= '1';
    wait for clock_period;
    while odata_en = '0' loop
        idata_en <= '0';
        wait for clock_period;
    end loop;
    assert (unsigned(odata) = to_unsigned(1, 32)) severity error;
    
    idata_a <= std_logic_vector(to_unsigned(38357, 32));
    idata_b <= std_logic_vector(to_unsigned(10282, 32));
    idata_en <= '1';
    wait for clock_period;
    while odata_en = '0' loop
        idata_en <= '0';
        wait for clock_period;
    end loop;
    assert (unsigned(odata) = to_unsigned(1, 32)) severity error;
    
    idata_a <= std_logic_vector(to_unsigned(28835, 32));
    idata_b <= std_logic_vector(to_unsigned(24754, 32));
    idata_en <= '1';
    wait for clock_period;
    while odata_en = '0' loop
        idata_en <= '0';
        wait for clock_period;
    end loop;
    assert (unsigned(odata) = to_unsigned(1, 32)) severity error;
    
    idata_a <= std_logic_vector(to_unsigned(9158, 32));
    idata_b <= std_logic_vector(to_unsigned(22156, 32));
    idata_en <= '1';
    wait for clock_period;
    while odata_en = '0' loop
        idata_en <= '0';
        wait for clock_period;
    end loop;
    assert (unsigned(odata) = to_unsigned(2, 32)) severity error;
    
    idata_a <= std_logic_vector(to_unsigned(20955, 32));
    idata_b <= std_logic_vector(to_unsigned(48786, 32));
    idata_en <= '1';
    wait for clock_period;
    while odata_en = '0' loop
        idata_en <= '0';
        wait for clock_period;
    end loop;
    assert (unsigned(odata) = to_unsigned(3, 32)) severity error;
    
    idata_a <= std_logic_vector(to_unsigned(6772, 32));
    idata_b <= std_logic_vector(to_unsigned(30121, 32));
    idata_en <= '1';
    wait for clock_period;
    while odata_en = '0' loop
        idata_en <= '0';
        wait for clock_period;
    end loop;
    assert (unsigned(odata) = to_unsigned(1, 32)) severity error;
    

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;