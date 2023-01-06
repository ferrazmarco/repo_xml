defmodule RepoXmlWeb.NfesView do
  use RepoXmlWeb, :view

  def render("show.json", %{nfe: nfe}) do
    %{
      data: render_one(nfe, RepoXmlWeb.NfesView, "nfe.json")
    }
  end

  def render("nfe.json", %{nfes: nfe}) do
    %{
      id: nfe.id,
      key: nfe.key,
      number: nfe.number
    }
  end
end
