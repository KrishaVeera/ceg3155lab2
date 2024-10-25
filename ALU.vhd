library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
end ALU;

architecture Behavioral of ALU is
    signal OperationSelect: std_logic_vector(1 downto 0);
    signal OperandA, OperandB: std_logic_vector(3 downto 0);
    signal Greset: std_logic := '1';
    signal CLK: std_logic;
    signal MUXout: std_logic_vector(7 downto 0);
    signal CarryOut, ZeroOut, OverflowOut: std_logic;
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

    OperandA <= "1110";

    OperandB <= "0011";

    --OperationSelect <= "00";
    --OperationSelect <= "01";
    OperationSelect <= "10";
    --OperationSelect <= "11";

    fixedPointALU: entity work.FP_ALU(struct)
        port map(OperationSelect, OperandA, OperandB, Greset, CLK, MUXout, CarryOut, ZeroOut, OverflowOut);

end Behavioral;