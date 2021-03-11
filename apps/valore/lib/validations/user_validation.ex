defmodule Valore.Validations.UserValidation do
  alias Db.Schemas.User

  import Ecto.Changeset

  @required_fields [:username, :password]
  @optional_fields []

  def changeset(%User{} = user, params \\ %{}) do
    user
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end
end
