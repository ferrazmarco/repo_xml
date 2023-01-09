defmodule RepoXml.Nfe.Create do
  @moduledoc false
  alias RepoXml.Repo
  alias RepoXml.Schemas.Nfe
  alias RepoXml.Nfe.Parse

  def call(params) do
    params
    |> Parse.call()
    |> Nfe.changeset()
    |> Repo.insert
    |> handle_insert
  end

  defp handle_insert({:ok, nfe}), do: {:ok, nfe}
  defp handle_insert({:error, changeset}), do: {:error, %{message: changeset, status: :unprocessable_entity}}
end
