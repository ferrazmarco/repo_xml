defmodule RepoXmlWeb.ErrorView do
  use RepoXmlWeb, :view
  import Ecto.Changeset, only: [traverse_errors: 2]

  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  def render("error.json", %{result: result}) do
    %{
      message: translate_errors(result)
    }
  end

  ## TODO: fazer um patter matching pra quando o retorno for {:error, %Ecto.Changeset{}}
  defp translate_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Regex.replace(~r"%{(\w+)}", msg, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end
end
