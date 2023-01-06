defmodule RepoXml.Repo do
  use Ecto.Repo,
    otp_app: :repo_xml,
    adapter: Ecto.Adapters.Postgres
end
