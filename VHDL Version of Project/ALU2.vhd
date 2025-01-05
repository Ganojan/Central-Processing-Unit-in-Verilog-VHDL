LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;

ENTITY ALU2 IS
PORT(				clk : in	 STD_LOGIC;
					A,B : in	 UNSIGNED(7 DOWNTO 0); -- 8-bit inputs A & B from Reg. 1 & Reg. 2
				opcode : in	 UNSIGNED(15 DOWNTO 0); -- 8-bit opcode from Decoder
				R1, R2 : out UNSIGNED(3 DOWNTO 0); -- two 4-bit results
			 negative : out STD_LOGIC);
END ALU2;

ARCHITECTURE calculation OF ALU2 IS
SIGNAL Reg1, Reg2, Result : UNSIGNED(7 DOWNTO 0) := (OTHERS => '0');

BEGIN
Reg1 <= A;
Reg2 <= B;

PROCESS(clk,opcode)
BEGIN
		case opcode is
		
		WHEN "0000000000000001" =>
		Result <= Reg1 srl 2; -- Shift A right 2 bits
		Result(6) <= '1'; --Input bit 1
		Result(7) <= '1';
		
		
		WHEN "0000000000000010" =>  -- Subtraction of both numbers and increment by 3
		Result <= (Reg1 - Reg2) + "00000011";
		
		WHEN "0000000000000100" =>  -- Output the maximum of the 2 numbers;
		if(Reg1 > Reg2) then
			Result <= Reg1;
		else
			Result <= Reg2;
		end if;
		
		WHEN "0000000000001000" =>  -- Swap upper 4 bits of A with lower 4 bits of B
		Result(0) <= Reg1(0);
		Result(1) <= Reg1(1);
		Result(2) <= Reg1(2);
		Result(3) <= Reg1(3);
		Result(4) <= Reg2(0);
		Result(5) <= Reg2(1);
		Result(6) <= Reg2(2);
		Result(7) <= Reg2(3);
		
		WHEN "0000000000010000" =>  -- Increment A by 1
		Result <= Reg1 + "00000001";
		
		WHEN "0000000000100000" =>  -- A AND B operation
		Result <= Reg1 AND Reg2;
		negative <= '0';
		
		WHEN "0000000001000000" =>  -- Invert upper four bits of A
		Result(0) <= Reg1(0);
		Result(1) <= Reg1(1);
		Result(2) <= Reg1(2);
		Result(3) <= Reg1(3);
		Result(4) <= NOT Reg1(4);
		Result(5) <= NOT Reg1(5);
		Result(6) <= NOT Reg1(6);
		Result(7) <= NOT Reg1(7);
		
		WHEN "0000000010000000" =>  -- Rotate B left 3 bits
		Result <= Reg2 ROL 3;
		
		WHEN OTHERS => --don't care, do nothing
		
		end case;
END PROCESS;
R1 <= Result(3 DOWNTO 0); --Result split into two 4-bit outputs and displayed on 2 pairs of seven segment displays
R2 <= Result(7 DOWNTO 4);
END calculation;