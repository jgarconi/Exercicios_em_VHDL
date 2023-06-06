-- Relatório 2 Questão 4
--! @file      decod416.vhd
--! @brief     Implementação de um decodificador de 4 para 16.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-06-05 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity decod4x16 is
 port( a: in std_logic_vector(3 downto 0);
       y: out std_logic_vector(15 downto 0));
end entity;

architecture decod of decod4x16 is
begin 
 with a select
 y <= "0000000000000001" when "0000",
      "0000000000000010" when "0001",
      "0000000000000100" when "0010",
      "0000000000001000" when "0011",       
      "0000000000010000" when "0100",
      "0000000000100000" when "0101",
      "0000000001000000" when "0110",
      "0000000010000000" when "0111",      
      "0000000100000000" when "1000",
      "0000001000000000" when "1001",
      "0000010000000000" when "1010",
      "0000100000000000" when "1011",      
      "0001000000000000" when "1100",
      "0010000000000000" when "1101",
      "0100000000000000" when "1110",
      "1000000000000000" when others;
      
end architecture;
          
   