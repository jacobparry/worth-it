defmodule Api.Schema do
  use Absinthe.Schema
  use ApolloTracing

  alias Api.Resolvers.UserResolver

  object :user do
    field(:username, :string)
    field(:password, :string)

    field(:favorites, list_of(:restaurant)) do
      resolve(&UserResolver.get_user_restaurants/3)
    end
  end

  object :restaurant do
    field(:name, :string)
    field(:average_price, :string)

    field(:foods, list_of(:food)) do
      resolve(&UserResolver.get_restaurant_foods/3)
    end
  end

  object :food do
    field(:weight, :string)
    field(:price, :string)
  end

  query do
    field :users, list_of(:user) do
      resolve(&UserResolver.user_list/3)
    end

    # Nothing for now
  end
end
