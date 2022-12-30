defmodule RepoXml.Cte.Create do
  @moduledoc false
  alias RepoXml.{Cte, Repo}
  alias RepoXml.Cte.Parse

  def call(params) do
    params
    |> Parse.call()
    |> Cte.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, cte}), do: {:ok, cte}
  defp handle_insert({:error, changeset}), do: {:error, %{message: changeset, status: :unprocessable_entity}}
end
