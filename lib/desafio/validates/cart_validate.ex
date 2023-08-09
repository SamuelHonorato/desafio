defmodule Validates.CartValidate do
  def run(cart) do
    with {:ok, cart} <- validate_cart(cart) do
      {:ok, cart}
    end
  end

  defp validate_cart([]), do: {:error, :cart_is_empty}

  defp validate_cart(cart) when is_list(cart) do
    try do
      cart = Enum.map(cart, &validate_item/1)

      {:ok, cart}
    rescue
      RuntimeError -> {:error, :invalid_item}
    end
  end

  defp validate_item(attrs) do
    changeset = Item.changeset(%Item{}, attrs)

    case changeset do
      %{valid?: true, changes: item} -> item
      _ -> raise "invalid item"
    end
  end
end
