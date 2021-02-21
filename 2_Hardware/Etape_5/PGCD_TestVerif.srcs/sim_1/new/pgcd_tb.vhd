-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use STD.textio.all;
use ieee.std_logic_textio.all;

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
  
  file file_A : text;
  file file_B : text;
  file file_goldenPGCD : text;

begin

  uut: pgcd port map ( CLK      => CLK,
                       RESET    => RESET,
                       idata_a  => idata_a,
                       idata_b  => idata_b,
                       idata_en => idata_en,
                       odata    => odata,
                       odata_en => odata_en );

  stimulus: process
  variable v_ALINE  : line;
  variable v_BLINE  : line;
  variable v_CLINE  : line;
  variable v_A      : std_logic_vector(31 downto 0);
  variable v_B      : std_logic_vector(31 downto 0);
  variable v_C      : std_logic_vector(31 downto 0);
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

    file_open(file_A, "../../data_a.txt", read_mode);
    file_open(file_B, "../../data_b.txt", read_mode);
    file_open(file_goldenPGCD, "../../data_c.txt", read_mode);
    
    while not endfile(file_A) loop
        readline(file_A, v_ALINE);
        read(v_ALINE, v_A);
        idata_a <= v_A;
        
        readline(file_B, v_BLINE);
        read(v_BLINE, v_B);
        idata_b <= v_B;
        
        idata_en <= '1';
        wait for clock_period;
        while odata_en = '0' loop
            idata_en <= '0';
            wait for clock_period;
        end loop;
        
        readline(file_goldenPGCD, v_CLINE);
        read(v_CLINE, v_C);
        assert (unsigned(odata) = unsigned(v_C)) severity error;
        
    end loop;
    
--    idata_a <= std_logic_vector(to_unsigned(45298, 32));
--    idata_b <= std_logic_vector(to_unsigned(22081, 32));
--    idata_en <= '1';
--    wait for clock_period;
--    while odata_en = '0' loop
--        idata_en <= '0';
--        wait for clock_period;
--    end loop;
--    assert (unsigned(odata) = to_unsigned(71, 32)) severity error;

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