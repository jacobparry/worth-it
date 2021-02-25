defmodule Api.Resolvers.UserResolverTest do
  use ExUnit.Case

  require Phoenix.ConnTest
  @endpoint UiWeb.Endpoint
  doctest Api

  test "greets the world" do
    assert Api.hello() == :world
  end

  describe "user_list/3" do
    test "Absinthe.run/3" do
      """
      query {
        users {
          username
        }
      }
      """
      |> Absinthe.run(Api.Schema)
      |> IO.inspect()

      assert false
    end

    test "using conn" do
      query = """
      query {
        users {
          username
        }
      }
      """

      conn = Phoenix.ConnTest.build_conn()
      conn = Phoenix.ConnTest.get(conn, "/graphql", query: query)

      response =
        Phoenix.ConnTest.json_response(conn, 200)
        |> IO.inspect()

      assert false
    end
  end
end
