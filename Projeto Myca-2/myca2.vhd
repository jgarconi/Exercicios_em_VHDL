-- Projeto final Questão 1
--! @file      myca2.vhd
--! @brief     Implementação da entidade myca-2 usando contador, mux, pilha, registrador e somador.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-07-01 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity myca2 is
    port ( clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           flag : in STD_LOGIC;
           opcode : in STD_LOGIC_VECTOR (2 downto 0);
           braddr : in STD_LOGIC_VECTOR (7 downto 0);
           jaddr : in STD_LOGIC_VECTOR (7 downto 0);
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end entity;

architecture arch of myca2 is

signal ld, en, ms0, ms1, s0, s1, cin : std_logic;
signal fio1, fio2, fio3, fio4 : std_logic_vector(7 downto 0);

begin

contador: entity work.contador 
	port map( clk => clk,
    		  clr => clr,
    		  ld => ld,
    		  en => en,
    		  up_down => '1',
    		  D => fio1,
    		  o_f => open,
    		  Q => Q);
              
mux: entity work.mux
	port map ( s(0) => ms0,
    		   s(1) => ms1,
               d0 => braddr,
               d1 => jaddr,
               d2 => fio2,
               d3 => open,
               y => fio1);

pilha: entity work.pilha
	port map ( clk => clk,
    		   clr => clr,
    	       S(0) => s0,
               S(1) => s1,
               A => fio3,
               Q => fio2);
               
somador: entity work.somador
	port map ( A => "00000000",
           	   B => fio4,
           	   Cin => cin,
           	   S => fio3,
           	   Cout => open);

decoder: process (opcode, flag)
begin
    case opcode is
    when "000" => ld <= '0';
                  en <= flag;
                  ms0 <= '0';
                  ms1 <= '0';
                  s0 <= '0';
                  s1 <= '0';
                  cin <= '0';
                  
    when "001" => ld <= flag;
                  en <= '0';
                  ms0 <= '0';
                  ms1 <= '0';
                  s0 <= '0';
                  s1 <= '0';
                  cin <= '0';
                  
    when "010" => ld <= '0';
                  en <= '1';
                  ms0 <= '0';
                  ms1 <= '0';
                  s0 <= '0';
                  s1 <= '0';
                  cin <= '0';
                  
    when "011" => ld <= '1';
                  en <= '0';
                  ms0 <= '0';
                  ms1 <= '0';
                  s0 <= '0';
                  s1 <= '0';
                  cin <= '0';
                  
    when "100" => ld <= flag;
                  en <= '1';
                  ms0 <= '0';
                  ms1 <= '0';
                  s0 <= '0';
                  s1 <= '0';
                  cin <= '0';
                  
    when "101" => ld <= flag;
                  en <= '1';
                  ms0 <= '0';
                  ms1 <= '0';
                  s0 <= '1';
                  s1 <= '0';
                  cin <= '1';
                  
    when "110" => ld <= '1';
                  en <= '0';
                  ms0 <= '0';
                  ms1 <= '1';
                  s0 <= '0';
                  s1 <= '1';
                  cin <= '0';
                  
    when "111" => ld <= flag;
                  en <= '1';
                  ms0 <= '1';
                  ms1 <= '0';
                  s0 <= '1';
                  s1 <= '0';
                  cin <= '1';
                 
    when others => ld <= '0';
                   en <= '0';
                   ms0 <= '0';
                   ms1 <= '0';
                   s0 <= '0';
                   s1 <= '0';
                   cin <= '0';
    end case;
    Q <= fio4; --duvida--
end process;

end architecture;