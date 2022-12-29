defmodule RepoXmlWeb.ImportsView do
  use RepoXmlWeb, :view

  alias RepoXml.Cte

  def render("200.json", %{result: %Cte{} = cte}) do
    %{
      message: "CTe importado com sucesso!",
      cte: %{
        id: cte.id,
        key: cte.key,
        weight: cte.weight,
        merchandise_value: cte.merchandise_value,
        issuer_cnpj: cte.issuer_cnpj,
        issuer_name: cte.issuer_name,
        authorized: cte.authorized
      }
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
