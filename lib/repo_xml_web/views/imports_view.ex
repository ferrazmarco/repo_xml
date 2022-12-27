defmodule RepoXmlWeb.ImportsView do
  use RepoXmlWeb, :view

  alias RepoXml.Cte

  def render("200.json", %{result: %Cte{id: id, key: key, weight: weight, merchandise_value: merchandise_value, issuer_cnpj: issuer_cnpj, issuer_name: issuer_name}}) do
    %{
      message: "CTe importado com sucesso!",
      cte: %{
        id: id,
        key: key,
        weight: weight,
        merchandise_value: merchandise_value,
        issuer_cnpj: issuer_cnpj,
        issuer_name: issuer_name
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
