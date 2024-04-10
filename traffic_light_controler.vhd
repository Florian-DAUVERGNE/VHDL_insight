library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity traffic_light is
    Port ( 
           clk : in  STD_LOGIC;
           bouton : in  STD_LOGIC :='0';
	   bouton_2 : in  STD_LOGIC :='0';
	   vert : out std_logic_vector(3 downto 0);
	   jaune : out std_logic_vector(3 downto 0);
	   rouge : out std_logic_vector(3 downto 0);
	   vert_pieton : out std_logic_vector(1 downto 0);
	   rouge_pieton : out std_logic_vector(1 downto 0)
          );
end traffic_light;

architecture Behavioral of traffic_light is
    signal counter_reg : INTEGER range 0 to 100 := 0;
begin
    process (clk,bouton,bouton_2)
    begin
	if bouton = '1' then
	  counter_reg <= 30;
	end if;
	if bouton_2 = '1' then
	  counter_reg <= 70;
	end if;
        if rising_edge(clk) then
		counter_reg <= counter_reg + 1;
            if counter_reg < 30  then
                vert <= "0011";
		rouge <= "1100";
		jaune <= "0000";
		vert_pieton <= "10";
		rouge_pieton <= "01";
            elsif counter_reg < 35 then
		vert <= "0000";
		rouge <= "1100";
		jaune <= "0011";
		vert_pieton <= "00";
		rouge_pieton <= "11";
	    elsif counter_reg < 70 then
		vert <= "1100";
		rouge <= "0011";
		jaune <= "0000";
		vert_pieton <= "01";
		rouge_pieton <= "10";
	    elsif counter_reg < 75 then
		vert <= "0000";
		rouge <= "0011";
		jaune <= "1100";
		vert_pieton <= "00";
		rouge_pieton <= "11";
	    elsif counter_reg > 75 then
		counter_reg <= 0;
            end if;
        end if;
    end process;
end Behavioral;