defmodule AccountsTest do
  use ExUnit.Case

  describe "Accounts" do
    @valid_attrs %{user_name: "John"}

    def user_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Todo.create_user()

      task
    end

    test "list_users/0 returns the list of users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end
  end
end