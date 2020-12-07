defmodule Aoc2020.Day5Test do
  use ExUnit.Case

  alias Aoc2020.Day5

  describe "first" do
    test "example" do
      assert Day5.seat_example("FBFBBFFRLR") == {44, 5, 357}
      assert Day5.seat_example("BFFFBBFRRR") == {70, 7, 567}
      assert Day5.seat_example("FFFBBBFRRR") == {14, 7, 119}
      assert Day5.seat_example("BBFFBBFRLL") == {102, 4, 820}
    end

    test "task" do
      assert Day5.first(data()) == 892
    end
  end

  describe "second" do
    test "task" do
      assert Day5.second(data()) == 625
    end
  end

  defp data() do
    File.read!(Application.app_dir(:aoc2020, "priv/day5.txt"))
  end
end
