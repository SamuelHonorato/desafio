defmodule Person do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field(:email, :string)
  end

  def changeset(%Person{} = person, attrs \\ %{}) do
    person
    |> cast(attrs, [:email])
    |> validate_required([:email])
  end
end
