defmodule RepoXml do
  @moduledoc false
  alias RepoXml.IdentifyXml

  defdelegate identify_xml(params), to: IdentifyXml, as: :call
end
