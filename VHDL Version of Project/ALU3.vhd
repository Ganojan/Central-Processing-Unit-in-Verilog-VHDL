LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;

ENTITY ALU3 IS
PORT(				clk : in STD_LOGIC;
					A,B : in STD_LOGIC_VECTOR(7 DOWNTO 0);
				opcode : in	 STD_LOGIC_VECTOR(15 DOWNTO 0); -- 8-bit opcode from Decoder
		  student_ID : in STD_LOGIC_VECTOR(3 DOWNTO 0);
				Answer : out STD_LOGIC_VECTOR(3 DOWNTO 0));
END ALU3;

ARCHITECTURE calculation OF ALU3 IS

BEGIN

PROCESS(opcode)
BEGIN
		case opcode is
		-- Checking for odd parity; if odd parity, output 'y'; if even parity, output 'n'
		WHEN "0000000000000001" =>
		if (NOT(student_ID(3) XOR student_ID(2) XOR student_ID(1) XOR student_ID(0)) = '0') then
			Answer <= "0001";
		else
			Answer <= "0000";
		end if;
		
		WHEN "0000000000000010" =>
		if (NOT(student_ID(3) XOR student_ID(2) XOR student_ID(1) XOR student_ID(0)) = '0') then
			Answer <= "0001";
		else
			Answer <= "0000";
		end if;
		
		WHEN "0000000000000100" =>
		if (NOT(student_ID(3) XOR student_ID(2) XOR student_ID(1) XOR student_ID(0)) = '0') then
			Answer <= "0001";
		else
			Answer <= "0000";
		end if;
		
		WHEN "0000000000001000" =>
		if (NOT(student_ID(3) XOR student_ID(2) XOR student_ID(1) XOR student_ID(0)) = '0') then
			Answer <= "0001";
		else
			Answer <= "0000";
		end if;
		
		WHEN "0000000000010000" =>
		if (NOT(student_ID(3) XOR student_ID(2) XOR student_ID(1) XOR student_ID(0)) = '0') then
			Answer <= "0001";
		else
			Answer <= "0000";
		end if;
		
		WHEN "0000000000100000" =>
		if (NOT(student_ID(3) XOR student_ID(2) XOR student_ID(1) XOR student_ID(0)) = '0') then
			Answer <= "0001";
		else
			Answer <= "0000";
		end if;
		
		WHEN "0000000001000000" =>
		if (NOT(student_ID(3) XOR student_ID(2) XOR student_ID(1) XOR student_ID(0)) = '0') then
			Answer <= "0001";
		else
			Answer <= "0000";
		end if;
		
		WHEN "0000000010000000" =>
		if (NOT(student_ID(3) XOR student_ID(2) XOR student_ID(1) XOR student_ID(0)) = '0') then
			Answer <= "0001";
		else
			Answer <= "0000";
		end if;
		
		WHEN OTHERS => --don't care, do nothing
			Answer <= "----";
		
		end case;
END PROCESS;
END calculation;