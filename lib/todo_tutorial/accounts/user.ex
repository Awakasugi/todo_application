defmodule TodoTutorial.Accounts.User do
  use Ecto.Schema

  schema "users" do
    field :user_name, :string

    timestamps()
  end
end
