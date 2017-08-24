defmodule SplashClient do
  @moduledoc """
  Documentation for SplashClient.
  """

  @doc """
  Request HTML data from the specified splash server

  ## Examples
    SplashClient.render_html("http://localhost:8050", "http://www.google.com")
    "<!DOCTYPE html>...</html>"
  """
  def render_html(splash_url, url, opts \\ []) do
    build_render_html_url(splash_url, url, opts)
    |> HTTPoison.get!()
    |> Map.fetch!(:body)
  end

  @doc """
  Builds and returns the render.png url for request

  ## Examples

    iex> SplashClient.build_render_html_url("http://0.0.0.0:8050", "http://www.example.com")
    "http://0.0.0.0:8050/render.html?&url=http://www.example.com"

  """
  def build_render_html_url(splash_url, url, opts \\ []) do
    splash_url <> "/render.html?"
    |> build_params("url", url)
    |> build_optional_params(opts)
  end

  @doc """
  Requests the png data from the specified splash_server

  ## Examples

    SplashClient.render_png("http://localhost:8050", "http://www.google.com")
    <<137, 80, 78 ,15, 97, 0, 0, 15, 97, 1, ...>>

  """
  def render_png(splash_url, url, opts \\ []) do
    build_render_png_url(splash_url, url, opts)
    |> HTTPoison.get!()
    |> Map.fetch!(:body)
  end


  @doc """
  Builds and returns the render.png url for request

  ## Examples

    iex> SplashClient.build_render_png_url("http://0.0.0.0:8050", "http://www.example.com")
    "http://0.0.0.0:8050/render.png?&url=http://www.example.com"

  """
  def build_render_png_url(splash_url, url, opts \\ []) do
    splash_url <> "/render.png?"
    |> build_params("url", url)
    |> build_optional_params(opts)
  end

  @doc """
  Requests the jpeg data from the specified splash server

  ## Examples
    SplashClient.render_jpeg("http://localhost:8050", "http://www.google.com")
    <<137, 80, 78 ,15, 97, 0, 0, 15, 97, 1, ...>>

  """
  def render_jpeg(splash_url, url, opts \\ []) do
    build_render_jpeg_url(splash_url, url, opts)
    |> HTTPoison.get!()
    |> Map.fetch!(:body)
  end

  @doc """
  Builds and returns the render.jpeg url for request

  ## Examples
    iex> SplashClient.build_render_jpeg_url("http://0.0.0.0:8050", "http://www.google.com")
    "http://0.0.0.0:8050/render.jpeg?&url=http://www.google.com"

  """
  def build_render_jpeg_url(splash_url, url, opts \\ []) do
    splash_url <> "/render.jpeg?"
    |> build_params("url", url)
    |> build_optional_params(opts)
  end

  defp build_params(url, _param, nil), do: url
  defp build_params(url, param, value) do
    url <> "&" <> param <> "=" <> value
  end

  defp build_optional_params(base_url, opts) do
    Enum.reduce(opts, base_url, fn({k, v}, acc) -> acc <> "&" <> to_string(k) <> "=" <> v end)
  end
end
