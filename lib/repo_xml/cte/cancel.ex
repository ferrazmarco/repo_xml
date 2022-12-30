defmodule RepoXml.Cte.Cancel do
  alias RepoXml.{Cte, Repo}
  @moduledoc false

  def call(%{canceled_key: key}) do
    case Repo.get_by(Cte, key: key) do
      nil ->
        {:error, %{message: "CTe not found", status: :not_found}}

      cte ->
        cte
        |> Cte.changeset(%{authorized: false})
        |> Repo.update()
    end
  end
end
