defmodule Dare.RegistrationController do
  use Dare.Web, :controller
  alias Dare.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "nex.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Dare.Registration.create(changeset, Dare.Repo) do
      {:ok, changeset} ->
        conn
        |> put_flash(:info, "Your account was created")
        |> redirect(to: "/")
      {:error, changeset} ->
        conn
        |> put_flash(:info, "Wrong email or password")
        |> render("new.html")
      end
    end
  end
