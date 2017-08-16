defmodule SplashClientTest do
  use ExUnit.Case
  doctest SplashClient

  test "greets the world" do
    assert SplashClient.hello() == :world
  end
end
