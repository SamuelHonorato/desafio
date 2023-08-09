defmodule CalculateTest do
  use ExUnit.Case

  test "should return success" do
    cart = [
      %{"value" => 102, "amount" => 1, "name" => "1"}
    ]

    emails = ["1@email", "2@email", "3@email", "4@email"]

    assert {:ok, data} = Calculate.run(emails, cart)
    assert %{"1@email" => 26, "2@email" => 26, "3@email" => 25, "4@email" => 25} = data
  end

  test "should return error when cart is invalid" do
    cart = [
      %{"value" => -1, "amount" => 1, "name" => "1"}
    ]

    emails = ["1@email", "2@email", "3@email", "4@email"]

    assert {:error, _} = Calculate.run(emails, cart)
  end
end
