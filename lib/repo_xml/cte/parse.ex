defmodule RepoXml.Cte.Parse do
  @moduledoc false
  import SweetXml

  def call(%{xml_b64: xml_b64} = params) do
    xml_b64
    |> Base.decode64!(ignore: :whitespace)
    |> xmap(
      number: ~x"//nCT/text()"s,
      emission_date: ~x"//dhEmi/text()"s,
      modal: ~x"//modal/text()"i,
      issuer_name: ~x"//emit/xNome/text()"s,
      issuer_cnpj: ~x"//emit/CNPJ/text()"s,
      sender_name: ~x"//rem/xNome/text()"s,
      sender_cnpj: ~x"//rem/CNPJ/text()"s,
      receiver_name: ~x"//dest/xNome/text()"s,
      receiver_cnpj: ~x"//dest/CNPJ/text()"s,
      dispatcher_name: ~x"//exped/xNome/text()"s,
      dispatcher_cnpj: ~x"//exped/CNPJ/text()"s,
      recipient_name: ~x"//receb/xNome/text()"s,
      recipient_cnpj: ~x"//receb/CNPJ/text()"s,
      merchandise_value: ~x"//vCarga/text()"s,
      service_value: ~x"//vTPrest/text()"s,
      type_service: ~x"//tpServ/text()"i,
      type: ~x"//tpServ/text()"i,
      weight:
        ~x"//infQ/qCarga/text()"sl
        |> transform_by(fn array ->
          case length(array) do
            0 -> 0
            _ -> hd(array)
          end
        end),
      quantity:
        ~x"//infQ/qCarga/text()"sl
        |> transform_by(fn array ->
          case length(array) do
            0 -> 0
            _ -> Enum.at(array, 4, 0)
          end
        end),
      ibge_init: ~x"//ide/cMunEnv/text()"s,
      ibge_end: ~x"//ide/cMunFim/text()"s,
      borrower_type: ~x"//ide/toma3/toma/text()"s,
      toma4_cnpj: ~x"//ide/toma4/CNPJ/text()"s,
      toma4_name: ~x"//ide/toma4/xNome/text()"s,
      icms: ~x"//imp/ICMS/ICMS00/vICMS/text()"s,
      frete: ~x"//vPrest/vTPrest/text()"s,
      components: [
        ~x"//vPrest/Comp"l,
        name: ~x"./xNome/text()"s,
        value: ~x"./vComp/text()"s
      ]
    )
    |> set_borrower()
    |> set_components()
    |> Map.merge(params)
  end

  defp set_borrower(%{borrower_type: type} = map) do
    case type do
      "0" ->
        map
        |> Map.put(:borrower_name, Map.fetch!(map, :sender_name))
        |> Map.put(:borrower_cnpj, Map.fetch!(map, :sender_cnpj))

      "1" ->
        map
        |> Map.put(:borrower_name, Map.fetch!(map, :disptacher_name))
        |> Map.put(:borrower_cnpj, Map.fetch!(map, :dispatcher_cnpj))

      "2" ->
        map
        |> Map.put(:borrower_name, Map.fetch!(map, :recipient_name))
        |> Map.put(:borrower_cnpj, Map.fetch!(map, :recipient_cnpj))

      "3" ->
        map
        |> Map.put(:borrower_name, Map.fetch!(map, :receiver_name))
        |> Map.put(:borrower_cnpj, Map.fetch!(map, :receiver_cnpj))

      _ ->
        map
        |> Map.put(:borrower_name, Map.fetch!(map, :toma4_name))
        |> Map.put(:borrower_cnpj, Map.fetch!(map, :toma4_cnpj))
    end
  end

  defp set_components(%{icms: icms, frete: frete} = map) do
    map
    |> Map.update(:components, [], fn array ->
      array ++ [%{name: "VALOR TOTAL", value: frete}, %{name: "ICMS", value: icms}]
    end)
  end
end
