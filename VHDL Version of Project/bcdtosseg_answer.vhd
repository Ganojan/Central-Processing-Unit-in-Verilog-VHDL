LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY bcdtosseg_answer IS
PORT ( bcd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
led : OUT STD_LOGIC_VECTOR(0 TO 6) );
END bcdtosseg_answer;

ARCHITECTURE Behavior OF bcdtosseg_answer IS
BEGIN
PROCESS (bcd)

BEGIN

CASE bcd IS           --abcdefg
WHEN "0000" => led <= ("0001001"); -- no
WHEN "0001" => led <= ("1000100"); -- yes
WHEN OTHERS => led <= ("-------"); -- do nothing
END CASE;

END PROCESS;

END Behavior;