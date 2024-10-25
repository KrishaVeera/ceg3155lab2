library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FP_ALU is
 Port (
    OperationSelect: in std_logic_vector(1 downto 0);
    OperandA, OperandB: in std_logic_vector(3 downto 0);
    Greset, CLK: in std_logic;
    MUXout: out std_logic_vector(7 downto 0);
    CarryOut, ZeroOut, OverflowOut: out std_logic
 );
end FP_ALU;

architecture struct of FP_ALU is
    signal adderOUT, subtractorOUT, signedmultiplierOUT, dividersignedOUT: std_logic_vector(7 downto 0);
    signal adderCarryout, subtractorCarryout, adderOverflowout, subtractorOverflowout: std_logic;
    signal signalMUXOUT: std_logic_vector(7 downto 0);
begin
    ADDER: entity work.Adder(struct)
        port map(OperandA, OperandB, adderOUT, adderCarryout, adderOverflowout);

    SUBTRACTOR: entity work.Subtractor(Struct)
        port map(OperandA, OperandB, subtractorOUT, subtractorCarryout, subtractorOverflowout);

    MULTIPLIER: entity work.signedMult(struct)
        port map(OperandA, OperandB, Greset, CLK, signedmultiplierOUT);

    divider: entity work.dividersigned(struct)
        port map(OperandA, OperandB, Greset, CLK, dividersignedOUT);

    CarryOutMUX: entity work.mux4to1(struct)
        port map(adderCarryout, '0', subtractorCarryout, '0', OperationSelect(1), OperationSelect(0), CarryOut);

    OverflowOutMUX: entity work.mux4to1(struct)
        port map(adderOverflowout, '0', subtractorOverflowout, '0', OperationSelect(1), OperationSelect(0), OverflowOut);

    ALUOUTMUX: entity work.mux4to1_8b(struct)
        port map(adderOUT, signedmultiplierOUT, subtractorOUT, dividersignedOUT, OperationSelect(1), OperationSelect(0), signalMUXOUT);

    ZeroOutNOR: entity work.norgate_8b(struct)
        port map(signalMUXOUT, ZeroOut);

    MUXout <= signalMUXOUT;

end ;