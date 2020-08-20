defmodule TodoTutorial.Accounts do
  import Ecto.Query, warn: false
  import Ecto.Query, only: [from: 2]
  alias TodoTutorial.Repo
  alias TodoTutorial.Accounts.User

  @users_per_page 50

  def list_users(page \\ 0) do
    query = from u in "users",
      limit: @users_per_page,
      offset: ^page * @users_per_page,
      order_by: [desc: :id],
      select: u.name
    Repo.all(query)
  end

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
