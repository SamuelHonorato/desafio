defmodule Validates.ListPeopleValidateTest do
  use ExUnit.Case

  alias Validates.ListPeopleValidate

  @valid_person "1@email"

  describe "run/1" do
    test "should return ok" do
      people = [@valid_person]

      assert {:ok, _} = ListPeopleValidate.run(people)
    end

    test "should return error when list is empty" do
      people = []

      assert {:error, :emails_list_is_empty} = ListPeopleValidate.run(people)
    end

    test "should return error when there are duplicated emails" do
      people = [@valid_person] ++ [@valid_person]

      assert {:error, :list_has_duplicate_email} = ListPeopleValidate.run(people)
    end

    test "should return error when email is invalid" do
      people = [""]

      assert {:error, :invalid_email} = ListPeopleValidate.run(people)
    end
  end
end
