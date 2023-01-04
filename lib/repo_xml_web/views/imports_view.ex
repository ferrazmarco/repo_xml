defmodule RepoXmlWeb.ImportsView do
  use RepoXmlWeb, :view

  alias RepoXml.Cte

  def render("200.json", %{result: %Cte{} = cte}) do
    %{
      data: render_one(cte, RepoXmlWeb.CtesView, "cte.json")
    }
  end

  # def render("create.json", %{result: %Nfe{id: id, key: key}}) do
  #   %{
  #     message: "NFe importada com sucesso!",
  #     nfe: %{
  #       id: id,
  #       key: key
  #     }
  #   }
  # end
end
