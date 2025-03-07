----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/06/27 12:59:44
-- Design Name: 
-- Module Name: alu - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
  Port (
	A : in std_logic_vector(3 downto 0); 
	B : in std_logic_vector(3 downto 0); 
	Ci : in std_logic; 
	alufun : in std_logic_vector(1 downto 0):= "00";
	F : inout std_logic_vector (3 downto 0); 
	Co : out std_logic:='0'; 
	Z : out std_logic:= '0'
  );
end alu;


architecture Behavioral of alu is

begin

process 
begin 

end process; 

F <= a+b+Ci when alufun = "10"; 
F <= a-b when alufun = "11"; 

Co <= '1' when (alufun= "10" and A(3)='1' and B(3)= '1') or
	(alufun = "10" and A(3)='1' and F(3)= '1') or 
	(alufun = "10" and B(3)='1' and F(3)= '1')
	
	; 

Z <= '1' when alufun= "11" and F(3)= '0'; 

end Behavioral;
