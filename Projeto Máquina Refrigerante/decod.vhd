-- Projeto Máquina de estados finitas de Moore
--! @file      decod.vhd
--! @brief     Implementação decodificador para o projeto da máquina de refrigerante.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-07-01 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity deco_moeda is
	port( COIN_IN : in std_logic_vector(1 downto 0);
			DECOIN_OUT : out std_logic_vector(3 downto 0));
end entity;

architecture arch of deco_moeda is

begin
	with COIN_IN select
	
		DECOIN_OUT <= "0001" when "00",
					  "0010" when "01",
					  "0101" when "10",
					  "1010" when others;	
end architecture;