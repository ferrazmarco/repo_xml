defmodule RepoXml.Cte.Update do
  alias RepoXml.{Cte, Repo}
  alias Ecto.UUID

  def call(%{id: uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{id: uuid} = params) do
    case fetch_cte(uuid) do
      nil -> {:error, "CTe not found!"}
      cte -> update_cte(cte, params)
    end
  end

  defp fetch_cte(uuid), do: Repo.get(Cte, uuid)

  defp update_cte(cte, params) do
    params
    |> Cte.changeset(cte)
    |> Repo.update()
  end
end
