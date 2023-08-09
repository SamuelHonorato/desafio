defmodule Calculate do
  import Helpers.CalculateHelper

  alias Validates.{CartValidate, ListPeopleValidate}

  def run(emails_param, cart_param) do
    with {:ok, cart} <- CartValidate.run(cart_param),
         {:ok, people} <- ListPeopleValidate.run(emails_param) do
      result =
        cart
        |> sum_cart()
        |> split_value_by_person(Enum.count(people))
        |> format(emails_param)

      {:ok, result}
    end
  end
end
