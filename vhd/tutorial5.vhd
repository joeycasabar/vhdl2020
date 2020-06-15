-- Nandland tutorial 5
-- Joey 13 June 2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Seven_Segment_Test is
  port (
  i_Clk : in std_logic;
  i_Switch_1 : in std_logic;
  o_LED_1 : out std_logic;

  o_Segment1_A : out std_logic;
  o_Segment1_B : out std_logic;
  o_Segment1_C : out std_logic;
  o_Segment1_D : out std_logic;
  o_Segment1_E : out std_logic;
  o_Segment1_F : out std_logic;
  o_Segment1_G : out std_logic
  );
end entity Seven_Segment_Test;

architecture RTL of Seven_Segment_Test is

  signal r_LED_1 : std_logic := '0';
  signal r_Switch_1 : std_logic := '0';
  signal w_Switch_1 : std_logic;
  signal r_counter : integer range 0 to 15 := 0;
  signal counter_i : std_logic_vector(3 downto 0) := "0000";

  begin

    Debounce_Inst : entity work.Debounce_Switch
      port map (
        i_Clk    => i_Clk,
        i_Switch => i_Switch_1,
        o_Switch => w_Switch_1
        );

    p_Register : process (i_Clk) is
      begin
        if rising_edge(i_Clk) then
          r_Switch_1 <= w_Switch_1;

          if (w_Switch_1 = '0' and r_Switch_1) = '1' then
            if (r_counter = 15) then
              r_counter <= 0;
            else
              r_counter <= r_counter + 1;
            end if;
          end if;
        end if;
      end process p_Register;

      o_LED_1 <= i_Switch_1;

      counter_i <= std_logic_vector(to_unsigned(r_counter, r_counter'length));

      Segment_Inst : entity work.Segment_Decoder
      port map (
        i_value     => counter_i,
        o_Segment_A => o_Segment1_A,
        o_Segment_B => o_Segment1_B,
        o_Segment_C => o_Segment1_C,
        o_Segment_D => o_Segment1_D,
        o_Segment_E => o_Segment1_E,
        o_Segment_F => o_Segment1_F,
        o_Segment_G => o_Segment1_G
      )

    end architecture RTL;
