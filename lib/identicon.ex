defmodule Identicon do
  @moduledoc """
  Documentation for Identicon.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello
      :world

  """
  def hello do
    :world
  end

  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3)
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
#  def pick_color(image) do
    #%Identicon.Image{hex: hex_list} = image
    #[r, g, b | _tail] = hex_list 
    
    #%Identicon.Image{hex: [r, g, b | _tail]} = image
    #[r, g, b]
    %Identicon.Image{image | color: {r, g, b}}
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
