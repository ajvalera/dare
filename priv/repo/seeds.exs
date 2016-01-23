# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Dare.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Dare.Repo
alias Dare.User

user_params = %User{name: "Leeroy Jenkins", email: "leroy@jenkins.jpeg"}
Repo.insert!(user_params)
# Dare.Repo.insert!(%Dare.Dare{})
