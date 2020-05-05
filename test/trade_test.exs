defmodule TradeTest do
  use ExUnit.Case
  doctest Trade

  test "greets the world" do
    assert Trade.hello() == :world
  end
end
