# SplashClient

SplashClient is a simple wrapper API that wraps Scrapyhub's Splash project.

# How to use

Initialise splash

```bash
docker run -p 8050:8050 scrapinghub/splash
```

Example usage

```elixir
iex> SplashClient.render_png_url("http://www.example.com")
"http://0.0.0.0:8050/render.png?&url=http://www.example.com"
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `splash_client` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:splash_client, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/splash_client](https://hexdocs.pm/splash_client).

