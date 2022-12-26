defmodule RepoXmlWeb.ImportsView do
  use RepoXmlWeb, :view

  alias RepoXml.Cte

  def render("200.json", %{struct: %Cte{id: id, key: key}}) do
    %{
      message: "CTe importado com sucesso!",
      cte: %{
        id: id,
        key: key
      }
    }
  end

  # def render("create.json", %{struct: %Nfe{id: id, key: key}}) do
  #   %{
  #     message: "NFe importada com sucesso!",
  #     nfe: %{
  #       id: id,
  #       key: key
  #     }
  #   }
  # end
end
