library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity doubleRegShiftTB is
end doubleRegShiftTB;

architecture Behavioral of doubleRegShiftTB is
    signal SHIFTL: std_logic := '0';
    signal linkbit: std_logic;
    signal CLK: std_logic;
    signal outfrom, outto: std_logic_vector(3 downto 0);
begin

    -- clock
    CLK_process: process is
        begin
    
            CLK <= '0';
            wait for 50 ns;
            CLK <= '1';
            wait for 50 ns;
        end process;

    SHIFTL <= '1' after 110 ns;

    fromReg: entity work.fromAluShiftReg_4bit(struct)
            port map('1', SHIFTL, CLK, "1111", outfrom, linkbit);
    toReg: entity work.AluShiftReg_4bit(struct)
            port map('1', SHIFTL, CLK, linkbit, "0000", outto);

end Behavioral;