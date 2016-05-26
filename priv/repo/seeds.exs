# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     App2.Repo.insert!(%App2.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias App2.Repo
alias App2.Teacher

[
  %Teacher{
    name: "Erik",
    age: 5
  },
  %Teacher{
    name: "Bob",
    age: 7
  }
] |> Enum.each(&Repo.insert!(&1))

