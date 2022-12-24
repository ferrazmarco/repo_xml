defmodule RepoXml do
  alias RepoXml.Cte
  defdelegate create_cte(params), to: Cte.Create, as: :call
end
