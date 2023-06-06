-- Projeto Máquina de estados finitas de Moore
--! @file      somador.vhd
--! @brief     Implementação de um somador para o projeto da máquina de refrigerante.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-07-01 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity somador is
	generic( n : integer := 4);
	port( clk : in std_logic;
		  clr : in std_logic;
		  en : in std_logic;A : in std_logic_vector (n-1 downto 0);
		  B : in std_logic_vector (n-1 downto 0);
		  S : out std_logic_vector (n-1 downto 0));
end entity;

architecture arch of somador is

begin
process(clk)
	variable a_var, b_var: unsigned(n-1 downto 0);
	variable s_var : unsigned(n-1 downto 0) := (others=>'0');
	
	begin
		if (rising_edge(clk)) then
			a_var := unsigned(A);
			b_var := unsigned(B);
		if (clr = '1') then
			s_var := (others=>'0');
		elsif (en = '1') then
			s_var := a_var + b_var;
		end if;
			S <= std_logic_vector(s_var);
		end if;
end process;
end architecture;