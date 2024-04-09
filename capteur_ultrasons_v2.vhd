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
    constant ZERO : std_logic_vector(6 downto 0) := "1111110";
    constant UN : std_logic_vector(6 downto 0) := "0000110";
    constant DEUX : std_logic_vector(6 downto 0) := "1011011";
    constant TROIS : std_logic_vector(6 downto 0) := "1001111";
    constant QUATRE : std_logic_vector(6 downto 0) :=  "0100111";
    constant CINQ : std_logic_vector(6 downto 0) := "1101101";
    constant SIX : std_logic_vector(6 downto 0) := "1111101";
    constant SEPT : std_logic_vector(6 downto 0) := "1000110";
    constant HUIT : std_logic_vector(6 downto 0) := "1111111";
    constant NEUF : std_logic_vector(6 downto 0) :=  "1101111";
    constant ERROR : std_logic_vector(6 downto 0) :=  "1111001";
begin
    process(clk)
    begin

       	if count = 5247813 then -- Distance max 9cm
		receiveEcho <= '1';
	end if;
	if receiveEcho = '1' then
		traveledDistance <= real(count) * conversion;
		receiveEcho <= '0';
	end if;

	if rising_edge(clk) then
		if sendTrig = '1' then
			count <= count + 1;
		end if;
        end if; 
	case integer(traveledDistance * 1000.0) is
		when 0 to 1000 => seventSegment <= ZERO;
		when 1001 to 2000 => seventSegment <= UN;
		when 2001 to 3000 => seventSegment <= DEUX;
		when 3001 to 4000 => seventSegment <= TROIS;
		when 4001 to 5000 => seventSegment <= QUATRE;
		when 5001 to 6000 => seventSegment <= CINQ;
		when 6001 to 7000 => seventSegment <= SIX;
		when 7001 to 8000 => seventSegment <= SEPT;
		when 8001 to 9000 => seventSegment <= HUIT;
		when 9001 to 10000 => seventSegment <= NEUF;
		when others => seventSegment <= ERROR;
	end case;      
    end process;
end sonar_arch;
