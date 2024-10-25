library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MultiplierTB is
end MultiplierTB;

architecture Behavioral of MultiplierTB is
    signal OperandA, OperandB: std_logic_vector(3 downto 0);
    signal Greset: std_logic := '1';
    signal CLK: std_logic;
    signal P: std_logic_vector(7 downto 0);
begin

    -- clock
    CLK_process: process is
    begin

        CLK <= '0';
        wait for 50 ns;
        CLK <= '1';
        wait for 50 ns;
    end process;



    Greset <= '0' after 100 ns;
	 
		 -- Negative*Positive
    --OperandA <= "1000"; -- -8
    --OperandB <= "0011"; --  3


		 -- Positive*Positive
	  --OperandA <= "0101"; -- 5
    --OperandB <= "0011"; -- 3


	 	 -- Negative*Negative
	    OperandA <= "1000"; -- -8
      OperandB <= "1000"; -- -8


--     Multiplier: entity work.Multiplier(struct)
--         port map(OperandA, OperandB, Greset, CLK, P);

    signedMultiplier: entity work.signedMult(struct)
        port map(OperandA, OperandB, Greset, CLK, P);

end Behavioral;