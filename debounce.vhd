----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.05.2024 11:43:56
-- Design Name: 
-- Module Name: debounce - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity debounce is
  Port ( clk : in std_logic;
         rst : in std_logic;
         butom : in std_logic;
         debbutom : out std_logic
        );
end debounce;

architecture Behavioral of debounce is

    signal delay1 : std_logic;
    signal delay2 : std_logic;
    signal delay3 : std_logic;

begin

    debounce_proc : process (clk) is
    begin
        if rising_edge (clk) then
            if (rst = '1') then
                debbutom <= '1';
            else
                delay1 <= butom;
                delay2 <= delay1;
                delay3 <= delay2;
            end if;
        end if;     
    end process   debounce_proc;
    
    debbutom <= delay1 and delay2 and delay3;

end Behavioral;
