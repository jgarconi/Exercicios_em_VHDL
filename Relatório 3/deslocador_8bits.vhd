-- Relatório 3 Questão 3 Item B
--! @file      deslocador_8bits.vhd
--! @brief     Implementação de um deslocador de palavras à esquerda de 8bits usando mux.
--             shift1 : 1 deslocamento 
--             shift2 : 2 deslocamentos
--             shift4 : 4 deslocamentos
--! @author    Juliana Garçoni dos Santos
--! @date      2019-06-05 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity deslocador is
 port ( a : in std_logic_vector(7 downto 0);
        s : in std_logic_vector(2 downto 0);
        d : out std_logic_vector(7 downto 0));
end entity;

architecture arch of deslocador is

component mux is
 port( s : in std_logic;
       d0, d1 : in std_logic_vector (7 downto 0);
       y : out std_logic_vector (7 downto 0));
end component;

signal shift1, y1, shift2, y2, shift4, y4 : std_logic_vector (7 downto 0);

begin

shift1 <= a(6 downto 0) & '0';
shift2 <= y1(5 downto 0) & "00"; 
shift4 <= y2(3 downto 0) & "0000";

U0: mux port map ((s(0)), a, shift1, y1);
U1: mux port map ((s(1)), y1, shift2, y2);
U2: mux port map ((s(2)), y2, shift4, y4);

end architecture;