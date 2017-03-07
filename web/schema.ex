defmodule Optiwait.Schema do


  @moduledoc """
  Provides Schema endpoint (query/mutation) for GraphQL
  """

  use Absinthe.Schema

  alias Optiwait.Repo
  alias Optiwait.User

  import_types Optiwait.Schema.Types

  @desc"""
  A User of Optiwait
  """

  def all(_parent, _args, _info) do
    {:ok, Optiwait.Repo.all(User)}
  end

 query do
  field :users, list_of(:user) do
      resolve &all/3
  end
 end

end
