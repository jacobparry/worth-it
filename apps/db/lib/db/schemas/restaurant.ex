defmodule Db.Schemas.Restaurant do
  use Ecto.Schema

  schema "restaurants" do
    field(:name, :string)
    field(:average_price, :integer)
    timestamps()
  end
end
