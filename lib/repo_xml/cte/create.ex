defmodule RepoXml.Cte.Create do
  alias RepoXml.{Cte, Repo}

  def call(params) do
    params
    |> Cte.build()
    |> create_cte()
  end

  defp create_cte({:ok, struct}), do: Repo.insert(struct)
  defp create_cte({:error, _changeset} = error), do: error
end
