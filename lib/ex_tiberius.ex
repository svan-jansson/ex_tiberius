defmodule ExTiberius do
  alias ExTiberius.Nif

  def connect(connection_string), do: Nif.connect(connection_string)
end
