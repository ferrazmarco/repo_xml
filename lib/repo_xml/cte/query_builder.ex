defmodule RepoXml.Cte.QueryBuilder do
  @moduledoc false

  alias RepoXml.{Cte, Repo}
  import Ecto.Query

  def call(criteria) do
    base_query()
    |> build_query(criteria)
    |> Repo.all()
    |> handle_query()
  end

  defp base_query do
    from cte in Cte,
      select: [
        :id,
        :key,
        :issuer_cnpj,
        :issuer_name,
        :number,
        :weight,
        :authorized,
        :merchandise_value
      ],
      order_by: [desc: :emission_date]
  end

  defp build_query(query, criteria) do
    Enum.reduce(criteria, query, &compose_query/2)
  end

  defp compose_query({"key", key}, query) do
    where(query, [cte], cte.key == ^"#{key}")
  end

  defp compose_query({"number", number}, query) do
    where(query, [cte], cte.number == ^"#{number}")
  end

  defp compose_query({"issuer_cnpj", issuer_cnpj}, query) do
    where(query, [cte], cte.issuer_cnpj == ^"#{issuer_cnpj}")
  end

  defp compose_query({"authorized", authorized}, query) do
    case Ecto.Type.cast(:boolean, authorized) do
      :error -> query
      {:ok, result} -> where(query, [cte], cte.authorized == ^"#{result}")
    end
  end

  defp compose_query(_, query) do
    query
  end

  defp handle_query([]), do: {:error, %{message: "Not Found", status: :not_found}}
  defp handle_query(result), do: {:ok, result}
end
