defmodule ExTiberius.Nif do
  use Rustler, otp_app: :ex_tiberius, crate: "ex_tiberius_nif"

  def connect(_connection_string), do: :erlang.nif_error(:nif_not_loaded)
end
