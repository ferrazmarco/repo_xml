defmodule RepoXmlWeb.Api.V1.ImportsController do
  use RepoXmlWeb, :controller
  action_fallback RepoXmlWeb.FallbackController

  def init(_conn, _params) do
  end

  def import_xml(conn, params) do
    params["data"]
    |> RepoXml.identify_xml()
    |> handle_response(conn)
  end

  defp handle_response({:ok, result}, conn) do
    conn
    |> put_status(:created)
    |> render("200.json", result: result)
  end

  defp handle_response({:error, _} = error, _conn), do: error
end
