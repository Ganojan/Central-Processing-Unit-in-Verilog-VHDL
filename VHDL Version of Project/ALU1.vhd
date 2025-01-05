LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY ALU1 IS
PORT(				clk : in	STD_LOGIC;
					A,B : in	STD_LOGIC_VECTOR(7 DOWNTO 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
				opcode : in	STD_LOGIC_VECTOR(15 DOWNTO 0); -- 8-bit opcode from Decoder
				R1, R2 : out STD_LOGIC_VECTOR(3 DOWNTO 0); -- two 4-bit results
				negative : out	STD_LOGIC);
END ALU1;

ARCHITECTURE calculation OF ALU1 IS
SIGNAL Reg1, Reg2, Result : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

BEGIN
Reg1 <= A;
Reg2 <= B;

PROCESS(clk,opcode)
BEGIN
	if(rising_edge(clk)) then
		case opcode is
		
		WHEN "0000000000000001" =>  -- Addition of both numbers
		Result <= Reg1 + Reg2;
		negative <= '0';
		
		WHEN "0000000000000010" =>  -- Subtraction of both numbers
		if (Reg2 > Reg1) then -- Accounting for a negative result with a negative sign
			Result <= Reg2 - Reg1;
			negative <= '1';
		else             -- Accounting for non-negative result with no negative sign
			Result <= Reg1 - Reg2;
			negative <= '0';
		end if;
		
		WHEN "0000000000000100" =>  -- Inverting A operation
		Result <= NOT(Reg1);
		negative <= '0';
		
		WHEN "0000000000001000" =>  -- A NAND B operation
		Result <= Reg1 NAND Reg2;
		negative <= '0';
		
		WHEN "0000000000010000" =>  -- A NOR B operation
		Result <= Reg1 NOR Reg2;
		negative <= '0';
		
		WHEN "0000000000100000" =>  -- A AND B operation
		Result <= Reg1 AND Reg2;
		negative <= '0';
		
		WHEN "0000000001000000" =>  -- A XOR B operation
		Result <= Reg1 XOR Reg2;
		negative <= '0';
		
		WHEN "0000000010000000" =>  -- A OR B operation
		Result <= Reg1 OR Reg2;
		negative <= '0';
		
		WHEN OTHERS => --don't care, do nothing
		
		end case;
	end if;
END PROCESS;
R1 <= Result(3 DOWNTO 0); --Result split into two 4-bit outputs and displayed on 2 pairs of seven segment displays
R2 <= Result(7 DOWNTO 4);
END calculation;
