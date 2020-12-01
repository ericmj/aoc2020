defmodule Aoc2020.Day1Test do
  use ExUnit.Case

  alias Aoc2020.Day1

  describe "first" do
    test "example" do
      assert Day1.first("""
             1721
             979
             366
             299
             675
             1456
             """) == 514_579
    end

    test "task" do
      assert Day1.first(data()) == 842_016
    end
  end

  describe "second" do
    test "task" do
      assert Day1.second(data()) == 9_199_664
    end
  end

  defp data() do
    File.read!(Application.app_dir(:aoc2020, "priv/day1.txt"))
  end
end
