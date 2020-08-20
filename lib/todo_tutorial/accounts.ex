defmodule TodoTutorial.Accounts do
  import Ecto.Query, warn: false
  alias TodoTutorial.Repo
  alias TodoTutorial.Accounts.User

  @users_per_page 50

  def list_users(page \\ 0) do
    User
    |> limit(@users_per_page)
    |> offset(^page * @users_per_page)
    |> order_by(desc: :id)
    |> Repo.all()
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
