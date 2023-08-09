defmodule Item do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field(:name, :string)
    field(:value, :integer)
    field(:amount, :integer)
  end

  def changeset(item, attrs \\ %{}) do
    item
    |> cast(attrs, [:name, :value, :amount])
    |> validate_required([:name, :value, :amount])
    |> validate_number(:value, greater_than_or_equal_to: 0)
    |> validate_number(:amount, greater_than_or_equal_to: 0)
  end
end
