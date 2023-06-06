-- Projeto final Questão 1
--! @file      registrador.vhd
--! @brief     Implementação do registrador para a entidade myca-2.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-07-01 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity registrador is
	port ( Clk, Clr, R, L : in std_logic;
    	   S : in std_logic_vector(1 downto 0);
           D: in std_logic_vector(7 downto 0);
           Q: out std_logic_vector(7 downto 0));
end entity;

architecture arch of registrador is

begin

reg : process(clk)
begin
   if rising_edge(Clk) then
	  if (Clr= '0') then
         Q <= "00000000";
         
      elsif (S(1)= '0' and S(0)= '0') then
       	 Q <= Q; -- q's diferentes --
         
      elsif (S(1)= '0' and S(0)= '1') then
         Q <= R & Q(7 downto 1);
         
      elsif (S(1)= '1' and S(0)= '0') then
         Q <= Q(6 downto 0) & L;
         
      elsif (S(1)= '1' and S(0)= '1') then
         Q <= D;
      end if;
   end if;
end process;
end architecture;