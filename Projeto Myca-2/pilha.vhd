-- Projeto final Questão 1
--! @file      pilha.vhd
--! @brief     Implementação da pilha para a entidade myca-2.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-07-01 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity pilha is 
	port ( Clk, Clr: in std_logic;
    	   S: in std_logic_vector(1 downto 0);
           A: in std_logic_vector(7 downto 0);
           Q: out std_laogic_vector(7 downto 0));
end entity;

architecture arch of pilha is

component registrador is
	port ( Clk, Clr, R, L : in std_logic;
    	   S : in std_logic_vector(1 downto 0);
           D: in std_logic_vector(7 downto 0);
           Q: out std_logic_vector(7 downto 0));
end component;

signal push, pop, R, L: std_logic;
signal hold: std_logic_vector(7 downto 0);

begin 

push <= R;
pop <= L;
hold <= Q;

u0: registrador port map (Clk, Clr, push, pop, S, A, Q);

end architecture;