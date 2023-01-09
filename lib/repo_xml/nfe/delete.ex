defmodule RepoXml.Nfe.Delete do
  @moduledoc false
  alias RepoXml.Repo
  alias RepoXml.Schemas.Nfe
  alias RepoXml.Nfe.Fetch

  def call(%{"id" => uuid}) do
    case Fetch.call(uuid) do
      {:ok, %Nfe{} = nfe} -> Repo.delete(nfe)
      {:error, _message} = error -> error
    end
  end
end
