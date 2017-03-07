defmodule Optiwait.Schema.Types do
  use Absinthe.Schema.Notation

  @moduleDoc """
  Schema type definition
  """
  object :user do
    field :id, :id
    field :email, :string
    field :hashed_password, :string
    field :is_admin, :boolean
    field :clinics, list_of(:clinic)
  end

  object :clinic do
    field :id, :id
    field :name, :string
    field :hours, list_of(:hour)
    field :location, :string
    field :user, :user
  end

  object :hour do
    field :id, :id
    field :weekday, :integer
    field :start_hour, :string
    field :end_hour, :string
    field :closed, :boolean
    field :clinic, :clinic
  end

  object :wait_time do
    field :id, :id
    field :waiting_time, :integer
    field :clinic, :clinic
  end
end
