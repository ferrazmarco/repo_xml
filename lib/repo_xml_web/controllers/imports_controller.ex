defmodule RepoXmlWeb.ImportsController do
  use RepoXmlWeb, :controller
  action_fallback RepoXml.FallbackController

  def import_xml(conn, params) do
    params["data"]
    |> RepoXml.identify_xml()
    |> handle_response(conn)
  end

  defp handle_response({:ok, struct}, conn) do
    conn
    |> put_status(:ok)
    |> render("200.json", struct: struct)
  end

  defp handle_response({:error, _} = error, _conn), do: error
end
