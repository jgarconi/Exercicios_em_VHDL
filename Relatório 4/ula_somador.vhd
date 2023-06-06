-- Relatório 4 Questão 1
--! @file      ula_somador.vhd
--! @brief     Implementação de uma ULA com 8 comandos diferentes sem o uso do pacote numérico.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-06-05 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity somador is
    Port ( A : in std_logic_vector(3 downto 0);
           B : in std_logic_vector(3 downto 0);
           C_in : in std_logic;
           S : out std_logic_vector(3 downto 0);
           C_out : out std_logic_vector(3 downto 0));
end entity;

architecture arch of somador is

begin
	process (A, B, C_in)
	variable soma: std_logic_vector(3 downto 0);
	variable c: std_logic;
	
	begin
		c := C_in;
		
		soma(0) := A(0) XOR B(0) XOR c;
		c := ((A(0) XOR B(0)) and c) or (A(0) and B(0));
		
		soma(1) := A(1) XOR B(1) XOR c;
		c := ((A(1) XOR B(1)) and c) or (A(1) and B(1));
		
		soma(2) := A(2) XOR B(2) XOR c;
		c := ((A(2) XOR B(2)) and c) or (A(2) and B(2));
		
		soma(3) := A(3) XOR B(3) XOR c;
		c := ((A(3) XOR B(3)) and c) or (A(3) and B(3));
		
		S <= soma;
		end process;

end architecture;