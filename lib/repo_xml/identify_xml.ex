defmodule RepoXml.IdentifyXml do
  import SweetXml

  ## TODO: pensar melhor isso aqui, nao vai dar certo
  def call(base_64) do
    base_64
    |> xpath(~x"//infCte/@Id")
    |> identify_type(base_64)
  end

  defp identify_type(result, base_64) when result =~ "CTe" do
    key = String.replace(result, ~r/[^\d]/, "")

    RepoXml.create_cte(%{key: key, base_64: base_64})
  end

  defp identify_type(result, base_64) when result =~ "NFe" do
    key = String.replace(result, ~r/[^\d]/, "")

    RepoXml.create_nfe(%{key: key, base_64: base_64})
  end

  defp identify_type(_), do: {:error, "Arquivo não corresponde a um CTe ou NFe!"}
end
