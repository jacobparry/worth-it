defmodule Valore.Validations.RestaurantValidationTest do
  use ExUnit.Case

  alias Db.Schemas.Restaurant
  alias Valore.Validations.RestaurantValidation

  test "valid changeset" do
    valid_params = %{name: "R&R BBQ", average_price: 1478}
    changeset = RestaurantValidation.changeset(%Restaurant{}, valid_params)
    assert changeset.valid? == true
  end
end
