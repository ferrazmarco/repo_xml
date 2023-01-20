defmodule RepoXmlWeb.Api.V1.CtesView do
  use RepoXmlWeb, :view

  def render("index.json", %{cte: ctes}) do
    %{
      count: length(ctes),
      data: render_many(ctes, RepoXmlWeb.Api.V1.CtesView, "cte.json")
    }
  end

  def render("show.json", %{cte: cte}) do
    %{
      data: render_one(cte, RepoXmlWeb.Api.V1.CtesView, "cte.json")
    }
  end

  def render("delete.json", %{cte: _cte}) do
    %{
      message: "CTe deleted with success!"
    }
  end

  def render("cte.json", %{ctes: cte}) do
    %{
      id: cte.id,
      key: cte.key,
      number: cte.number,
      weight: cte.weight,
      merchandise_value: cte.merchandise_value,
      issuer_cnpj: cte.issuer_cnpj,
      issuer_name: cte.issuer_name,
      authorized: cte.authorized,
      components:
        Enum.map(cte.components, fn component ->
          %{
            name: component.name,
            value: component.value
          }
        end)
    }
  end
end
