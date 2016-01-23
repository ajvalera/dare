defmodule Dare.DareControllerTest do
  use Dare.ConnCase

  alias Dare.Dare
  @valid_attrs %{description: "some content", goal: 42, name: "some content", raised: 42}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, dare_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing dares"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, dare_path(conn, :new)
    assert html_response(conn, 200) =~ "New dare"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, dare_path(conn, :create), dare: @valid_attrs
    assert redirected_to(conn) == dare_path(conn, :index)
    assert Repo.get_by(Dare, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, dare_path(conn, :create), dare: @invalid_attrs
    assert html_response(conn, 200) =~ "New dare"
  end

  test "shows chosen resource", %{conn: conn} do
    dare = Repo.insert! %Dare{}
    conn = get conn, dare_path(conn, :show, dare)
    assert html_response(conn, 200) =~ "Show dare"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, dare_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    dare = Repo.insert! %Dare{}
    conn = get conn, dare_path(conn, :edit, dare)
    assert html_response(conn, 200) =~ "Edit dare"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    dare = Repo.insert! %Dare{}
    conn = put conn, dare_path(conn, :update, dare), dare: @valid_attrs
    assert redirected_to(conn) == dare_path(conn, :show, dare)
    assert Repo.get_by(Dare, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    dare = Repo.insert! %Dare{}
    conn = put conn, dare_path(conn, :update, dare), dare: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit dare"
  end

  test "deletes chosen resource", %{conn: conn} do
    dare = Repo.insert! %Dare{}
    conn = delete conn, dare_path(conn, :delete, dare)
    assert redirected_to(conn) == dare_path(conn, :index)
    refute Repo.get(Dare, dare.id)
  end
end
