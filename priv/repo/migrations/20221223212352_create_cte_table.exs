defmodule RepoXml.Repo.Migrations.CreateCteTable do
  use Ecto.Migration

  def change do
    create table(:ctes, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :xml_b64, :text
      add :key, :string
      add :number, :string
      add :emission_date, :naive_datetime
      add :modal, :string
      add :issuer_name, :string
      add :issuer_cnpj, :string
      add :sender_name, :string
      add :sender_cnpj, :string
      add :receiver_name, :string
      add :receiver_cnpj, :string
      add :dispatcher_name, :string
      add :dispatcher_cnpj, :string
      add :recipient_name, :string
      add :recipient_cnpj, :string
      add :borrower_name, :string
      add :borrower_cnpj, :string
      add :specie, :string
      add :merchandise_value, :string
      add :weight, :decimal, precision: 10, scale: 2
      add :quantity, :string
      add :service_value, :decimal, precision: 10, scale: 2
      add :type_service, :string
      add :type, :string
      add :authorized, :boolean

      timestamps()
    end

    create unique_index(:ctes, [:key])
  end
end
