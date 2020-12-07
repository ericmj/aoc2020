defmodule Aoc2020.Day3 do
  def first(string) do
    map = parse(string)
    max_x = find_max_x(map, 0)

    count_trees_on_slope(map, 0, 0, 3, 1, max_x, 0)
  end

  defp parse(string) do
    string
    |> String.split("\n", trim: true)
    |> Enum.with_index()
    |> Enum.flat_map(fn {line, y} ->
      line
      |> String.to_charlist()
      |> Enum.with_index()
      |> Enum.map(fn {char, x} -> {{x, y}, square_type(char)} end)
    end)
    |> Map.new()
  end

  defp square_type(?.), do: :open
  defp square_type(?#), do: :tree

  defp find_max_x(map, x) do
    case Map.fetch(map, {x, 0}) do
      {:ok, _} -> find_max_x(map, x + 1)
      :error -> x
    end
  end

  defp count_trees_on_slope(map, x_pos, y_pos, x_step, y_step, max_x, count) do
    case Map.fetch(map, {rem(x_pos, max_x), y_pos}) do
      {:ok, :tree} ->
        count_trees_on_slope(
          map,
          x_pos + x_step,
          y_pos + y_step,
          x_step,
          y_step,
          max_x,
          count + 1
        )

      {:ok, :open} ->
        count_trees_on_slope(map, x_pos + x_step, y_pos + y_step, x_step, y_step, max_x, count)

      :error ->
        count
    end
  end

  def second(string) do
    map = parse(string)
    max_x = find_max_x(map, 0)

    slopes = [
      {1, 1},
      {3, 1},
      {5, 1},
      {7, 1},
      {1, 2}
    ]

    count_trees_on_slopes(map, max_x, slopes)
  end

  defp count_trees_on_slopes(map, max_x, slopes) do
    Enum.reduce(slopes, 1, fn {x_step, y_step}, acc ->
      acc * count_trees_on_slope(map, 0, 0, x_step, y_step, max_x, 0)
    end)
  end
end
