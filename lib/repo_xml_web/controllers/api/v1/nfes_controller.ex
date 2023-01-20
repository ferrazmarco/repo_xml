defmodule RepoXmlWeb.Api.V1.NfesController do
  use RepoXmlWeb, :controller
  action_fallback RepoXmlWeb.FallbackController

  alias RepoXml.Nfe.QueryBuilder
  alias RepoXml.Nfe.Fetch, as: FetchNfe
  alias RepoXml.Nfe.Delete, as: DeleteNfe

  def index(conn, params) do
    params
    |> QueryBuilder.call()
    |> handle_response(conn, "index.json", :ok)
  end

  def show(conn, %{"id" => id}) do
    id
    |> FetchNfe.call()
    |> handle_response(conn, "show.json", :ok)
  end

  def delete(conn, params) do
    params
    |> DeleteNfe.call()
    |> handle_response(conn, "delete.json", :ok)
  end

  defp handle_response({:ok, nfe}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, nfe: nfe)
  end

  defp handle_response({:error, _} = error, _conn, _view, _status), do: error
end
