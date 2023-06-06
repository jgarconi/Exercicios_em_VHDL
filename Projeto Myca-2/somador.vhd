-- Projeto final Questão 1
--! @file      somador.vhd
--! @brief     Implementação do somador para a entidade myca-2.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-07-01 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity somador is
    Port ( A : in std_logic_vector(7 downto 0);
           B : in std_logic_vector(7 downto 0);
           Cin : in std_logic;
           S : out std_logic_vector(7 downto 0);
           Cout : out std_logic);
end entity;

architecture arch of somador is

begin
	process (A, B, Cin)
	variable soma: std_logic_vector(7 downto 0);
	variable c: std_logic;
	
	begin
		c := Cin;
		
		soma(0) := A(0) XOR B(0) XOR c;
		c := ((A(0) XOR B(0)) and c) or (A(0) and B(0));
		
		soma(1) := A(1) XOR B(1) XOR c;
		c := ((A(1) XOR B(1)) and c) or (A(1) and B(1));
		
		soma(2) := A(2) XOR B(2) XOR c;
		c := ((A(2) XOR B(2)) and c) or (A(2) and B(2));
		
		soma(3) := A(3) XOR B(3) XOR c;
		c := ((A(3) XOR B(3)) and c) or (A(3) and B(3));
		
        soma(4) := A(4) XOR B(4) XOR c;
		c := ((A(4) XOR B(4)) and c) or (A(4) and B(4));
		
		soma(5) := A(5) XOR B(5) XOR c;
		c := ((A(5) XOR B(5)) and c) or (A(5) and B(5));
		
		soma(6) := A(6) XOR B(6) XOR c;
		c := ((A(6) XOR B(6)) and c) or (A(6) and B(6));
		
		soma(7) := A(7) XOR B(7) XOR c;
		c := ((A(7) XOR B(7)) and c) or (A(7) and B(7));
		
		S <= soma;
		end process;

end architecture;