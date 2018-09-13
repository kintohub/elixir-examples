defmodule ElixirExample.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get("/", do: send_resp(conn, 200, "Hello World"))
  
  @apidoc """
  @api {get} /sample/{name} Prints "{name}"
  @apiName HelloWorld
  @apiParam (Url) {String} name the name to print
  @apiSuccess (200) {String} message the hello {name} message
  """
  get "/sample/:message" do
    send_resp(conn, 200, "#{message}")
  end

  match(_, do: send_resp(conn, 404, "404 - Not Found"))
end
