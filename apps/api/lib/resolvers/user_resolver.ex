defmodule Api.Resolvers.UserResolver do
  @moduledoc """
  empty
  """

  def user_list(_, _, _) do
    {:ok,
     [
       %{username: "bob1", password: "strOngestEver!"},
       %{username: "bob2", password: "strOngestEver!"},
       %{username: "bob3", password: "strOngestEver!"}
     ]}
  end

  def get_user_restaurants(_, _, _) do
    {:ok,
     [
       %{name: "BBQ Bobs - Pork", average_price: "$3.21"},
       %{name: "BBQ Bobs - Chicken", average_price: "$4.21"},
       %{name: "BBQ Bobs - Beef", average_price: "$5.21"}
     ]}
  end

  def get_restaurant_foods(_, _, _) do
    {:ok,
     [
       %{weight: "1lb", price: "$3.21"},
       %{weight: "2lb", price: "$6.21"},
       %{weight: "3lb", price: "$9.21"}
     ]}
  end
end
