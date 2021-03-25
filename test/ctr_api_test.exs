defmodule CtrApiTest do
  use ExUnit.Case
  doctest CtrApi

  test "greets the world" do
    assert CtrApi.hello() == :world
  end
end
