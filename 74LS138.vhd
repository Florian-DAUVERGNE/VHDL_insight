library ieee;
use ieee.std_logic_1164.all;

entity TruthTable is
    port(
        Input   : in std_logic_vector(2 downto 0);
        Output   : out std_logic_vector(7 downto 0)
    );
end TruthTable;

architecture behv1 of TruthTable is
begin
    process(Input)
    begin
        case Input is
            when "000" => Output <= "01111111";
            when "001" => Output <= "10111111";
            when "010" => Output <= "11011111";
            when "011" => Output <= "11101111";
            when "100" => Output <= "11110111";
            when "101" => Output <= "11111011";
            when "110" => Output <= "11111101";
	    when "111" => Output <= "11111110";
            when others => Output <= "00000000";
        end case;
    end process;
end behv1;