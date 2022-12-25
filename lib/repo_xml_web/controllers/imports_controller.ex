defmodule RepoXmlWeb.ImportsController do
  use RepoXmlWeb, :controller

  def import_xml(conn, params) do
    params
    |> RepoXml.identify_xml()
  end
end
