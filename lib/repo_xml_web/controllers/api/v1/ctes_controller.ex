defmodule RepoXmlWeb.Api.V1.CtesController do
  use RepoXmlWeb, :controller
  action_fallback RepoXmlWeb.FallbackController

  alias RepoXml.Cte.QueryBuilder
  alias RepoXml.Cte.Fetch, as: FetchCte
  alias RepoXml.Cte.Update, as: UpdateCte
  alias RepoXml.Cte.Delete, as: DeleteCte

  def index(conn, params) do
    params
    |> QueryBuilder.call()
    |> handle_response(conn, "index.json", :ok)
  end

  def show(conn, %{"id" => id}) do
    id
    |> FetchCte.call()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> UpdateCte.call()
    |> handle_response(conn, "show.json", :ok)
  end

  def delete(conn, params) do
    params
    |> DeleteCte.call()
    |> handle_response(conn, "delete.json", :ok)
  end

  defp handle_response({:ok, cte}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, cte: cte)
  end

  defp handle_response({:error, _} = error, _conn, _view, _status), do: error
end
