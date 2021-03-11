defmodule Db.Schemas.Food do
  use Ecto.Schema

  schema "foods" do
    field(:name, :string)
    field(:weight, :string)
    field(:price, :integer)
    timestamps()
  end
end
