defmodule Valore.Validations.UserValidationTest do
  use ExUnit.Case

  alias Db.Schemas.User
  alias Valore.Validations.UserValidation

  test "valid changeset" do
    valid_params = %{username: "coolguy1234", password: "strongpassword"}
    changeset = UserValidation.changeset(%User{}, valid_params)
    assert changeset.valid? == true
  end
end
