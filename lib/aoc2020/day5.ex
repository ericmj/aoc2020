defmodule Aoc2020.Day5 do
  @front_chars [?F, ?L]
  @back_chars [?B, ?R]

  def first(string) do
    string
    |> parse()
    |> Enum.map(&elem(seat(&1), 2))
    |> Enum.max()
  end

  def seat_example(string) do
    seat(parse_line(string))
  end

  defp seat(line) do
    {row, line} = partition(line, 0, 127)
    {col, []} = partition(line, 0, 7)
    {row, col, row * 8 + col}
  end

  defp partition([char | rest], left, right) when char in @front_chars and right - left == 1 do
    {left, rest}
  end

  defp partition([char | rest], left, right) when char in @back_chars and right - left == 1 do
    {right, rest}
  end

  defp partition([char | rest], left, right) when char in @front_chars do
    partition(rest, left, right - ceil((right - left) / 2))
  end

  defp partition([char | rest], left, right) when char in @back_chars do
    partition(rest, left + ceil((right - left) / 2), right)
  end

  defp partition(rest, same, same) do
    {same, rest}
  end

  defp parse(string) do
    string
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  def parse_line(line) do
    String.to_charlist(line)
  end

  def second(string) do
    string
    |> parse()
    |> Enum.map(&elem(seat(&1), 2))
    |> Enum.sort()
    |> find_gap()
  end

  defp find_gap([left, right | _]) when right - left == 2 do
    right - 1
  end

  defp find_gap([_ | rest]) do
    find_gap(rest)
  end
end
