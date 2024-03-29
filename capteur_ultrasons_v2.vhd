library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sonar is
    Port ( clk : in STD_LOGIC;
           trig : out STD_LOGIC;
           echo : in STD_LOGIC);
end sonar;

architecture sonar_arch of sonar is
    signal count: integer range 0 to 5800;
    signal sendTrig: std_logic := '1';
begin
    process(clk)
    begin
        if rising_edge(clk) then
		if echo = '1' then
			sendTrig <= '0';
		end if;

		if sendTrig = '1' then
			count <= count + 1;
		end if;
        end if;      
    end process;
end sonar_arch;


-- signal tmpcm1: unsigned(3 downto 0) := "0000"; -- Temporary storage for distance
--signal tmpcm0: unsigned(3 downto 0) := "0000";
--cm1 : out unsigned(3 downto 0); -- Most significant bit of distance
--cm0 : out unsigned(3 downto 0)); -- Least significant bit of distance
