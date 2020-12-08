defmodule Aoc2020.Day8 do
  def first(string) do
    string
    |> parse()
    |> Map.new()
    |> exec_until_inf_loop(0, 0, MapSet.new())
  end

  defp parse(string) do
    string
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> Enum.with_index()
    |> Enum.map(fn {op, ix} -> {ix, op} end)
  end

  def parse_line(line) do
    [op, arg] = String.split(line, " ", trim: true)
    {String.to_atom(op), to_num(arg)}
  end

  defp to_num("+" <> num), do: String.to_integer(num)
  defp to_num("-" <> num), do: -String.to_integer(num)

  defp exec_until_inf_loop(instructions, index, acc, visited) do
    if index in visited do
      acc
    else
      visited = MapSet.put(visited, index)
      {index, acc} = eval(Map.fetch!(instructions, index), index, acc)
      exec_until_inf_loop(instructions, index, acc, visited)
    end
  end

  defp eval({:nop, _}, index, acc) do
    {index + 1, acc}
  end

  defp eval({:acc, num}, index, acc) do
    {index + 1, acc + num}
  end

  defp eval({:jmp, offset}, index, acc) do
    {index + offset, acc}
  end

  def second(string) do
    string
    |> parse()
    |> find_success_exec([])
  end

  defp find_success_exec([{ix, {instruction_name, offset}} = instruction | rest], before)
       when instruction_name in [:jmp, :nop] do
    instructions = before ++ [{ix, {swap_instruction(instruction_name), offset}}] ++ rest

    case exec_until_end(Map.new(instructions), 0, 0, MapSet.new()) do
      {:ok, acc} ->
        acc

      :error ->
        find_success_exec(rest, before ++ [instruction])
    end
  end

  defp find_success_exec([instruction | rest], before) do
    find_success_exec(rest, before ++ [instruction])
  end

  defp swap_instruction(:jmp), do: :nop
  defp swap_instruction(:nop), do: :jmp

  defp exec_until_end(instructions, index, acc, visited) do
    cond do
      index >= map_size(instructions) ->
        {:ok, acc}

      index in visited ->
        :error

      true ->
        visited = MapSet.put(visited, index)
        {index, acc} = eval(Map.fetch!(instructions, index), index, acc)
        exec_until_end(instructions, index, acc, visited)
    end
  end
end
