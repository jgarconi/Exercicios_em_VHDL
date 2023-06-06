-- Relatório 2 Questão 1
--! @file      somador_completo.vhd
--! @brief     Implementação de um somador completo.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-06-05 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity fulladder is
 port( a, b, cin: in std_logic;
       s, cout: out std_logic);
end entity;
  
architecture somador of fulladder is
 begin
  s <= a XOR b XOR cin;
  cout <= ((a XOR b) and cin) or (a and b);
end architecture;


