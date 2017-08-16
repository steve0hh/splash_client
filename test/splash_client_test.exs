defmodule SplashClientTest do
  use ExUnit.Case
  doctest SplashClient

  test "Returns render.png url" do
    assert SplashClient.render_png_url("http://www.google.com") == "http://0.0.0.0:8050/render.png?&url=http://www.google.com"
  end
end
