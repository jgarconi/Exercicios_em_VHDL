-- Relatório 3 Questão 2 Item A
--! @file      comp1bit.vhd
--! @brief     Implementação de um comparador de 1 bit.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-06-05 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity comparador1bit  is
 port ( A, B: in std_logic;
        AgtBin, AeqBin, AltBin: in std_logic;
        AgtBout, AeqBout, AltBout: out std_logic);
end entity;

architecture comp1 of comparador1bit is
 signal AgtB: std_logic;
 signal AeqB: std_logic;
 signal AltB: std_logic;
 
 begin
  AgtB <= ((A and (not(B))) or (not(A XOR B)));
  AeqB <= (not(A XOR B));
  AltB <= ((not(A) and B) or (not(A XOR B)));
  
  AgtBout <= AgtB and AgtBin;
  AeqBout <= AeqB and AeqBin;
  AltBout <= AltB and AltBin;
  
end architecture;