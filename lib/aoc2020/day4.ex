defmodule Aoc2020.Day4 do
  def first(string) do
    string
    |> parse()
    |> Enum.count(&valid_passport_first?/1)
  end

  defp parse(string) do
    string
    |> String.split("\n\n", trim: true)
    |> Enum.map(fn passport ->
      passport
      |> String.split(["\n", " "], trim: true)
      |> Map.new(&List.to_tuple(String.split(&1, ":", trim: true)))
    end)
  end

  defp valid_passport_first?(passport) do
    map_size(passport) == 8 or (map_size(passport) == 7 and not Map.has_key?(passport, "cid"))
  end

  def second(string) do
    string
    |> parse()
    |> Enum.count(&valid_passport_second?/1)
  end

  defp valid_passport_second?(passport) do
    valid_passport_first?(passport) and
      Enum.all?(passport, fn {field, value} -> validate_field?(field, value) end)
  end

  defp validate_field?("byr", value), do: to_integer(value) in 1920..2002
  defp validate_field?("iyr", value), do: to_integer(value) in 2010..2020
  defp validate_field?("eyr", value), do: to_integer(value) in 2020..2030
  defp validate_field?("hcl", value), do: Regex.match?(~r"^\#[0-9a-f]{6}$", value)
  defp validate_field?("ecl", value), do: value in ~w(amb blu brn gry grn hzl oth)
  defp validate_field?("pid", value), do: Regex.match?(~r"^[0-9]{9}$", value)
  defp validate_field?("cid", _value), do: true

  defp validate_field?("hgt", value),
    do: integer_range_suffix?(value, 150..193, "cm") or integer_range_suffix?(value, 59..76, "in")

  defp to_integer(string) do
    case Integer.parse(string) do
      {int, ""} -> int
      _ -> nil
    end
  end

  defp integer_range_suffix?(string, range, suffix) do
    case Integer.parse(string) do
      {int, ^suffix} -> int in range
      _ -> false
    end
  end
end
