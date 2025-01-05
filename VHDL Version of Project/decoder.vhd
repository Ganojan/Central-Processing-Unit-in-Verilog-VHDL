LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY decoder2 IS
	PORT ( w  : IN	STD_LOGIC_VECTOR(3 DOWNTO 0);
			 En : IN	STD_LOGIC ;
			 y  : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
	END decoder2;

ARCHITECTURE Behavior OF decoder2 IS
BEGIN
	PROCESS (w)
		BEGIN
			if (En = '0') then
				y <= "0000000000000000";
			else
				case w is
					WHEN "0000" => y <= "0000000000000001";
					WHEN "0001" => y <= "0000000000000010";
					WHEN "0010" => y <= "0000000000000100";
					WHEN "0011" => y <= "0000000000001000";
					WHEN "0100" => y <= "0000000000010000";
					WHEN "0101" => y <= "0000000000100000";
					WHEN "0110" => y <= "0000000001000000";
					WHEN "0111" => y <= "0000000010000000";
					WHEN "1000" => y <= "0000000100000000";
					WHEN "1001" => y <= "0000001000000000";
					WHEN "1010" => y <= "0000010000000000";
					WHEN "1011" => y <= "0000100000000000";
					WHEN "1100" => y <= "0001000000000000";
					WHEN "1101" => y <= "0010000000000000";
					WHEN "1110" => y <= "0100000000000000";
					WHEN "1111" => y <= "1000000000000000";
					WHEN OTHERS => y <= "0000000000000000";
				END CASE;
			END IF;
	END PROCESS;
END Behavior;