defmodule Api.Endpoint do
  use Phoenix.Endpoint, otp_app: :api
  
  plug Api.Sample

  def init(_key, config) do
    if config[:load_from_system_env] do
      port = 80
      {:ok, Keyword.put(config, :http, [:inet6, port: port])}
    else
      {:ok, config}
    end
  end
end
