defmodule RepoXml.Cte.Create do
  alias RepoXml.{Cte, Repo}
  alias RepoXml.Cte.Parse

  def call(params) do
    params
    |> Cte.build()
    |> Repo.insert()
    |> populate_fields()
  end

  defp populate_fields({:ok, struct}) do
    struct
    |> Parse.call()
  end

  defp populate_fields({:error, _changeset} = error), do: error
end
