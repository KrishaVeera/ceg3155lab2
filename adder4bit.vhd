library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity add4bit is
 Port (
    A, B: in std_logic_vector(3 downto 0);
    Cin: in std_logic;
    sum: out std_logic_vector(3 downto 0);
    Cout: out std_logic
 );
end add4bit;

architecture struct of add4bit is
    signal Csignal: std_logic_vector(3 downto 0);
begin
    FA0: entity work.fulladd(structural)
        port map(A(0), B(0), Cin, sum(0), Csignal(0));
    FA1: entity work.fulladd(structural)
        port map(A(1), B(1), Csignal(0), sum(1), Csignal(1));
    FA2: entity work.fulladd(structural)
        port map(A(2), B(2), Csignal(1), sum(2), Csignal(2));
    FA3: entity work.fulladd(structural)
        port map(A(3), B(3), Csignal(2), sum(3), Csignal(3));
    
    Cout <= Csignal(3);
end ;