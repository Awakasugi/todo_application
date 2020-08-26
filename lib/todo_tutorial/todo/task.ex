defmodule TodoTutorial.Todo.Task do
  use Ecto.Schema
  import Ecto.Changeset

  alias TodoTutorial.Accounts.User

  schema "tasks" do
    belongs_to :user, User
    field :finished_at, :naive_datetime
    field :is_finished, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :is_finished, :user_id])
    |> validate_required([:name, :is_finished])
    |> put_finished_at()
  end

  def put_finished_at(%Ecto.Changeset{changes: %{is_finished: true}} = changeset) do
    now = %{NaiveDateTime.utc_now() | microsecond: {0, 0}}
    put_change(changeset, :finished_at, now)
  end

  def put_finished_at(%Ecto.Changeset{changes: %{is_finished: false}} = changeset) do
    put_change(changeset, :finished_at, nil)
  end

  def put_finished_at(changeset), do: changeset

end
