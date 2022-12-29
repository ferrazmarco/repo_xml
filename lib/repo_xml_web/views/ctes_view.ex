defmodule RepoXmlWeb.CtesView do
  use RepoXmlWeb, :view
  alias RepoXml.Cte

  def render("show.json", %{cte: %Cte{} = cte}) do
    %{
      cte: %{
        key: cte.key,
        number: cte.number,
        weight: cte.weight,
        merchandise_value: cte.merchandise_value,
        issuer_cnpj: cte.issuer_cnpj,
        issuer_name: cte.issuer_name,
        authorized: cte.authorized
      }
    }
  end

  def render("index.json", %{cte: ctes}) do
    %{
      data:
        Enum.map(ctes, fn cte ->
          %{
            key: cte.key,
            number: cte.number,
            weight: cte.weight,
            merchandise_value: cte.merchandise_value,
            issuer_cnpj: cte.issuer_cnpj,
            issuer_name: cte.issuer_name,
            authorized: cte.authorized
          }
        end)
    }
  end
end
