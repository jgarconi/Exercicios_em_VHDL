-- Projeto final Questão 1
--! @file      mux.vhd
--! @brief     Implementação do mux para a entidade myca-2.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-07-01 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity mux is
 port( s : in std_logic_vector (1 downto 0);
       d0, d1, d2, d3 : in std_logic_vector (7 downto 0);
       y : out std_logic_vector (7 downto 0));
end entity;

architecture arch of mux is
 begin
  y <= d0 when s = "00" else
       d1 when s = "01" else
       d2 when s = "10" else
       d3 when s = "11";

end architecture; 