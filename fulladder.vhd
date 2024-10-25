library ieee;    
use ieee.std_logic_1164.all;    
--One bit full adder with carry lookahead implementation
ENTITY fulladd is
	port (
		A,B,Cin : in STD_LOGIC;
		sum: out STD_LOGIC;
		Cout: out STD_LOGIC
		-- P, G: out STD_LOGIC
		);
	end fulladd;
	
	ARCHITECTURE structural OF fulladd IS
	  -- put declarations here.
	BEGIN
	  -- put concurrent statements here.
	  sum <= A xor B xor Cin;
	  Cout <= (A and B) or (A and Cin) or (B and Cin);
	--   P <= A or B;
	--   G <= A and B;
	END ARCHITECTURE structural; -- Of entity fulladd
	