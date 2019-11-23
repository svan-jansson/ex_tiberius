defmodule Mix.Tasks.Test.Integration do
  use Mix.Task
  require Logger

  def run(args) do
    System.cmd("docker-compose", ["up", "-d"], into: IO.binstream(:stdio, :line))

    System.cmd("mix", ["test", "--only", "integration", "--color"],
      into: IO.binstream(:stdio, :line)
    )

    System.cmd("docker-compose", ["down"], into: IO.binstream(:stdio, :line))
  end
end
