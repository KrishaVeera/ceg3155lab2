library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity downcounterTB is
end downcounterTB;

architecture Behavioral of downcounterTB is
    signal CLK, LC, c: std_logic;
    signal EC: std_logic := '0';
begin
    -- clock
    CLK_process: process is
    begin

        CLK <= '0';
        wait for 50 ns;
        CLK <= '1';
        wait for 50 ns;
    end process;

    LC <= '1';
    EC <= '1' after 100 ns;

    counter: entity work.downcounter(struct)
        port map(LC,EC,CLK,c);

end Behavioral;