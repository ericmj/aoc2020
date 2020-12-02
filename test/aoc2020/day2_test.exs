defmodule Aoc2020.Day2Test do
  use ExUnit.Case

  alias Aoc2020.Day2

  describe "first" do
    test "example" do
      assert Day2.first("""
             1-3 a: abcde
             1-3 b: cdefg
             2-9 c: ccccccccc
             """) == 2
    end

    test "task" do
      assert Day2.first(data()) == 538
    end
  end

  describe "second" do
    test "task" do
      assert Day2.second(data()) == 489
    end
  end

  defp data() do
    File.read!(Application.app_dir(:aoc2020, "priv/day2.txt"))
  end
end
