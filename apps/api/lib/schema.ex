defmodule Api.Schema do
  use Absinthe.Schema

  object :user do
    field(:username, :string)
    field(:password, :string)
  end

  query do
    field :users, list_of(:user) do
      resolve(&user_list/3)
    end

    # Nothing for now
  end

  defp user_list(_, _, _) do
    {:ok,
     [
       %{username: "bob1", password: "strOngestEver!"},
       %{username: "bob2", password: "strOngestEver!"},
       %{username: "bob3", password: "strOngestEver!"}
     ]}
  end
end
