defmodule RepoXml.Repo.Migrations.CreateNfeTable do
  use Ecto.Migration

  def change do
    create table(:nfes, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :number, :string
      add :xml_b64, :text
      add :key, :string, size: 44
      add :emission_date, :naive_datetime
      add :issuer_cnpj, :string
      add :issuer_name, :string
      add :receiver_cnpj, :string
      add :receiver_name, :string
      add :transporter_cnpj, :string
      add :transporter_name, :string
      add :ncm, :string
      add :specie, :string
      add :quantity, :string
      add :weight, :decimal, precision: 10, scale: 2

      timestamps()
    end

    create index(:nfes, [:key], unique: true)
  end
end
