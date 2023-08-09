defmodule Validates.ListPeopleValidate do
  def run(emails) do
    with {:ok, people} <- validate_emails(emails),
         {:ok} <- validate_duplicate_emails(emails) do
      {:ok, people}
    end
  end

  defp validate_emails([]) do
    {:error, :emails_list_is_empty}
  end

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
    lenght_uniq_list =
      emails
      |> Enum.uniq()
      |> Enum.count()

    case Enum.count(emails) == lenght_uniq_list do
      true -> {:ok}
      _ -> {:error, :list_has_duplicate_email}
    end
  end
end
