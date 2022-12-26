defmodule RepoXml.IdentifyXml do
  import SweetXml
  @error_message "Arquivo não corresponde a um CTe ou NFe!"

  def call(base_64) do
    base_64
    |> decode(:cte)
  end

  defp decode(base_64, :cte) do
    case base_64 |> Base.decode64(ignore: :whitespace) do
      {:ok, result} ->
        result |> xpath(~x"//infCte/@Id"s) |> identify_cte(base_64)
      _ -> {:error,  @error_message}
    end
  end

  defp decode(base_64, :nfe) do
    case base_64 |> Base.decode64(ignore: :whitespace) do
      {:ok, result} ->
        result |> xpath(~x"//infNFe/@Id"s) |> identify_nfe(base_64)
      _ -> {:error,  @error_message}
    end
  end

  defp identify_cte(result, base_64) when result !== "" do
    key = result |> String.replace(~r/[^\d]/, "")

    RepoXml.create_cte(%{key: key, xml_b64: base_64})
  end

  defp identify_cte(_result, base_64) do
    base_64
    |> decode(:nfe)
  end

  defp identify_nfe(result, _base_64) when result !== "" do
    {:ok, "Caso da NFe!"}
  end

  defp identify_nfe(_result, _base_64), do: {:error,  @error_message}
end
