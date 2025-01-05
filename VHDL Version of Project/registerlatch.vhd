LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY registerlatch IS
			port(		D	  : in	std_logic_vector (7 DOWNTO 0); -- 8 bit input
			reset, clk	  : in	std_logic;
						Q	  : out	std_logic_vector (7 DOWNTO 0)); -- 8 bit output
END registerlatch;

ARCHITECTURE Behavior OF registerlatch IS
BEGIN
	PROCESS(reset,clk)
	BEGIN
		if reset = '1' then
			Q <= "00000000";
		elsif(clk'EVENT AND clk = '1') then
			Q <= D;
		END if;
	END PROCESS;
END Behavior;