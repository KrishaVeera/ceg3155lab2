library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- left shift register
entity LeftShiftReg_8b is
    port(
        LOAD, SHIFTL, CLK: in std_logic;
        INPUT: in std_logic_vector(7 downto 0);
        OUTPUT: out std_logic_vector(7 downto 0)
    );
end LeftShiftReg_8b;

architecture struct OF LeftShiftReg_8b is
    signal signalenardFF_2: std_logic_vector(7 downto 0);
    signal signalMUX: std_logic_vector(7 downto 0);
    signal signalQshift: std_logic_vector(7 downto 0);
    -- signal signal8bINPUT: std_logic_vector(7 downto 0);
begin

    -- signal8bINPUT(7 downto 4) <= "0000";
    -- signal8bINPUT(3 downto 0) <= INPUT;

    -- Shift signal logic
    signalQshift(7 downto 1) <= signalenardFF_2(6 downto 0);
    signalQshift(0) <= '0';

    enardFF_2_0: entity work.enardFF_2(rtl)
        port map(signalMUX(0), LOAD, CLK, signalenardFF_2(0));
    enardFF_2_1: entity work.enardFF_2(rtl)
        port map(signalMUX(1), LOAD, CLK, signalenardFF_2(1));
    enardFF_2_2: entity work.enardFF_2(rtl)
        port map(signalMUX(2), LOAD, CLK, signalenardFF_2(2));
    enardFF_2_3: entity work.enardFF_2(rtl)
        port map(signalMUX(3), LOAD, CLK, signalenardFF_2(3));
    enardFF_2_4: entity work.enardFF_2(rtl)
        port map(signalMUX(4), LOAD, CLK, signalenardFF_2(4));
    enardFF_2_5: entity work.enardFF_2(rtl)
        port map(signalMUX(5), LOAD, CLK, signalenardFF_2(5));
    enardFF_2_6: entity work.enardFF_2(rtl)
        port map(signalMUX(6), LOAD, CLK, signalenardFF_2(6));
    enardFF_2_7: entity work.enardFF_2(rtl)
        port map(signalMUX(7), LOAD, CLK, signalenardFF_2(7));
    
    -- SHIFTL is the select to determine the register's input
    -- OUTPUT <= left shifted signal if SHIFTL is 1
    -- OUTPUT <= INPUT signal if SHIFTL is 0
        MUX2to1_8b: entity work.mux2to1_8b(struct)
        port map(INPUT, signalQshift, SHIFTL, signalMUX);
    OUTPUT <= signalenardFF_2;
end struct;