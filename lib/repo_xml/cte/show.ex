defmodule RepoXml.Cte.Show do
  @moduledoc false
  alias RepoXml.{Cte, Repo}
  alias Ecto.UUID

  def call(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid ID format"}
      {:ok, _uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Cte, uuid) do
      nil -> {:error, "CTe not found!"}
      cte -> {:ok, cte}
    end
  end
end
