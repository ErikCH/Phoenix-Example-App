ExUnit.start

Mix.Task.run "ecto.create", ~w(-r App2.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r App2.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(App2.Repo)

