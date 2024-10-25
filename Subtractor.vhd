library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Basically complimenting the second operand to make it negative, and using the addition logic.

entity Subtractor is
 Port (
    OperandA, OperandB: in std_logic_vector(3 downto 0);
    sum: out std_logic_vector(7 downto 0);
    CarryOut, OverflowOut: out std_logic
 );
end Subtractor;

architecture struct of Subtractor is
	 signal Bcomp: std_logic_vector(3 downto 0);
    signal adderSUM: std_logic_vector(3 downto 0);
    signal adderCarryOut: std_logic;
    signal dPP, dGG: std_logic;
    signal CLAcarry: std_logic_vector(4 downto 0);
begin

	 Bcomplementer: entity work.complement4bit(struct)
		  port map(OperandB, Bcomp);
		  
    Adder: entity work.add4bit(struct)
        port map(OperandA, Bcomp, '0', adderSUM, adderCarryOut);

    carrylookahead: entity work.carrylookahead(structural)
        port map(OperandA, Bcomp, '0', dPP, dGG, CLAcarry);

    sum(7 downto 4) <= "0000";
    sum(3 downto 0) <= adderSUM;

    CarryOut <= adderCarryOut;
    OverflowOut <= CLAcarry(4) xor CLAcarry(3);

end ;