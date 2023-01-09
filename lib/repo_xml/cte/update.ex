defmodule RepoXml.Cte.Update do
  @moduledoc false
  alias RepoXml.Cte.Fetch
  alias RepoXml.Schemas.Cte
  alias RepoXml.Repo

  def call(%{"id" => uuid} = params) do
    case Fetch.call(uuid) do
      {:ok, %Cte{} = cte} -> update_cte(cte, params)
      {:error, _message} = error -> error
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
