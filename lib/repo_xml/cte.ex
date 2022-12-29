defmodule RepoXml.Cte do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  @fields [
    :xml_b64,
    :key,
    :number,
    :emission_date,
    :modal,
    :issuer_name,
    :issuer_cnpj,
    :sender_name,
    :sender_cnpj,
    :receiver_name,
    :receiver_cnpj,
    :dispatcher_name,
    :dispatcher_cnpj,
    :recipient_name,
    :recipient_cnpj,
    :borrower_name,
    :borrower_cnpj,
    :merchandise_value,
    :weight,
    :quantity,
    :service_value,
    :type_service,
    :type,
    :authorized
  ]

  schema "ctes" do
    field :xml_b64, :string
    field :key, :string
    field :number, :string
    field :emission_date, :naive_datetime
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
    field :merchandise_value, :string
    field :weight, :decimal
    field :quantity, :string
    field :service_value, :decimal
    field :modal, Ecto.Enum, values: [road: 1, air: 2, sea: 3, rail: 4, ducts: 5, multi: 6]
    field :authorized, :boolean, default: true

    field :type_service, Ecto.Enum,
      values: [normal: 0, complemento: 1, anulacao: 2, substituto: 3, outros: 4]

    field :type, Ecto.Enum,
      values: [normal: 0, subcontratacao: 1, redespacho: 2, redespacho_int: 3, multi: 4]

    timestamps()
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(cte, params), do: create_changeset(cte, params)

  defp create_changeset(cte, params) do
    cte
    |> cast(params, @fields)
    |> validate_required([:key, :xml_b64])
    |> validate_length(:key, is: 44)
    |> unique_constraint(:key, name: :ctes_key_index)
  end
end
