library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Right shift register
entity RightShiftReg_4b is
    port(
        LOAD, SHIFTR, CLK: in std_logic;
        INPUT: in std_logic_vector(3 downto 0);
        OUTPUT: out std_logic_vector(3 downto 0)
    );
end RightShiftReg_4b;

architecture struct OF RightShiftReg_4b is
    signal signalenardFF_2: std_logic_vector(3 downto 0);
    signal signalMUX: std_logic_vector(3 downto 0);
    signal signalQshift: std_logic_vector(3 downto 0);
begin
    -- Shift signal logic
    signalQshift(2 downto 0) <= signalenardFF_2(3 downto 1);
    signalQshift(3) <= '0';

    enardFF_2_0: entity work.enardFF_2(rtl)
        port map(signalMUX(0), LOAD, CLK, signalenardFF_2(0));
    enardFF_2_1: entity work.enardFF_2(rtl)
        port map(signalMUX(1), LOAD, CLK, signalenardFF_2(1));
    enardFF_2_2: entity work.enardFF_2(rtl)
        port map(signalMUX(2), LOAD, CLK, signalenardFF_2(2));
    enardFF_2_3: entity work.enardFF_2(rtl)
        port map(signalMUX(3), LOAD, CLK, signalenardFF_2(3));
   
    -- SHIFTR is the select to determine the register's input
    -- OUTPUT <= right shifted signal if SHIFTR is 1
    -- OUTPUT <= INPUT signal if SHIFTR is 0
        MUX2to1_4b: entity work.mux2to1_4b(struct)
        port map(INPUT, signalQshift, SHIFTR, signalMUX);
    OUTPUT <= signalenardFF_2;
end struct;