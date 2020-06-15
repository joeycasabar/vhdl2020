-- NAndland tutorial 5
-- Joey June 13 June 2020

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Segment_Decoder is
  port (
    i_value : in std_logic_vector (3 downto 0);
    o_Segment_A : out std_logic;
    o_Segment_B : out std_logic;
    o_Segment_C : out std_logic;
    o_Segment_D : out std_logic;
    o_Segment_E : out std_logic;
    o_Segment_F : out std_logic;
    o_Segment_G : out std_logic
  );
end entity Segment_Decoder;

architecture RTL of Segment_Decoder is

  signal index_i : integer range 0 to 15;

  constant encoding_A : std_logic_vector(0 to 15) := "1011011111101011";
  constant encoding_B : std_logic_vector(0 to 15) := "1111100111100100";
  constant encoding_C : std_logic_vector(0 to 15) := "1101111111110100";
  constant encoding_D : std_logic_vector(0 to 15) := "1011011011011110";
  constant encoding_E : std_logic_vector(0 to 15) := "1010001010111111";
  constant encoding_F : std_logic_vector(0 to 15) := "1000111011111011";
  constant encoding_G : std_logic_vector(0 to 15) := "0011111011110111";

  begin

    index_i <= to_integer(unsigned(i_value));

    o_Segment_A <= not encoding_A(index_i);
    o_Segment_B <= not encoding_B(index_i);
    o_Segment_C <= not encoding_C(index_i);
    o_Segment_D <= not encoding_D(index_i);
    o_Segment_E <= not encoding_E(index_i);
    o_Segment_F <= not encoding_F(index_i);
    o_Segment_G <= not encoding_G(index_i);

    -- o_Segment_B <= '1' when i_value(2 downto 0) = "110" | i_value() = "0100" | i_value = "1110" | i_value = "1011" else
    --               '0';
    --
    -- o_Segment_C <= '1' when i_value = "0001" | i_value = "0100" | i_value = "1110" | i_value = "1011" else
    --               '0';
    --
    -- o_Segment_D <= '1' when i_value = "0001" | i_value = "0100" | i_value = "1110" | i_value = "1011" else
    --               '0';
    --
    -- o_Segment_E <= '1' when i_value = "0001" | i_value = "0100" | i_value = "1110" | i_value = "1011" else
    --               '0';
    --
    -- o_Segment_F <= '1' when i_value = "0001" | i_value = "0100" | i_value = "1110" | i_value = "1011" else
    --               '0';
    --
    -- o_Segment_G <= '1' when i_value = "0001" | i_value = "0100" | i_value = "1110" | i_value = "1011" else
    --               '0';

    end architecture RTL;
