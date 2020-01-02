use Mix.Config

config :phoenix, :json_library, Jason

config :api, Api.Endpoint,
  server: true,
  http: [port: 3999],
  debug_errors: true,
  code_reloader: true,
  check_origin: false
