defmodule Aoc2020.Day7 do
  def first(string) do
    string
    |> parse()
    |> build_lookup()
    |> contain_bags("shiny gold bag")
    |> Enum.uniq()
    |> Enum.count()
  end

  defp parse(string) do
    string
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  def parse_line(line) do
    [key, line] =
      line
      |> String.trim_trailing(".")
      |> String.split(" contain ", trim: true)

    contain_bags =
      line
      |> String.split(", ")
      |> Enum.flat_map(fn
        "no other bags" ->
          []

        bag_type ->
          {num, " " <> bag} = Integer.parse(bag_type)
          [{num, String.trim_trailing(bag, "s")}]
      end)

    {String.trim_trailing(key, "s"), contain_bags}
  end

  defp build_lookup(list) do
    Enum.reduce(list, %{}, fn {outer, inners}, map ->
      Enum.reduce(inners, map, fn {count, inner}, map ->
        Map.update(map, inner, [{outer, count}], &[{outer, count} | &1])
      end)
    end)
  end

  defp contain_bags(map, key) do
    case Map.fetch(map, key) do
      {:ok, outers} ->
        Enum.map(outers, &elem(&1, 0)) ++
          Enum.flat_map(outers, fn {outer, _count} -> contain_bags(map, outer) end)

      :error ->
        []
    end
  end

  def second(string) do
    string
    |> parse()
    |> Map.new()
    |> count_contain_bags("shiny gold bag")
  end

  defp count_contain_bags(map, key) do
    case Map.fetch(map, key) do
      {:ok, inners} ->
        Enum.reduce(inners, 0, fn {count, inner}, acc ->
          acc + count + count * count_contain_bags(map, inner)
        end)

      :error ->
        1
    end
  end
end
