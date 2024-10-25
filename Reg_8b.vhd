library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- input and output are 8 bit std_logic_vectors
-- LOAD is given as the EN signal for the enardFF_2
entity Reg_8b is
    port(
        LOAD, CLK: in std_logic;
        INPUT: in std_logic_vector(7 downto 0);
        OUTPUT: out std_logic_vector(7 downto 0)
    );
end Reg_8b;

architecture struct OF Reg_8b is
    signal signalenardFF_2: std_logic_vector(7 downto 0);
begin
    enardFF_2_0: entity work.enardFF_2(rtl)
        port map(INPUT(0), LOAD, CLK, signalenardFF_2(0));
     enardFF_2_1: entity work.enardFF_2(rtl)
        port map(INPUT(1), LOAD, CLK, signalenardFF_2(1));
     enardFF_2_2: entity work.enardFF_2(rtl)
        port map(INPUT(2), LOAD, CLK, signalenardFF_2(2));
     enardFF_2_3: entity work.enardFF_2(rtl)
        port map(INPUT(3), LOAD, CLK, signalenardFF_2(3));
     enardFF_2_4: entity work.enardFF_2(rtl)
        port map(INPUT(4), LOAD, CLK, signalenardFF_2(4));
     enardFF_2_5: entity work.enardFF_2(rtl)
        port map(INPUT(5), LOAD, CLK, signalenardFF_2(5));
     enardFF_2_6: entity work.enardFF_2(rtl)
        port map(INPUT(6), LOAD, CLK, signalenardFF_2(6));
     enardFF_2_7: entity work.enardFF_2(rtl)
        port map(INPUT(7), LOAD, CLK, signalenardFF_2(7));
    OUTPUT <= signalenardFF_2;
end struct;