defmodule RepoXml.Nfe.QueryBuilder do
  @moduledoc false

  alias RepoXml.Schemas.Nfe
  alias RepoXml.Repo
  import Ecto.Query

  def call(criteria) do
    base_query()
    |> build_query(criteria)
    |> Repo.all()
    |> handle_query()
  end

  defp base_query do
    from nfe in Nfe, order_by: [desc: :emission_date]
  end

  defp build_query(query, criteria) do
    Enum.reduce(criteria, query, &compose_query/2)
  end

  defp compose_query({"key", key}, query) do
    where(query, [nfe], nfe.key == ^"#{key}")
  end

  defp compose_query({"number", number}, query) do
    where(query, [nfe], nfe.number == ^"#{number}")
  end

  defp compose_query({"issuer_cnpj", issuer_cnpj}, query) do
    where(query, [nfe], nfe.issuer_cnpj == ^"#{issuer_cnpj}")
  end

  defp compose_query(_, query) do
    query
  end

  defp handle_query([]), do: {:error, %{message: "Not Found", status: :not_found}}
  defp handle_query(result), do: {:ok, result}
end
