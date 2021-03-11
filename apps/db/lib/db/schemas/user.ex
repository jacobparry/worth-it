defmodule Db.Schemas.User do
  use Ecto.Schema

  schema "users" do
    field(:username, :string)
    field(:password, :string)
    timestamps()
  end
end
