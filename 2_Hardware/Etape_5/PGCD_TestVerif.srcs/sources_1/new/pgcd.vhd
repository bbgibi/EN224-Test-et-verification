----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2021 15:40:03
-- Design Name: 
-- Module Name: pgcd - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pgcd is
port (
    CLK      : in  STD_LOGIC;
    RESET    : in  STD_LOGIC;

    idata_a  : in  STD_LOGIC_VECTOR (31 downto 0);
    idata_b  : in  STD_LOGIC_VECTOR (31 downto 0);
    idata_en : in  STD_LOGIC;

    odata    : out STD_LOGIC_VECTOR (31 downto 0);
    odata_en : out STD_LOGIC
);
end pgcd;

architecture Behavioral of pgcd is
    type State is ( Wait0 , Compute, Store );
    signal pr_state , nx_state : State := Wait0;
    signal result : integer;
    signal n1, n2 : integer;
    signal count_clk : integer;
begin

    state_update : process ( clk , reset ) --On utilise qu'un seul process
    begin
        if reset = '1' then
            odata <= (others => '0');
            odata_en <= '0';
            pr_state <= Wait0;
        elsif rising_edge(clk) then
            case pr_state is
                when Wait0 => 
                    -- pragma translate_off
                    count_clk <= 0;
                    -- pragma translate_on
                    
                    -- Gestion des sorties
                        odata_en <= '0';
                    if (idata_en = '1') then
                    -- Pre-assert
                        assert (unsigned(idata_a) <= to_unsigned(65535, idata_a'length));
                        assert (unsigned(idata_b) <= to_unsigned(65535, idata_b'length));
                    -- Calcul du prochain etat
                        pr_state <= Compute ;
                    -- Gestion des calculs
                        n1 <= to_integer(unsigned(idata_a));
                        n2 <= to_integer(unsigned(idata_b));
                    
                    else
                        pr_state <= Wait0 ;
                    end if;
                    
            when Compute => 
                -- pragma translate_off
                    count_clk <= count_clk + 1;
                    -- pragma translate_on
                -- Gestion des sorties
                    odata_en <= '0';
                -- Calcul du prochain etat
                if ((n1 = 0) or (n2 = 0) or (n1 = n2)) then
                    if (n1 = 0) then
                        n1 <= n2; --result <= n2
                    elsif (n2 = 0) then
                        n1 <= n1; --result <= n1
                    end if;
                
                    pr_state <= Store;
                else
                -- Gestion des calculs
                    if (n1 > n2) then
                        n1 <= n1 - n2;
                    else
                        n2 <= n2 - n1;
                    end if;
--                    result <= n1;
                    pr_state <= Compute;
                end if;
                
            when Store =>
                REPORT "compteur clock : " & integer'image(count_clk);
                -- Post-assert
                assert (n1 >= 0);
                assert (n1 <= 65535);
                assert (n1 <= n2);
                -- Calcul du prochain etat
                pr_state <= Wait0;
                -- Gestion des sorties
                odata_en <= '1';
                odata <= std_logic_vector(to_unsigned(n1, odata'length));
                -- Gestion des calculs
            
        end case;
        end if;
    end process state_update ;
    
   
    

end Behavioral;
