defmodule SplashClient do
  @moduledoc """
  Documentation for SplashClient.
  """

  def render_png(url, width \\ nil, height\\ nil, render_all \\ nil, wait \\ nil) do
    render_png_url(url, width, height, render_all, wait)
    |> HTTPoison.get!()
    |> Map.fetch!(:body)
  end

  @doc """


  ## Examples

      iex> SplashClient.render_png_url("http://www.example.com")
      "http://0.0.0.0:8050/render.png?&url=http://www.example.com"

  """
  def render_png_url(url, width \\ nil, height\\ nil, render_all \\ nil, wait \\ nil) do
    "http://0.0.0.0:8050/render.png?"
    |> build_params("url", url)
    |> build_params("width", width)
    |> build_params("height", height)
    |> build_params("render_all", render_all)
    |> build_params("wait", wait)
  end

  defp build_params(url, _param, nil), do: url
  defp build_params(url, param, value) do
    url <> "&" <> param <> "=" <> value
  end

end
