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
end
