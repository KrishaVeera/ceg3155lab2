library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xorgate_8b is
 Port (
    A,B: in std_logic_vector(7 downto 0);
    OUT1: out std_logic_vector(7 downto 0)
 );
end xorgate_8b;

architecture struct of xorgate_8b is

begin
    OUT1(0) <= A(0) xor B(0);
    OUT1(1) <= A(1) xor B(1);
    OUT1(2) <= A(2) xor B(2);
    OUT1(3) <= A(3) xor B(3);
	 OUT1(4) <= A(4) xor B(4);
    OUT1(5) <= A(5) xor B(5);
    OUT1(6) <= A(6) xor B(6);
    OUT1(7) <= A(7) xor B(7);
end ;