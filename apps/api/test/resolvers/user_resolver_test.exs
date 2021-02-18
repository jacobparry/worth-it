defmodule Api.Resolvers.UserResolverTest do
  use Api.ApiCase

  describe "get_users/3" do
    test "Absinthe.run/3" do
      query = """
      query {
        users {
          username
        }
      }
      """

      response =
        Absinthe.run(query, Api.Schema, variables: %{})
        |> IO.inspect()

      assert {:ok,
              %{
                data: %{
                  "users" => [
                    %{"username" => "bob1"},
                    %{"username" => "bob2"},
                    %{"username" => "bob3"}
                  ]
                }
              }} = response
    end

    test "the juno way" do
      query = """
      query {
        users {
          username
        }
      }
      """

      conn = build_conn()
      conn = get(conn, "/graphql", query: query)

      response = json_response(conn, 200)

      # |> IO.inspect()

      assert %{
               "data" => %{
                 "users" => [
                   %{"username" => "bob1"},
                   %{"username" => "bob2"},
                   %{"username" => "bob3"}
                 ]
               }
             } = response
    end
  end
end
