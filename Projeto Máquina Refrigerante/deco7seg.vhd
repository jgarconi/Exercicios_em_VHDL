-- Projeto Máquina de estados finitas de Moore
--! @file      deco7seg.vhd
--! @brief     Configuração de um display de 7 segmentos para o projeto da máquina de refrigerante.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-07-01 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity deco7seg is

generic( clk_freq : integer := 100000000;
			refresh_freq : integer := 120);
	port( clk_7seg : in std_logic;
			rst : in std_logic;
			input_1 : in std_logic_vector(3 downto 0);
			input_2 : in std_logic_vector(3 downto 0);
			input_3 : in std_logic_vector(3 downto 0);
			input_4 : in std_logic_vector(3 downto 0);
			output_7seg : out std_logic_vector(6 downto 0);
			output_an : out std_logic_vector(3 downto 0));
end entity;

architecture arch of deco7seg is

signal LED_out : std_logic_vector(6 downto 0);
signal LED_ABCD : std_logic_vector(3 downto 0);
signal AN_ABCD : std_logic_vector(3 downto 0);
signal an_cont : unsigned(1 downto 0);

begin
deco_7seg : process(LED_ABCD)

begin
	case LED_ABCD is
		when "0000" => LED_out <= "0000001"; -- "0"
		when "0001" => LED_out <= "1001111"; -- "1"
		when "0010" => LED_out <= "0010010"; -- "2"
		when "0011" => LED_out <= "0000110"; -- "3"
		when "0100" => LED_out <= "1001100"; -- "4"
		when "0101" => LED_out <= "0100100"; -- "5"
		when "0110" => LED_out <= "0100000"; -- "6"
		when "0111" => LED_out <= "0001111"; -- "7"
		when "1000" => LED_out <= "0000000"; -- "8"
		when "1001" => LED_out <= "0000100"; -- "9"
		when "1010" => LED_out <= "0000010"; -- A
		when "1011" => LED_out <= "1100000"; -- b
		when "1100" => LED_out <= "0110001"; -- C
		when "1101" => LED_out <= "1000010"; -- d
		when "1110" => LED_out <= "0110000"; -- E
		when others => LED_out <= "0111000"; -- F
	end case;
end process;

clk_div : process(clk_7seg)
	variable refresh_counter : integer := 0;
	constant refresh_limit : integer := clk_freq / (refresh_freq * 4);

begin
	if(rising_edge(clk_7seg)) then
		if (rst = '1') then
			refresh_counter := 0;
			an_cont <= "00";
	else
		refresh_counter := refresh_counter + 1;
		if (refresh_counter >= refresh_limit) then
			refresh_counter := 0;
			an_cont <= an_cont + 1;
		end if;
		end if;
	end if;
end process;

ABCD_an : process(an_cont, input_1, input_2, input_3, input_4, LED_out)

begin
	case an_cont is
		when "00" => output_an <= "1110";
			LED_ABCD <= input_1;
		when "01" => output_an <= "1101";
			LED_ABCD <= input_2;
		when "10" => output_an <= "1011";
			LED_ABCD <= input_3;
		when "11" => output_an <= "0111";
			LED_ABCD <= input_4;
		when others => output_an <= "1111";
			LED_ABCD <= (others=>'1');
	end case;
	output_7seg <= LED_out;
end process;
end architecture;