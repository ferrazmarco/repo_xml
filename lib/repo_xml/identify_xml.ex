defmodule RepoXml.IdentifyXml do
  @moduledoc false

  import SweetXml
  @error_message %{message: "Arquivo não corresponde a um CTe ou NFe!", status: :unprocessable_entity}

  def call(base_64) do
    base_64
    |> decode(:cte)
  end

  defp decode(base_64, :cte) do
    case base_64 |> Base.decode64(ignore: :whitespace) do
      {:ok, result} ->
        result |>
          xmap(key: ~x"//infCte/@Id"s, cstat: ~x"//cStat/text()"s, canc_key: ~x"//eventoCTe/infEvento/chCTe/text()"s)
          |> identify_cte(base_64)

      _ ->
        {:error, @error_message}
    end
  end

  defp decode(base_64, :nfe) do
    case base_64 |> Base.decode64(ignore: :whitespace) do
      {:ok, result} ->
        result |> xpath(~x"//infNFe/@Id"s) |> identify_nfe(base_64)

      _ ->
        {:error,  @error_message }
    end
  end

  defp identify_cte(%{key: key, cstat: cstat}, base_64) when cstat === "100" and key !== "" do
    key = key |> String.replace(~r/[^\d]/, "")

    RepoXml.create_cte(%{key: key, xml_b64: base_64})
  end

  defp identify_cte(%{canc_key: key, cstat: cstat}, _base_64) when cstat === "135" and key !== "" do
    RepoXml.cancel_cte(%{canceled_key: key})
  end

  defp identify_cte(_result, base_64) do
    base_64
    |> decode(:nfe)
  end

  defp identify_nfe(result, base_64) when result !== "" do
    key = result |> String.replace(~r/[^\d]/, "")

    RepoXml.create_nfe(%{key: key, xml_b64: base_64})
  end

  defp identify_nfe(_result, _base_64), do: {:error,  @error_message }
end
