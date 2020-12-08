defmodule Aoc2020.Day6 do
  def first(string) do
    string
    |> parse()
    |> Enum.map(&Enum.concat/1)
    |> Enum.map(&Enum.count(Enum.uniq(&1)))
    |> Enum.sum()
  end

  defp parse(string) do
    string
    |> String.split("\n\n", trim: true)
    |> Enum.map(&parse_group/1)
  end

  def parse_group(group) do
    group
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_charlist/1)
  end

  def second(string) do
    string
    |> parse()
    |> Enum.map(fn group ->
      [line | lines] = Enum.map(group, &MapSet.new/1)

      Enum.count(line, fn answer ->
        Enum.all?(lines, &(answer in &1))
      end)
    end)
    |> Enum.sum()
  end
end
