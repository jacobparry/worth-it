defmodule Api.Resolvers.UserResolver do
  @moduledoc """
  empty
  """

  import Absinthe.Resolution.Helpers, only: [async: 1, batch: 3]

  def user_list(_, _, _) do
    {:ok,
     [
       %{username: "bob1", password: "strOngestEver!"},
       %{username: "bob2", password: "strOngestEver!"},
       %{username: "bob3", password: "strOngestEver!"}
     ]}
  end

  def get_user(_, _, _) do
    Process.sleep(50)
    {:ok, %{username: "bob1", password: "strOngestEver!"}}
  end

  def get_user_async(_args, %{source: _parent} = _resolution) do
    async(fn ->
      Process.sleep(50)
      {:ok, %{username: "bob1", password: "strOngestEver!"}}
    end)
  end

  def get_user_batch(parent, _args, _info) do
    batch({__MODULE__, :get_users_by_ids}, parent.user_id, fn users ->
      [user] =
        Enum.filter(users, fn user ->
          user.id == parent.user_id
        end)

      {:ok, user}
    end)
  end

  def get_users_by_ids(_, _) do
    Process.sleep(50)
    # Database query
    [
      %{username: "bob1", password: "strOngestEver!", id: 1},
      %{username: "bob2", password: "strOngestEver!", id: 2},
      %{username: "bob3", password: "strOngestEver!", id: 3}
    ]
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
       %{weight: "1lb", price: "$3.21", user_id: 1},
       %{weight: "2lb", price: "$6.21", user_id: 2},
       %{weight: "3lb", price: "$9.21", user_id: 3}
     ]}
  end
end
