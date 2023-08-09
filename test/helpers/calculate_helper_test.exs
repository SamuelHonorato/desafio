defmodule Helpers.CalculateTest do
  use ExUnit.Case

  alias Helpers.CalculateHelper

  describe "sum_cart/1" do
    test "should return the sum of items" do
      items = [
        %{value: 5, amount: 1},
        %{value: 2, amount: 5}
      ]

      assert 15 = CalculateHelper.sum_cart(items)
    end
  end

  describe "format/2" do
    test "should return response map" do
      values = [1, 2, 3]
      emails = ["1@email.com", "2@email.com", "3@email.com"]

      assert %{"1@email.com" => 1, "2@email.com" => 2, "3@email.com" => 3} =
               CalculateHelper.format(values, emails)
    end

    test "should return response map when list has different sizes" do
      values = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
      emails = ["1@email.com", "2@email.com", "3@email.com"]

      assert %{"1@email.com" => 1, "2@email.com" => 2, "3@email.com" => 3} =
               CalculateHelper.format(values, emails)
    end
  end

  describe "split_value_by_person/2" do
    test "should return result when value is 102 and amount is 4" do
      value = 102
      amount = 4

      assert [26, 26, 25, 25] = CalculateHelper.split_value_by_person(value, amount)
    end

    test "should return result when value is 100 and amount is 3" do
      value = 100
      amount = 3

      assert [34, 33, 33] = CalculateHelper.split_value_by_person(value, amount)
    end

    test "should return result when value is 1 and amount is 3" do
      value = 1
      amount = 3

      assert [1, 0, 0] = CalculateHelper.split_value_by_person(value, amount)
    end

    test "should return result when value is 10 and amount is 2" do
      value = 10
      amount = 2

      assert [5, 5] = CalculateHelper.split_value_by_person(value, amount)
    end
  end
end
