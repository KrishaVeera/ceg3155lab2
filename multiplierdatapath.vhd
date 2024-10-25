library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplierDatapath is
 Port (
    OperandA: in std_logic_vector(7 downto 0);
    OperandB: in std_logic_vector(3 downto 0);
    loadA, loadB: in std_logic;
    LSHA, RSHB: in std_logic;
    PSel, loadP: in std_logic;
    CLK: in std_logic;
    b0, z: out std_logic;
    P: out std_logic_vector(7 downto 0)
 );
end multiplierDatapath;

architecture struct of multiplierDatapath is
    signal BOUT: std_logic_vector(3 downto 0);
    signal AOUT, POUT, adderOUT, MUXOUT: std_logic_vector(7 downto 0);
    signal Cout: std_logic;
begin
    
    RegA: entity work.LeftShiftReg_8b(struct)
        port map(loadA, LSHA, CLK, OperandA, AOUT);
    
    RegB: entity work.RightShiftReg_4b(struct)
        port map(loadB, RSHB, CLK, OperandB, BOUT);
       
    RegP: entity work.Reg_8b(struct)
        port map(loadP, CLK, MUXOUT, POUT);

    MUX: entity work.mux2to1_8b(struct)
        port map("00000000", adderOUT, PSel, MUXOUT);

    ADDER: entity work.add8bit(struct)
        port map(POUT, AOUT, '0', adderOUT, Cout);

    NORGATE: entity work.norgate_4b(struct)
        port map(BOUT, z);

    b0 <= BOUT(0);
    P <= POUT;

end ;