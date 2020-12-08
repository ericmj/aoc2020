defmodule Aoc2020.Day6Test do
  use ExUnit.Case

  alias Aoc2020.Day6

  describe "first" do
    test "example" do
      assert Day6.first("""
             abc

             a
             b
             c

             ab
             ac

             a
             a
             a
             a

             b
             """) == 11
    end

    test "task" do
      assert Day6.first(data()) == 6742
    end
  end

  describe "second" do
    test "example" do
      assert Day6.second("""
             abc

             a
             b
             c

             ab
             ac

             a
             a
             a
             a

             b
             """) == 6
    end

    test "task" do
      assert Day6.second(data()) == 3447
    end
  end

  defp data() do
    File.read!(Application.app_dir(:aoc2020, "priv/day6.txt"))
  end
end
