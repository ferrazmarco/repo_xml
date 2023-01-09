defmodule RepoXml.Cte.Delete do
  @moduledoc false
  alias RepoXml.Cte.Fetch
  alias RepoXml.Schemas.Cte
  alias RepoXml.Repo

  def call(%{"id" => uuid}) do
    case Fetch.call(uuid) do
      {:ok, %Cte{} = cte} -> Repo.delete(cte)
      {:error, _message} = error -> error
    end
  end
end
