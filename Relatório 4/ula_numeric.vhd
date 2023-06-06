-- Relatório 4 Questão 2
--! @file      ula_numeric.vhd
--! @brief     Implementação de uma ULA com 8 comandos diferentes com o uso do pacote numérico.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-06-05 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all

entity ULA is
    Port ( A : in std_logic_vector(3 downto 0);
           B : in std_logic_vector(3 downto 0);
           S : in std_logic_vector(2 downto 0);
           D : out std_logic_vector(3 downto 0));
end entity;

architecture arch of ULA is

signal som, sub, d_e, d_d : std_logic_vector(3 downto 0);     -- operações --
signal x1, x2 : std_logic;    -- lógica adicional --
signal maior, menor : boolean;

begin
som <= std_logic_vector(signed(A) + signed(B));
sub <= std_logic_vector(signed(A) − signed(B));

x1 <= '1' when menor else '0';
x2 <= '1' when maior else '0';

d_e <= "000"&x1;
d_d <= "000"&x2;

U : entity work.mux port map (S, som, sub, d_e, d_d, D);

end architecture;