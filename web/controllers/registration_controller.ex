defmodule Dare.RegistrationController do
  use Dare.Web, :controller
  alias Dare.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Dare.Registration.create(changeset, Dare.Repo) do
      {:ok, changeset} ->
        # sign in the
        conn
        |> put_flash(:info, "Your account was created")
        |> redirect(to: "/")
      {:error, changeset} ->
        # show error message
        conn
        |> put_flash(:info, "Unable to create account")
        |> render("new.html", changeset: changeset)
    end
  end

end
