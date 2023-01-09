defmodule RepoXmlWeb.ImportsView do
  use RepoXmlWeb, :view

  alias RepoXml.Schemas.{Cte, Nfe}

  def render("200.json", %{result: %Cte{} = cte}) do
    %{
      data: render_one(cte, RepoXmlWeb.CtesView, "cte.json")
    }
  end

  def render("200.json", %{result: %Nfe{} = nfe}) do
    %{
      data: render_one(nfe, RepoXmlWeb.NfesView, "nfe.json")
    }
  end
end
