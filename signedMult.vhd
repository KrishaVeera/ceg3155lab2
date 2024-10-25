library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity signedMult is
 Port (
    OperandA, OperandB: in std_logic_vector(3 downto 0);
    Greset, CLK: in std_logic;
    P: out std_logic_vector(7 downto 0)
 );
end signedMult;

architecture struct of signedMult is
    signal signXOR: std_logic;
    signal Acomp, Bcomp, AMUXOUT, BMUXOUT: std_logic_vector(3 downto 0);
    signal PMUXOUT, Pcomp, MULTIPLIEROUT: std_logic_vector(7 downto 0);
begin
    
    signXOR <= OperandA(3) xor OperandB(3);

    Acomplementer: entity work.complement4bit(struct)
        port map(OperandA, Acomp);
    
    Bcomplementer: entity work.complement4bit(struct)
        port map(OperandB, Bcomp);
    
    AMUX: entity work.mux2to1_4b(struct)
        port map(OperandA, Acomp, OperandA(3), AMUXOUT);

    BMUX: entity work.mux2to1_4b(struct)
        port map(OperandB, Bcomp, OperandB(3), BMUXOUT);

    Multiplier: entity work.Multiplier(struct)
        port map(AMUXOUT, BMUXOUT, Greset, CLK, MULTIPLIEROUT);

    Pcomplementer: entity work.complement8bit(struct)
        port map(MULTIPLIEROUT, Pcomp);

    PMUX: entity work.mux2to1_8b(struct)
        port map(MULTIPLIEROUT, Pcomp, signXOR, PMUXOUT);

    P <= PMUXOUT;

end ;