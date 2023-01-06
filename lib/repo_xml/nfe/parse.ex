defmodule RepoXml.Nfe.Parse do
  @moduledoc false
  import SweetXml

  def call(%{xml_b64: xml_b64} = params) do
    xml_b64
    |> Base.decode64!(ignore: :whitespace)
    |> xmap(
      number: ~x"//ide/nNF/text()"s,
      emission_date: ~x"//ide/dhEmi/text()"s,
      quantity: ~x"//vol/qVol/text()"s,
      specie: ~x"//det/prod/xProd/text()"s,
      value: ~x"//total/ICMSTot/vNF/text()"s,
      weight: ~x"//transp/vol/pesoB/text()"s,
      issuer_cnpj: ~x"//emit/CNPJ/text()"s,
      issuer_name: ~x"//emit/xNome/text()"s,
      receiver_cnpj: ~x"//dest/CNPJ/text()"s,
      receiver_name: ~x"//dest/xNome/text()"s,
      transporter_cnpj: ~x"//transp/transporta/CNPJ/text()"s,
      transporter_name: ~x"//transp/transporta/xNome/text()"s,
      ncm: ~x"//det/prod/NCM/text()"s,
      series: ~x"//ide/serie/text()"s
    )
    |> Map.merge(params)
  end
end
