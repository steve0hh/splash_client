defmodule SplashClientTest do
  use ExUnit.Case
  doctest SplashClient

  describe "build_render_png" do
    test "Returns render.png url" do
      assert SplashClient.build_render_png_url("http://0.0.0.0:8050", "http://www.google.com")
      == "http://0.0.0.0:8050/render.png?&url=http://www.google.com"
    end

    test "Returns render.png url along with optional parameters" do
      assert SplashClient.build_render_png_url("http://0.0.0.0:8050", "http://www.google.com", width: "1")
      == "http://0.0.0.0:8050/render.png?&url=http://www.google.com&width=1"
    end
  end

  describe "build_render_html_url" do
    test "Returns render.html url" do
      assert SplashClient.build_render_html_url("http://0.0.0.0:8050", "http://www.google.com")
      == "http://0.0.0.0:8050/render.html?&url=http://www.google.com"
    end

    test "Returns render.html url along with optional parameters" do
      assert SplashClient.build_render_html_url("http://0.0.0.0:8050", "http://www.google.com", width: "1")
      == "http://0.0.0.0:8050/render.html?&url=http://www.google.com&width=1"
    end

  end

  describe "build_render_jpeg_url" do
    test "Returns render.jpeg url" do
      assert SplashClient.build_render_jpeg_url("http://0.0.0.0:8050", "http://www.google.com")
      == "http://0.0.0.0:8050/render.jpeg?&url=http://www.google.com"
    end

    test "Returns render.jpeg url along with optional parameters" do
      assert SplashClient.build_render_jpeg_url("http://0.0.0.0:8050", "http://www.google.com", width: "1")
      == "http://0.0.0.0:8050/render.jpeg?&url=http://www.google.com&width=1"
    end

  end
end
