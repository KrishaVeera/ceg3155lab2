library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dividerTB is
end dividerTB;

architecture Behavioral of dividerTB is
    signal OperandA, OperandB: std_logic_vector(3 downto 0);
    signal Greset: std_logic := '1';
    signal CLK: std_logic;
    signal REMQUO: std_logic_vector(7 downto 0);
    signal remainder, QUO: std_logic_vector(3 downto 0);
begin

    -- clock
    CLK_process: process is
    begin

        CLK <= '0';
        wait for 50 ns;
        CLK <= '1';
        wait for 50 ns;
    end process;

    Greset <= '0' after 100 ns;

    -- dividend / divisor
    -- dividend
    OperandA <= "0100";

    -- divisor
    OperandB <= "0010";

    remainder <= REMQUO(7 downto 4);
    
    QUO <= REMQUO(3 downto 0);

    divider: entity work.divider(struct)
        port map(OperandA, OperandB, Greset, CLK, REMQUO);

--    dividersigned: entity work.dividersigned(struct)
--        port map(OperandA, OperandB, Greset, CLK, REMQUO);

    

end Behavioral;