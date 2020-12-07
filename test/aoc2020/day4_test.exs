defmodule Aoc2020.Day4Test do
  use ExUnit.Case

  alias Aoc2020.Day4

  describe "first" do
    test "example" do
      assert Day4.first("""
             ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
             byr:1937 iyr:2017 cid:147 hgt:183cm

             iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
             hcl:#cfa07d byr:1929

             hcl:#ae17e1 iyr:2013
             eyr:2024
             ecl:brn pid:760753108 byr:1931
             hgt:179cm

             hcl:#cfa07d eyr:2025 pid:166559648
             iyr:2011 ecl:brn hgt:59in
             """) == 2
    end

    test "task" do
      assert Day4.first(data()) == 228
    end
  end

  describe "second" do
    test "task" do
      assert Day4.second(data()) == 175
    end
  end

  defp data() do
    File.read!(Application.app_dir(:aoc2020, "priv/day4.txt"))
  end
end
