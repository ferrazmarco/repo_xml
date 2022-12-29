defmodule RepoXml.Cte.Create do
  @moduledoc false
  alias RepoXml.{Cte, Repo}
  alias RepoXml.Cte.Parse

  def call(params) do
    params
    |> Parse.call()
    |> Cte.changeset()
    |> Repo.insert()
  end
end
