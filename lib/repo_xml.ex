defmodule RepoXml do
  alias RepoXml.{Cte, IdentifyXml}
  defdelegate identify_xml(params), to: IdentifyXml, as: :call
  defdelegate create_cte(params), to: Cte.Create, as: :call
end
