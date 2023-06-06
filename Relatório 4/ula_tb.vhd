-- Relatório 4 Questão 2
--! @file      ula_tb.vhd
--! @brief     Testbench para os códigos ula_somador.vhd e ula_numeric.vhd
--! @author    Juliana Garçoni dos Santos
--! @date      2019-06-05 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity testbench is
 port ( DUT_ULA, G_ULA : in std_logic_vector(3 downto 0);
        A, B : out std_logic_vector(3 downto 0);
        S : out std_logic_vector(2 downto 0));
end entity;

architecture arch of testbench is
begin
 process
 variable contD : unsigned(7 downto 0);
 variable contG : unsigned(2 downto 0);
 begin
  report “Iniciando teste...” severity NOTE;
  
  contD := "00000000";
  contG := "000";
  
  for G in 0 to 7 loop
  for D in 0 to 255 loop
  
  A <= std_logic_vector(contD(7 downto 4));
  B <= std_logic_vector(contD(3 downto 0));
  
  S <= std_logic_vector(contG);
  
  wait for 500 ns;
  
  assert (DUT_ULA = G_ULA) report “Falhou: G = ” & integer’image(G) & “Com D = ” & integer’image(D) severity ERROR;
  
  contD := contD + 1;
  end loop;
  
  contG := contG + 1;
  end loop;
  
  report “Teste finalizado!” severity NOTE;
  wait;
 end process;
end arch;