defmodule TodoTutorial.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias TodoTutorial.Todo.Task

  schema "users" do
    field :name, :string
    has_many :tasks, Task

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
