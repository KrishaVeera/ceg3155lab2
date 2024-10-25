library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dividersigned is
 Port (
    OperandA, OperandB: in std_logic_vector(3 downto 0);
    Greset, CLK: in std_logic;
    REMQUO: out std_logic_vector(7 downto 0)
 );
end dividersigned;

architecture struct of dividersigned is
    signal signXOR: std_logic;
    signal Acomp, Bcomp, AMUXOUT, BMUXOUT, QUOcomp: std_logic_vector(3 downto 0);
    signal REMQUOMUXOUT, REMQUOcomp, dividerOUT: std_logic_vector(7 downto 0);
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

    divider: entity work.divider(struct)
        port map(AMUXOUT, BMUXOUT, Greset, CLK, dividerOUT);

    QUOcomplementer: entity work.complement4bit(struct)
        port map(dividerOUT(3 downto 0), QUOcomp);

    REMQUOcomp(7 downto 4) <= dividerOUT(7 downto 4);
    REMQUOcomp(3 downto 0) <= QUOcomp;

    REMQUOMUX: entity work.mux2to1_8b(struct)
        port map(dividerOUT, REMQUOcomp, signXOR, REMQUOMUXOUT);

    REMQUO <= REMQUOMUXOUT;

end ;