-- Relatório 2 Questão 2
--! @file      mux41.vhd
--! @brief     Implementação de um multiplexador de 4 para 1.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-06-05 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity mux4 is
 port( s: in std_logic_vector(1 downto 0);
       d: in std_logic_vector (3 downto 0);
       y: out std_logic);
end entity;

architecture multiplex of mux4 is
 begin
  with s select
  y <= d(0) when "00",
       d(1) when "01",
       d(2) when "10",
       d(3) when "11",
       '0' when others;
end architecture;