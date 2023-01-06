defmodule RepoXml.Nfe.Parse do
  @moduledoc false
  import SweetXml

  def call(%{xml_b64: xml_b64} = params) do
    xml_b64
    |> Base.decode64!(ignore: :whitespace)
    |> xmap(number: ~x"//ide/nNF/text()"s)
    |> Map.merge(params)
  end
end
