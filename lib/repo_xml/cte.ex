defmodule RepoXml.Cte do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "ctes" do
    field :xml_b64, :string
    field :key, :string
    field :number, :string
    field :emission_date, :naive_datetime
    field :modal, :string
    field :issuer_name, :string
    field :issuer_cnpj, :string
    field :sender_name, :string
    field :sender_cnpj, :string
    field :receiver_name, :string
    field :receiver_cnpj, :string
    field :dispatcher_name, :string
    field :dispatcher_cnpj, :string
    field :recipient_name, :string
    field :recipient_cnpj, :string
    field :borrower_name, :string
    field :borrower_cnpj, :string
    field :specie, :string
    field :merchandise_value, :string
    field :weight, :decimal
    field :quantity, :string
    field :service_value, :decimal
    field :type_service, :string
    field :type, :string
    field :authorized, :boolean, default: true

    timestamps()
  end

  @required_params [:key, :xml_b64]
  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  # TODO: verificar pq esse unique constraint nao esta retornando o erro antes do insert
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required([:key, :xml_b64])
    |> validate_length(:key, is: 44)
    |> unique_constraint(:key, name: :ctes_key_index)
  end
end
