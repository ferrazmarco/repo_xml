defmodule RepoXml do
  @moduledoc false
  alias RepoXml.{Cte, Nfe, IdentifyXml}

  defdelegate identify_xml(params), to: IdentifyXml, as: :call
  defdelegate query_builder(params), to: Cte.QueryBuilder, as: :call
  defdelegate create_cte(params), to: Cte.Create, as: :call
  defdelegate cancel_cte(key), to: Cte.Cancel, as: :call
  defdelegate fetch_cte(key), to: Cte.Show, as: :call
  defdelegate update_cte(params), to: Cte.Update, as: :call
  defdelegate create_nfe(params), to: Nfe.Create, as: :call
end
