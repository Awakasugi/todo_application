defmodule AccountsTest do
  use ExUnit.Case
  use TodoTutorial.DataCase
  alias TodoTutorial.Accounts
  alias TodoTutorial.Accounts.User

  @valid_attrs %{name: "John"}
  @update_attrs %{name: "Chris"}
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
      assert Accounts.list_users() == [user]
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

  describe "change_user/1" do
    test "returns a user changeset" do
      assert %Ecto.Changeset{} = Accounts.change_user(%User{})
    end
  end

  describe "get_user!/1" do
    test "returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end
  end

  describe "update_user/2" do
    test "updates the user with valid data" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.name == "Chris"
    end

    test "returns error changeset with invalid data" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end
  end

  describe "delete_user/1" do
    test "deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end
  end
end