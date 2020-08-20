defmodule AccountsTest do
  use ExUnit.Case
  use TodoTutorial.DataCase
  alias TodoTutorial.Accounts
  alias TodoTutorial.Accounts.User

  @valid_attrs %{name: "John"}
  @invalid_attrs %{name: nil}

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(@valid_attrs)
      |> Accounts.create_user()

    user
  end

  describe "list_users/1" do
    test "returns the list of users" do
      user = user_fixture()
      assert Accounts.list_users() == ["John"]
    end
  end

  describe "create_user/1" do
    test "creates a user with valid data" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.name == "John"
    end

    test "returns error changeset with invalid data" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end
  end
end