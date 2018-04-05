defmodule GiphifyApi.EnglishTest do
  use GiphifyApi.DataCase

  alias GiphifyApi.English

  describe "greetings" do
    alias GiphifyApi.English.Greeting

    @valid_attrs %{phrase: "some phrase"}
    @update_attrs %{phrase: "some updated phrase"}
    @invalid_attrs %{phrase: nil}

    def greeting_fixture(attrs \\ %{}) do
      {:ok, greeting} =
        attrs
        |> Enum.into(@valid_attrs)
        |> English.create_greeting()

      greeting
    end

    test "list_greetings/0 returns all greetings" do
      greeting = greeting_fixture()
      assert English.list_greetings() == [greeting]
    end

    test "get_greeting!/1 returns the greeting with given id" do
      greeting = greeting_fixture()
      assert English.get_greeting!(greeting.id) == greeting
    end

    test "create_greeting/1 with valid data creates a greeting" do
      assert {:ok, %Greeting{} = greeting} = English.create_greeting(@valid_attrs)
      assert greeting.phrase == "some phrase"
    end

    test "create_greeting/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = English.create_greeting(@invalid_attrs)
    end

    test "update_greeting/2 with valid data updates the greeting" do
      greeting = greeting_fixture()
      assert {:ok, greeting} = English.update_greeting(greeting, @update_attrs)
      assert %Greeting{} = greeting
      assert greeting.phrase == "some updated phrase"
    end

    test "update_greeting/2 with invalid data returns error changeset" do
      greeting = greeting_fixture()
      assert {:error, %Ecto.Changeset{}} = English.update_greeting(greeting, @invalid_attrs)
      assert greeting == English.get_greeting!(greeting.id)
    end

    test "delete_greeting/1 deletes the greeting" do
      greeting = greeting_fixture()
      assert {:ok, %Greeting{}} = English.delete_greeting(greeting)
      assert_raise Ecto.NoResultsError, fn -> English.get_greeting!(greeting.id) end
    end

    test "change_greeting/1 returns a greeting changeset" do
      greeting = greeting_fixture()
      assert %Ecto.Changeset{} = English.change_greeting(greeting)
    end
  end
end
