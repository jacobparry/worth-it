defmodule Valore.Validations.FoodValidationTest do
  use ExUnit.Case

  alias Db.Schemas.Food
  alias Valore.Validations.FoodValidation

  test "valid changeset" do
    valid_params = %{name: "Pulled Pork", price: 1227, weight: "6oz"}
    changeset = FoodValidation.changeset(%Food{}, valid_params)
    assert changeset.valid? == true
  end
end
