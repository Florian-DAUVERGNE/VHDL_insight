library ieee;
use ieee.std_logic_1164.all;

entity UAL is
    port(
        A : in  integer;
        B : in  integer;
        F : in std_logic_vector(1 downto 0);
	X : out integer
    );
end UAL;

architecture behv1 of UAL is
begin
    process(F)
    begin
	    case F is
            when "00" => X <= A+B;
	    when "11" => X <= A*B;
            when others => X <= 0;
        end case;
    end process;
end behv1;

