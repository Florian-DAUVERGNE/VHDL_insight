library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_with_async_reset is
    Port ( 
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           count : out  INTEGER range 0 to 255
          );
end counter_with_async_reset;

architecture Behavioral of counter_with_async_reset is
    signal counter_reg : INTEGER range 0 to 255 := 0;
begin
    process (clk, reset)
    begin
        if reset = '1' then
            counter_reg <= 0;
        elsif rising_edge(clk) then
            if counter_reg = 255 then
                counter_reg <= 0;
            else
                counter_reg <= counter_reg + 1;
            end if;
        end if;
    end process;
    
    count <= counter_reg;
end Behavioral;
