defmodule ExTiberiusTest do
  use ExUnit.Case
  doctest ExTiberius

  test "greets the world" do
    assert ExTiberius.hello() == :world
  end
end
