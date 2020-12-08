defmodule Aoc2020.Day8Test do
  use ExUnit.Case

  alias Aoc2020.Day8

  describe "first" do
    test "example" do
      assert Day8.first("""
             nop +0
             acc +1
             jmp +4
             acc +3
             jmp -3
             acc -99
             acc +1
             jmp -4
             acc +6
             """) == 5
    end

    test "task" do
      assert Day8.first(data()) == 1200
    end
  end

  describe "second" do
    test "example" do
      assert Day8.second("""
              nop +0
              acc +1
              jmp +4
              acc +3
              jmp -3
              acc -99
              acc +1
              jmp -4
              acc +6
             """) == 8
    end

    test "task" do
      assert Day8.second(data()) == 1023
    end
  end

  defp data() do
    File.read!(Application.app_dir(:aoc2020, "priv/day8.txt"))
  end
end
