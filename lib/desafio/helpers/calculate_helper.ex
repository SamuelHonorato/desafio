defmodule Helpers.CalculateHelper do
  def sum_cart(items) do
    Enum.reduce(items, 0, fn item, acc -> 
      item[:value] * item[:amount] + acc
    end)
  end

  def format(values, emails) do
    emails
    |> Enum.zip(values)
    |> Map.new()
  end

  def split_value_by_person(total, count) do
    abs_value = Integer.floor_div(total, count)
    rest_value = total - abs_value * count

    1..count
    |> Enum.map(fn _ -> abs_value end)
    |> generate_list_value(rest_value)
  end

  defp generate_list_value(abs_value_list, 0), do: abs_value_list

  defp generate_list_value(abs_value_list, rest_value) do
    abs_rest_list = Enum.map(1..rest_value, fn _ -> 1 end)

    Enum.with_index(abs_value_list, fn element, index ->
      element + Enum.at(abs_rest_list, index, 0)
    end)
  end
end
