defmodule App2.Repo.Migrations.CreateTeacher do
  use Ecto.Migration

  def change do
    create table(:teacher) do
      add :name, :string
      add :age, :integer

      timestamps
    end

  end
end
