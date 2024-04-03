library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL;

entity sonar is
    Port ( clk : in STD_LOGIC);
end sonar;

architecture sonar_arch of sonar is
    signal count: integer := 0 ;
    signal sendTrig: std_logic := '1';
    signal receiveEcho: std_logic :='0';
    constant conversion: real := 0.000001715;
    signal traveledDistance:real := 0.0;
    signal seventSegment: std_logic_vector(6 downto 0);
    constant ZERO : std_logic_vector(6 downto 0) := "1000000";
    constant UN : std_logic_vector(6 downto 0) := "1111001";
    constant DEUX : std_logic_vector(6 downto 0) := "0100100";
    constant TROIS : std_logic_vector(6 downto 0) := "0110000";
    constant QUATRE : std_logic_vector(6 downto 0) := "0011001";
    constant CINQ : std_logic_vector(6 downto 0) := "0010010";
    constant SIX : std_logic_vector(6 downto 0) := "0000010";
    constant SEPT : std_logic_vector(6 downto 0) := "1111000";
    constant HUIT : std_logic_vector(6 downto 0) := "0000000";
    constant NEUF : std_logic_vector(6 downto 0) := "0010000";
begin
    process(clk)
    begin

       	if count = 5247813 then -- Distance max 9cm
		receiveEcho <= '1';
	end if;
	if receiveEcho = '1' then
		sendTrig <= '0';
		traveledDistance <= real(count) * conversion;
		count <= 0;
	end if;

	if rising_edge(clk) then
		if sendTrig = '1' then
			count <= count + 1;
		end if;
        end if; 
	case integer(traveledDistance * 1000.0) is
		when 0 to 1000 => seventSegment <= UN;
		when 1001 to 2000 => seventSegment <= DEUX;
		when 2001 to 3000 => seventSegment <= TROIS;
		when 3001 to 4000 => seventSegment <= QUATRE;
		when 4001 to 5000 => seventSegment <= CINQ;
		when 5001 to 6000 => seventSegment <= SIX;
		when 6001 to 7000 => seventSegment <= SEPT;
		when 7001 to 8000 => seventSegment <= HUIT;
		when 8001 to 9000 => seventSegment <= NEUF;
		when others => seventSegment <= ZERO;
	end case;      
    end process;
end sonar_arch;
