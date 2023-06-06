-- Relatório 3 Questão 1
--! @file      decod_mux.vhd
--! @brief     Relação entre um decodificador e um multiplexador utilizando component e entidades secundárias.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-06-05 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity decmux is 
 port ( a: in std_logic;
        b: in std_logic;
        c: in std_logic;
        d: in std_logic;
        e: in std_logic;
        f: in std_logic;
        g: in std_logic;
        s: in std_logic);
end entity;

architecture dm of decmux is
 component decod4x16 is
  port (a1: in std_logic_vector(3 downto 0);
        y1: in std_logic_vector(15 downto 0) );
 end component;
 
 component mux8 is
  port (d1: in std_logic_vector(7 downto 0);
        s1: in std_logic_vector(2 downto 0);
        y2: std_logic);
 end component;

signal portaor1, portaor2 : std_logic;
signal a1 : std_logic_vector(3 downto 0);
signal y1 : std_logic_vector(15 downto 0);
signal d1 : std_logic_vector(7 downto 0);
signal s1 : std_logic_vector(2 downto 0);

begin

a1 <= a & b & c & d;
d1 <= '1' & portaor2 & '0' & portaor1 & '1' & y1(7) & y1(0) & '0'; 
portaor1 <= (y1(9) or y1(15));
portaor2 <= (y1(10) or y1(11));

conexao_dec : decod4x16 port map (a1, y1);
conexao_mux : mux8 port map (d1, s1, s);

end architecture;