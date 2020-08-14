defmodule TodoTutorial.Repo.Migrations.ModifyContentsToPost do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string, null: false, default: ""
      timestamps()
    end

    alter table(:tasks) do
      add(:user_id, references(:users))
    end
  end

end
