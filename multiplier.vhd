library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplier is
 Port (
    OperandA, OperandB: in std_logic_vector(3 downto 0);
    Greset, CLK: in std_logic;
    P: out std_logic_vector(7 downto 0)
 );
end Multiplier;

architecture struct of Multiplier is
    signal loadA, loadB, LSHA, RSHB, PSel, loadP: std_logic;
    signal b0, z: std_logic;
    signal AIN: std_logic_vector(7 downto 0);
    signal invertedCLK: std_logic;
begin

    invertedCLK <= not(CLK);

    AIN(7 downto 4) <= "0000";
    AIN(3 downto 0) <= OperandA;
    
    Datapath: entity work.multiplierDatapath(struct)
        port map(AIN, OperandB, loadA, loadB, LSHA, RSHB, PSel, loadP, CLK, b0, z, P);

    Controllogic: entity work.multiplierControl(struct)
        port map(Greset, invertedCLK, z, b0, loadA, loadB, LSHA, RSHB, PSel, loadP);

end ;