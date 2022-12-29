defmodule RepoXmlWeb.CtesController do
  use RepoXmlWeb, :controller
  action_fallback RepoXmlWeb.FallbackController

  # refatorar pra mandar o status 404 quando nao encontrar a ocorrencia certa
  def index(conn, params) do
    params
    |> RepoXml.query_builder()
    |> handle_response(conn, "index.json", :ok)
  end
  def show(conn, %{"id" => id}) do
    id
    |> RepoXml.fetch_cte()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> RepoXml.update_cte()
    |> handle_response(conn, "show.json", :ok)
  end

  defp handle_response({:ok, cte}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, cte: cte)
  end

  defp handle_response({:error, _} = error, _conn, _view, _status), do: error
end
