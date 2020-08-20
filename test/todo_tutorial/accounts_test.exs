defmodule AccountsTest do
  use ExUnit.Case

  @valid_attrs %{user_name: "John"}
  @invalid_attrs %{user_name: nil}

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Map.merge(@valid_attrs)
      |> Accounts.create_user()

    user
  end

  describe "list_users/0" do
    test "returns the list of users", do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end
  end

  describe "create_user/1"
    test "creates a user with valid data" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.user_name == @valid_attrs[user_name]
    end

    test "returns error changeset with invalid data" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end
end