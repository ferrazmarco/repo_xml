defmodule RepoXml.Nfe.Fetch do
  @moduledoc false
  alias RepoXml.Schemas.Nfe
  alias RepoXml.Repo
  alias Ecto.UUID

  def call(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, %{message: "Invalid ID format", status: :bad_request}}
      {:ok, _uuid} -> get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Nfe, uuid) do
      nil -> {:error, %{message: "NFee not found!", status: :not_found}}
      nfe -> {:ok, nfe}
    end
  end
end
