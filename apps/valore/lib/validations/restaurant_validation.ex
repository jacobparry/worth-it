defmodule Valore.Validations.RestaurantValidation do
  alias Db.Schemas.Restaurant

  import Ecto.Changeset

  @required_fields [:name, :average_price]
  @optional_fields []

  def changeset(%Restaurant{} = struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
