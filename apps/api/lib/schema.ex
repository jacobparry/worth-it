defmodule Api.Schema do
  use Absinthe.Schema
  use ApolloTracing

  alias Api.Resolvers.UserResolver

  object :user do
    field(:username, :string)
    field(:password, :string)
  end

  query do
    field :users, list_of(:user) do
      resolve(&UserResolver.user_list/3)
    end

    # Nothing for now
  end
end
