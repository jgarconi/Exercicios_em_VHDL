-- Projeto Máquina de estados finitas de Moore
--! @file      comp1bit.vhd
--! @brief     Implementação de um comparador de 1 bit para o projeto da máquina de refrigerante.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-07-01 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity comp1bit is
	port( a, b : in std_logic;
			agtbin, aeqbin, altbin : in std_logic;
			agtbout, aeqbout, altbout : out std_logic);
end entity;

architecture arch of comp1bit is 

signal eq : std_logic;

begin
	eq <= not (a xor b);
	agtbout <= (a and not (b)) or (eq and agtbin);
	aeqbout <= eq and aeqbin;
	altbout <= (not (a) and b) or (eq and altbin);
end architecture;