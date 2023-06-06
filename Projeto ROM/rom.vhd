-- Projeto final Questão 2
--! @file      rom.vhd
--! @brief     Implementação de uma memória ROM.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-07-01 (last update)
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity ROM is
	port( address : in std_logic_vector(7 downto 0);
          data : out std_logic_vector(7 downto 0));
end entity;

architecture arch of ROM is
	type mem is array (0 to 9) of std_logic_vector(7 downto 0);
  	constant my_ROM : 
    mem := ( 0  => "00000000",
    		 1  => "00000001",
    		 2  => "00000010",
    		 3  => "00000011",
    		 4  => "00000100",
    		 5  => "00000101",
    		 6  => "00000110",
    		 7  => "00000111",
    		 8  => "00001000",
    		 9  => "00001001",
    	 	 others => "11111111");
begin
	process (address)
   	begin
        data <= my_ROM(conv_integer(address));
	end process;
end architecture;