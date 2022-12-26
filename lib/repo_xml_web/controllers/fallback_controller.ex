defmodule RepoXmlWeb.FallbackController do
  use RepoXmlWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(RepoXmlWeb.ErrorView)
    |> render("error.json", result: result)
  end
end
