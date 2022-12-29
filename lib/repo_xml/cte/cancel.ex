defmodule RepoXml.Cte.Cancel do
  alias RepoXml.{Cte, Repo}

  def call(%{canceled_key: key}) do
    case Repo.get_by(Cte, key: key) do
      nil ->
        {:error, "CTe not found"}

      cte ->
        cte
        |> Cte.changeset(%{authorized: false})
        |> Repo.update()
    end
  end
end
