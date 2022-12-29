defmodule RepoXml.Cte.QueryBuilder do
  alias RepoXml.{Cte, Repo}
  import Ecto.Query

  def call(criteria) do
    base_query()
    |> build_query(criteria)
    |> Repo.all()
    |> handle_query()
  end

  defp base_query do
    from cte in Cte
  end

  defp build_query(query, criteria) do
    Enum.reduce(criteria, query, &compose_query/2)
  end

  defp compose_query({"key", key}, query) do
    where(query, [cte], cte.key == ^"#{key}")
  end

  defp compose_query({"number", number}, query) do
    where(query, [cte], cte.number == ^"%#{number}%")
  end

  defp compose_query({"issuer_cnpj", issuer_cnpj}, query) do
    where(query, [cte], cte.issuer_cnpj == ^"#{issuer_cnpj}")
  end

  defp compose_query({"authorized", authorized}, query) do
    where(query, [cte], cte.authorized == ^"#{authorized}")
  end

  defp compose_query(_, query) do
    query
  end

  defp handle_query([]), do: {:error, "Not Found"}
  defp handle_query(result), do: {:ok, result}
end
