defmodule Dare.DareTest do
  use Dare.ModelCase

  alias Dare.Dare

  @valid_attrs %{description: "some content", goal: 42, name: "some content", raised: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Dare.changeset(%Dare{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Dare.changeset(%Dare{}, @invalid_attrs)
    refute changeset.valid?
  end
end
