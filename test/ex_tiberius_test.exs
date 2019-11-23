defmodule ExTiberiusTest do
  use ExUnit.Case
  doctest ExTiberius

  setup_all do
    {:ok, %{connection_string: "server=tcp:localhost,1433;username=sa;password=Weak1234"}}
  end

  @tag :integration
  test "can connect to a database server", %{connection_string: connection_string} do
    {status, _result} = ExTiberius.connect(connection_string)
    assert status == :ok
  end
end
