defmodule RepoXml.Nfe do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  @fields [
    :xml_b64,
    :number,
    :key,
    :emission_date,
    :issuer_cnpj,
    :issuer_name,
    :receiver_cnpj,
    :receiver_name,
    :transporter_cnpj,
    :transporter_name,
    :ncm,
    :specie,
    :quantity,
    :weight
  ]

  schema "nfes" do
    field :xml_b64, :string
    field :number, :string
    field :key, :string
    field :emission_date, :naive_datetime
    field :issuer_cnpj, :string
    field :issuer_name, :string
    field :receiver_cnpj, :string
    field :receiver_name, :string
    field :transporter_cnpj, :string
    field :transporter_name, :string
    field :ncm, :string
    field :specie, :string
    field :quantity, :string
    field :weight, :decimal

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required([:key, :xml_b64])
    |> validate_length(:key, is: 44)
    |> unique_constraint(:key, name: :nfes_key_index)
  end
end
