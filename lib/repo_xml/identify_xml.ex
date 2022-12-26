defmodule RepoXml.IdentifyXml do
  import SweetXml


  ## TODO: tratar o erro pra quando nao conseguir dar o decode
  def call(base_64) do
    base_64
    |> Base.decode64!(ignore: :whitespace)
    |> xpath(~x"//infCte/@Id"s)
    |> identify_cte(base_64)
  end

  defp identify_cte(result, base_64) when result !== "" do
    key = result |> String.replace(~r/[^\d]/, "")

    RepoXml.create_cte(%{key: key, xml_b64: base_64})
  end

  defp identify_cte(_result, base_64) do
    base_64
    |> Base.decode64!(ignore: :whitespace)
    |> xpath(~x"//infNFe/@Id"s)
    |> identify_nfe(base_64)
  end

  defp identify_nfe(result, _base_64) when result !== "" do
    {:ok, message: "Caso da NFe!"}
  end

  defp identify_nfe(_result, _base_64), do: {:error, "Arquivo não corresponde a um CTe ou NFe!"}
end
