defmodule Aoc2020.Day3Test do
  use ExUnit.Case

  alias Aoc2020.Day3

  describe "first" do
    test "example" do
      assert Day3.first("""
             ..##.........##.........##.........##.........##.........##.......
             #...#...#..#...#...#..#...#...#..#...#...#..#...#...#..#...#...#..
             .#....#..#..#....#..#..#....#..#..#....#..#..#....#..#..#....#..#.
             ..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#
             .#...##..#..#...##..#..#...##..#..#...##..#..#...##..#..#...##..#.
             ..#.##.......#.##.......#.##.......#.##.......#.##.......#.##.....
             .#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#
             .#........#.#........#.#........#.#........#.#........#.#........#
             #.##...#...#.##...#...#.##...#...#.##...#...#.##...#...#.##...#...
             #...##....##...##....##...##....##...##....##...##....##...##....#
             .#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#
             """) == 7
    end

    test "task" do
      assert Day3.first(data()) == 289
    end
  end

  describe "second" do
    test "task" do
      assert Day3.second(data()) == 5_522_401_584
    end
  end

  defp data() do
    File.read!(Application.app_dir(:aoc2020, "priv/day3.txt"))
  end
end
