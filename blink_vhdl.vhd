library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity blink_vhdl is
    Port ( 
        CLOCK_50 : in STD_LOGIC;
        LED_0    : out STD_LOGIC
    );
end blink_vhdl;

architecture Behavioral of blink_vhdl is
    signal counter : integer range 0 to 50000000 := 0;
    signal led_state : std_logic := '0';
begin

    process(CLOCK_50)
    begin
        if rising_edge(CLOCK_50) then
            if counter = 24999999 then  -- halbe Sekunde bei 50 MHz
                counter <= 0;
                led_state <= not led_state;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    LED_0 <= led_state;

end Behavioral;