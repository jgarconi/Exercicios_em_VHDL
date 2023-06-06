-- Relatório 3 Questão 2 Item B
--! @file      comp4bits.vhd
--! @brief     Implementação de um comparador de 4 bits usando um cascateamento do comparador de 1 bit.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-06-05 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity comparador4bits is
 port (A, B: in std_logic_vector(3 downto 0);
       AgtBin, AeqBin, AltBin: in std_logic;
       AgtBout, AeqBout, AltBout: out std_logic);
end entity;

architecture comp4 of comparador4bits is

component comp1 is
 port ( A, B: in std_logic;
        AgtBin, AeqBin, AltBin: in std_logic;
        AgtBout, AeqBout, AltBout: out std_logic);
end component;

signal fio1: std_logic;
signal fio2: std_logic;
signal fio3: std_logic;
signal fio4: std_logic;
signal fio5: std_logic;
signal fio6: std_logic;
signal fio7: std_logic;
signal fio8: std_logic;
signal fio9: std_logic;
 
begin 
 U0: comp1 port map (A(0), B(0), AgtBin, AeqBin, AltBin, fio1, fio2, fio3);
 U1: comp1 port map (A(1), B(1), fio1, fio2, fio3, fio4, fio5, fio6);
 U2: comp1 port map (A(2), B(2), fio4, fio5, fio6, fio7, fio8, fio9);
 U3: comp1 port map (A(3), B(3), fio7, fio8, fio9, AgtBout, AeqBout, AltBout);
 
end architecture;