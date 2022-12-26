defmodule RepoXml.IdentifyXml do
  import SweetXml

  def call(base_64) do
    base_64
    |> Base.decode64()
    |> xpath(~x"//infCte/@Id")
    |> identify_cte(base_64)
  end

  defp identify_cte(result, base_64) when result !== nil do
    key = String.replace(result, ~r/[^\d]/, "")

    RepoXml.create_cte(%{key: key, base_64: base_64})
  end

  defp identify_cte(_result, base_64) do
    base_64
    |> Base.decode64()
    |> xpath(~x"//infNFe/@Id")
    |> identify_nfe(base_64)
  end

  defp identify_nfe(result, _base_64) when result !== nil do
    {:ok, "Caso da NFe!"}
  end

  defp identify_nfe(_result, _base_64), do: {:error, "Arquivo não corresponde a um CTe ou NFe!"}
end
