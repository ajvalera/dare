defmodule Dare.RegistrationController do
  use Dare.Web, :controller
  alias Dare.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end
end
