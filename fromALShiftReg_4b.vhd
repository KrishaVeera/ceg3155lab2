library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity fromAluShiftReg_4bit is
 Port (
    LOAD, SHIFTL, CLK: in std_logic;
    INPUT: in std_logic_vector(3 downto 0);
    OUTPUT: out std_logic_vector(3 downto 0);
    ASout: out std_logic
 );
end fromAluShiftReg_4bit;

architecture struct of fromAluShiftReg_4bit is
    signal signalenardFF_2: std_logic_vector(3 downto 0);
    signal signalMUX: std_logic_vector(3 downto 0);
    signal signalQshift: std_logic_vector(3 downto 0);
begin
    -- Shift signal logic
    signalQshift(3 downto 1) <= signalenardFF_2(2 downto 0);
    signalQshift(0) <= '0';

    ENDFF_0: entity work.enardFF_2(rtl)
        port map(signalMUX(0), LOAD, CLK, signalenARdFF_2(0));
    ENDFF_1: entity work.enardFF_2(rtl)
        port map(signalMUX(1), LOAD, CLK, signalenARdFF_2(1));
    ENDFF_2: entity work.enardFF_2(rtl)
        port map(signalMUX(2), LOAD, CLK, signalenARdFF_2(2));
    ENDFF_3: entity work.enardFF_2(rtl)
        port map(signalMUX(3), LOAD, CLK, signalenARdFF_2(3));
    
    -- SHIFTL is the select to determine the register's input
    -- OUTPUT <= left shifted signal if SHIFTL is 1
    -- OUTPUT <= INPUT signal if SHIFTL is 0
        mux2to1_4b: entity work.mux2to1_4b(struct)
        port map(INPUT, signalQshift, SHIFTL, signalMUX);
    OUTPUT <= signalenardFF_2;
    ASout <= signalenardFF_2(3);

end ;