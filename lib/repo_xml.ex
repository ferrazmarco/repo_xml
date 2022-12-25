defmodule RepoXml do
  alias RepoXml.{Cte, IdentifyXml}
  defdelegate create_cte(params), to: Cte.Create, as: :call
  defdelegate identify_xml(params), to: IdentifyXml, as: :call
end
