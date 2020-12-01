defmodule Aoc2020.Day1 do
  @find_sum 2020

  def first(string) do
    string
    |> parse()
    |> find_product_pair()
  end

  defp find_product_pair([_head | tail] = list) do
    find_product_pair(list, tail)
  end

  defp find_product_pair([head1 | _tail1], [head2 | _tail2]) when head1 + head2 == @find_sum do
    head1 * head2
  end

  defp find_product_pair(list1, [_head2 | tail2]) do
    find_product_pair(list1, tail2)
  end

  defp find_product_pair([_head1 | [_head2 | list2] = list1], []) do
    find_product_pair(list1, list2)
  end

  def second(string) do
    string
    |> parse()
    |> find_product_triple()
  end

  defp find_product_triple(list) do
    list_indexes = Enum.with_index(list)

    for {num1, ix1} <- list_indexes,
        {num2, ix2} <- list_indexes,
        {num3, ix3} <- list_indexes,
        ix1 != ix2 or ix1 != ix3 or ix2 != ix3,
        num1 + num2 + num3 == @find_sum,
        do: throw({:aoc, num1 * num2 * num3})
  catch
    {:aoc, result} -> result
  end

  defp parse(string) do
    string
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
  end
end
