defmodule Validates.CartValidateTest do
  use ExUnit.Case

  alias Validates.CartValidate

  @valid_item %{name: "1", value: 5, amount: 1}

  describe "run/1" do
    test "should return ok" do
      cart = [@valid_item]

      assert {:ok, _} = CartValidate.run(cart)
    end

    test "should return ok when value is zero" do
      cart = [%{@valid_item | value: 0}]

      assert {:ok, _} = CartValidate.run(cart)
    end

    test "should return cart_is_empty when cart is empty" do
      cart = []

      assert {:error, :cart_is_empty} = CartValidate.run(cart)
    end

    test "should return invalid_item when fields are empty" do
      cart = [
        %{name: nil, value: nil, amount: nil}
      ]

      assert {:error, :invalid_item} = CartValidate.run(cart)
    end

    test "should return invalid_item when value is negative" do
      cart = [%{@valid_item | value: -1}]

      assert {:error, :invalid_item} = CartValidate.run(cart)
    end

    test "should return invalid_item when amount is negative" do
      cart = [%{@valid_item | amount: -1}]

      assert {:error, :invalid_item} = CartValidate.run(cart)
    end
  end
end
