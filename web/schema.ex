defmodule Optiwait.Schema do
  @moduledoc """
  Provides Schema endpoint (query/mutation) for GraphQL
  """

  use Absinthe.Schema

  @desc"""
  A User of Optiwait
  """
  object :user do
    field :id, :id
    field :email, :email,
    field :hashed_password, :string
    field :is_admin, :boolean
    field :clinics, list_of(:clinic)
  end

  object :clinic do
    field :id, :id
    field :name, :name
    field :hours, list_of(:hour)
    field :location, :location
    field :user, :user
  end

  object :hours do
    field :id, :id
    field :weekday, :integer
    field :start_hour, Ecto.Time
    field :end_hour, Ecto.Time
    field :closed, :boolean
    field :clinic, :clinic
  end

  object :wait_time do
    field :id, :id
    field :waiting_time, :integer
    field :clinic, :clinic
  end


end
