defmodule Api.Sample do
  use Plug.Router

  plug :match
  plug(:dispatch)

  get "/sample" do
    conn |>
      put_resp_content_type("application/json") |>
      send_resp(200, %{ok: true} |>
      Jason.encode!())
  end

end
