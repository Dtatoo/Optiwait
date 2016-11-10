defmodule Optiwait.User do
  use Optiwait.Web, :model

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true
    field :hashed_password, :string
    field :is_admin, :boolean, default: false
    has_many :clinics, Optiwait.Clinic

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password, :is_admin])
    |> validate_required([:email, :password])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 5)
    |> hash_password
    |> unique_constraint(:email)
  end

  def hash_password(changeset) do
    pass = get_field changeset, :password
    case String.valid?(pass) do
      true ->
        put_change changeset, :hashed_password, Comeonin.Bcrypt.hashpwsalt pass
      false ->
        add_error changeset, :password, "Invalid password"
    end
  end

end
