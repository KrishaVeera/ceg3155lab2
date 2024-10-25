library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xorgate_4b is
 Port (
    A,B: in std_logic_vector(3 downto 0);
    OUT1: out std_logic_vector(3 downto 0)
 );
end xorgate_4b;

architecture struct of xorgate_4b is

begin
    OUT1(0) <= A(0) xor B(0);
    OUT1(1) <= A(1) xor B(1);
    OUT1(2) <= A(2) xor B(2);
    OUT1(3) <= A(3) xor B(3);
end ;