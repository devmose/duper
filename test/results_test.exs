defmodule Duper.ResultsTest do
  use ExUnit.Case

  alias Duper.Results

  test "can add entries to the results" do

    Results.add_hash_for("path1", 123)
    Results.add_hash_for("path2", 345)
    Results.add_hash_for("path3", 345)
    Results.add_hash_for("path4", 123)

    duplicates = Results.find_duplicates()

    IO.puts duplicates
    assert length(duplicates) == 2
    assert ~w{path4 path1} in duplicates
  end
end
