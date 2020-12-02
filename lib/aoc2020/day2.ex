defmodule Aoc2020.Day2 do
  def first(string) do
    string
    |> parse()
    |> Stream.map(&valid_password_first?/1)
    |> Enum.count(& &1)
  end

  defp parse(string) do
    string
    |> String.split("\n", trim: true)
    |> Stream.map(&parse_line/1)
  end

  defp parse_line(line) do
    {min, "-" <> line} = Integer.parse(line)
    {max, " " <> line} = Integer.parse(line)
    <<char, ": ", password::binary>> = line
    {min, max, char, password}
  end

  defp valid_password_first?({min, max, char, password}) do
    occurences = length(:binary.matches(password, <<char>>))
    occurences in min..max
  end

  def second(string) do
    string
    |> parse()
    |> Stream.map(&valid_password_second?/1)
    |> Enum.count(& &1)
  end

  defp valid_password_second?({min, max, char, password}) do
    :erlang.xor(:binary.at(password, min - 1) == char, :binary.at(password, max - 1) == char)
  end
end
