-- Relatório 3 Questão 3 Item A
--! @file      mux21_8bits.vhd
--! @brief     Implementação de um multiplexador 2 para 1 de 8 bits.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-06-05 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity mux is
 port( s : in std_logic;
       d0, d1 : in std_logic_vector (7 downto 0);
       y : out std_logic_vector (7 downto 0));
end entity;

architecture multiplex of mux is
 begin
  y <= d0 when s = '0' else
       d1 when s = '1';

end architecture; 