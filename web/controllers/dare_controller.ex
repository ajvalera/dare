defmodule Dare.DareController do
  use Dare.Web, :controller

  alias Dare.Dare

  plug :scrub_params, "dare" when action in [:create, :update]

  def index(conn, _params) do
    dares = Repo.all(Dare)
    render(conn, "index.html", dares: dares)
  end

  def new(conn, _params) do
    changeset = Dare.changeset(%Dare{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"dare" => dare_params}) do
    changeset = Dare.changeset(%Dare{}, dare_params)

    case Repo.insert(changeset) do
      {:ok, _dare} ->
        conn
        |> put_flash(:info, "Dare created successfully.")
        |> redirect(to: dare_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    dare = Repo.get!(Dare, id)
    render(conn, "show.html", dare: dare)
  end

  def edit(conn, %{"id" => id}) do
    dare = Repo.get!(Dare, id)
    changeset = Dare.changeset(dare)
    render(conn, "edit.html", dare: dare, changeset: changeset)
  end

  def update(conn, %{"id" => id, "dare" => dare_params}) do
    dare = Repo.get!(Dare, id)
    changeset = Dare.changeset(dare, dare_params)

    case Repo.update(changeset) do
      {:ok, dare} ->
        conn
        |> put_flash(:info, "Dare updated successfully.")
        |> redirect(to: dare_path(conn, :show, dare))
      {:error, changeset} ->
        render(conn, "edit.html", dare: dare, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    dare = Repo.get!(Dare, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(dare)

    conn
    |> put_flash(:info, "Dare deleted successfully.")
    |> redirect(to: dare_path(conn, :index))
  end
end
