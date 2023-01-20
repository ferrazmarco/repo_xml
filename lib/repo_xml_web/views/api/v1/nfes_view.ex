defmodule RepoXmlWeb.Api.V1.NfesView do
  use RepoXmlWeb, :view

  def render("index.json", %{nfe: nfes}) do
    %{
      count: length(nfes),
      data: render_many(nfes, RepoXmlWeb.Api.V1.NfesView, "nfe.json")
    }
  end

  def render("show.json", %{nfe: nfe}) do
    %{
      data: render_one(nfe, RepoXmlWeb.Api.V1.NfesView, "nfe.json")
    }
  end

  def render("delete.json", %{nfe: _nfe}) do
    %{
      message: "NFe deleted with success!"
    }
  end

  def render("nfe.json", %{nfes: nfe}) do
    %{
      id: nfe.id,
      key: nfe.key,
      number: nfe.number,
      issuer_cnpj: nfe.issuer_cnpj,
      issuer_name: nfe.issuer_name,
      specie: nfe.specie,
      ncm: nfe.ncm,
      value: nfe.value,
      quantity: nfe.quantity,
      emission_date: nfe.emission_date,
      weight: nfe.weight
    }
  end
end
