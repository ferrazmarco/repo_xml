defmodule RepoXml.Cte.Update do
  @moduledoc false
  alias RepoXml.{Cte, Repo}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, %{message: "Invalid ID format", status: :bad_request}}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => uuid} = params) do
    case Repo.get(Cte, uuid) do
      nil -> {:error, %{message: "CTe not found!", status: :not_found}}
      cte -> update_cte(cte, params)
    end
  end

  defp update_cte(cte, params) do
    Cte.changeset(
      cte,
      params |> Map.filter(fn {key, _value} -> key === "authorized" end)
    )
    |> Repo.update()
  end
end
