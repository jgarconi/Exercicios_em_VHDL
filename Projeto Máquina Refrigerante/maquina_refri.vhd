-- Projeto Máquina de estados finitas de Moore
--! @file      maquina_refri.vhd
--! @brief     Implementação de uma máquina de refrigerante usando uma Máquina de estados Finita de Moore.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-07-01 (last update)
-------------------------------------------------------------------------------


library IEEE;
use IEEE.std_logic_1164.all;

entity topmodule is
	port ( clr, clk, refri_retirado, moeda_retirada, MOEDA_ACK : in std_logic;
		   REFRI_BANDEJA, MOEDA_BANDEJA: out std_logic;
		   coin : in std_logic_vector (1 downto 0);
	   	   return_nickel, drop_pop : out std_logic;
		   output_7seg : out std_logic_vector (6 downto 0);
		   output_an : out std_logic_vector (3 downto 0));
end entity;

architecture arch of topmodule is

signal valor_moeda, barramento1, barramento2, preco_refri: std_logic_vector (3 downto 0);
signal somar, load_cont, dec_troco, clr_cont, portaor1, portaor2, igual, maior: std_logic;

begin
preco_refri <= "0110";
portaor1 <= load_cont or dec_troco;
portaor2 <= clr_cont or clr;

DEC : entity work.deco_moeda port map (COIN_IN => coin, DECOIN_OUT =>
valor_moeda);

SOM : entity work.somador port map (clk => clk, clr => clr, en => somar, A
=> valor_moeda, B => barramento1, S => barramento2);

CONT : entity work.contador port map (D => barramento2, l_d => load_cont,
en => portaor1, up_down=> '0', clr => portaor2, clk => clk, o_f => open, Q =>
barramento1);

COMP : entity work.comp4bits port map (A => barramento1, B =>
preco_refri, agtbin => '0', aeqbin => '1', altbtin => '0', agtbout => maior,
aeqbout => igual, altbtout => open);

SEG : entity work.deco7seg port map (clk_7seg => clk, rst =>clr, input_1 =>
preco_refri, input_2 => barramento1, input_3 => "0000" , input_4 =>
"0000", output_7seg => output_7seg, output_an => output_an);

FSM : entity work.controllerFSM port map (MOEDA_ACK => MOEDA_ACK,
MOEDA_RETIRADA => MOEDA_RETIRADA, Seq30 => igual, Sgt30 => maior,
REFRI_RETIRADO => REFRI_RETIRADO, clk => clk, clr => clr, CLR_CONT
=> clr_cont, DEC_TROCO => dec_troco, return_nickel =>
MOEDA_BANDEJA, drop_pop => REFRI_BANDEJA, SOMAR => somar,
LOAD_CONT => load_cont);

end architecture;