defmodule Validates.ListPeopleValidate do
  def run(emails) do
    with {:ok, people} <- validate_emails(emails),
         {:ok} <- validate_duplicate_emails(emails) do
      {:ok, people}
    end
  end

  defp validate_emails([]), do: {:error, :emails_list_is_empty}

  defp validate_emails(emails) when is_list(emails) do
    try do
      people = Enum.map(emails, &validate_email/1)

      {:ok, people}
    rescue
      RuntimeError -> {:error, :invalid_email}
    end
  end

  defp validate_email(email) do
    changeset = Person.changeset(%Person{}, %{"email" => email})

    case changeset do
      %{valid?: true, changes: person} -> person
      _ -> raise "invalid email"
    end
  end

  defp validate_duplicate_emails(emails) do
    result =
      emails
      |> Enum.uniq()
      |> Enum.count()
      |> is_duplicated?(Enum.count(emails))
    
    case result do
      true -> {:ok}
      _ -> {:error, :list_has_duplicate_email}
    end
  end

  defp is_duplicated?(amount_1, amount_2) when amount_1 == amount_2, do: true
  defp is_duplicated?(_, _), do: false
end
