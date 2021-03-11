defmodule Valore.Validations.FoodValidation do
  alias Db.Schemas.Food

  import Ecto.Changeset

  @required_fields [:name, :weight, :price]
  @optional_fields []

  def changeset(%Food{} = struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
