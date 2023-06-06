-- Projeto Máquina de estados finitas de Moore
--! @file      controllerFSM.vhd
--! @brief     Implementação máquina de estados para o projeto da máquina de refrigerante.
--! @author    Juliana Garçoni dos Santos
--! @date      2019-07-01 (last update)
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity controllerFSM is
	port( MOEDA_ACK : in std_logic;
			MOEDA_RETIRADA : in std_logic;
			Seq30 : in std_logic;
			Sgt30 : in std_logic;
			REFRI_RETIRADO : in std_logic;
			clk : in std_logic;
			clr : in std_logic;
			CLR_CONT : out std_logic;
			DEC_TROCO : out std_logic;
			return_nickel : out std_logic;
			drop_pop : out std_logic;
			SOMAR : out std_logic;
			LOAD_CONT : out std_logic);
end entity;

architecture arch of controllerFSM is

type estado is (INIT, CONTADOR, VERIF, MOEDA_NA_BANDEJA, TROCO, REFRI, REFRI_BANDEJA);
signal currentstate, nextstate : estado;

begin

sync_proc: process(clk)
	
	begin
		if rising_edge(clk) then
			if (clr = '1') then
				currentstate <= INIT;
			else 
					currentstate <= nextstate;
			end if;
		end if;
		
	end process sync_proc;
	
	
comb_proc: process (currentstate, MOEDA_ACK, Seq30, Sgt30, REFRI_RETIRADO, MOEDA_RETIRADA)
	
begin
	case currentstate is
		when INIT =>
			SOMAR <= '1';
			return_nickel <= '0';
			CLR_CONT <= '0';
			DEC_TROCO <= '0';
			drop_pop <= '0';
			LOAD_CONT <= '0';
			
			if (MOEDA_ACK = '1') then
				nextstate <= CONTADOR;
			else
				nextstate <= INIT;
			end if;
	
		when CONTADOR =>
			SOMAR <= '0';
			return_nickel <= '0';
			CLR_CONT <= '0';
			DEC_TROCO <= '0';
			drop_pop <= '0';
			LOAD_CONT <= '1';
			
		if (MOEDA_ACK = '0') then
				nextstate <= VERIF;
			else
				nextstate <= CONTADOR;
			end if;
		
		when VERIF => 
			SOMAR <= '0';
			return_nickel <= '0';
			CLR_CONT <= '0';
			DEC_TROCO <= '0';
			drop_pop <= '0';
			LOAD_CONT <= '0';
				
			if (Seq30 = '1') then
				nextstate <= REFRI;
			elsif (Sgt30 = '1') then
				nextstate <= MOEDA_NA_BANDEJA;
			else 
				nextstate <= INIT;
			end if;
			
		when MOEDA_NA_BANDEJA =>
			SOMAR <= '0';
			return_nickel <= '1';
			CLR_CONT <= '0';
			drop_pop <= '0';
			LOAD_CONT <= '0';
			
			if (MOEDA_RETIRADA = '1') then
				nextstate <= TROCO;
				DEC_TROCO <= '1';
		   else
			   nextstate <= MOEDA_NA_BANDEJA;
			end if;
			
		when TROCO =>
			SOMAR <= '0';
			return_nickel <= '0';
			CLR_CONT <= '0';
			DEC_TROCO <= '0';
			drop_pop <= '0';
			LOAD_CONT <= '0';
			
				nextstate <= VERIF;
				
		when REFRI =>
			SOMAR <= '0';
			return_nickel <= '0';
			CLR_CONT <= '0';
			DEC_TROCO <= '0';
			drop_pop <= '1';
			LOAD_CONT <= '0';
			
			if (REFRI_RETIRADO = '1') then
				nextstate <= REFRI_BANDEJA;
			else 
				nextstate <= REFRI;
			end if;
			
		when REFRI_BANDEJA =>
			SOMAR <= '0';
			return_nickel <= '0';
			CLR_CONT <= '1';
			DEC_TROCO <= '0';
			drop_pop <= '0';
			LOAD_CONT <= '0';
			
				nextstate <= INIT;
				
		when others => nextstate <= INIT;
	end case;
	
end process comb_proc;
end architecture;