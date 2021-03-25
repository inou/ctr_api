defmodule CtrApiTest do
  use ExUnit.Case

  alias CtrApi.Client

  test "get_users/0" do
    assert [] = Client.get_users()
  end

  test "get_user/1" do
    assert nil = Client.get_user(1)
  end

  test "GET /users via clients with hammox", %{conn: _conn} do
    Hammox.expect(ClientMox, :users, fn ->
      {:ok, ["joe", "jim"]}
    end)
    {:ok, clients} = Client.get_users()
    assert length(clients) == 2
  end

  test "GET /users via clients with hammox 1", %{conn: _conn} do
    Hammox.expect(ClientMox, :users, fn ->
      {:ok, [%{name: "joe", balance: 3.4}, %{name: "jim", balance: "3.4"}]}
    end)
    {:ok, clients} = Client.get_users()
    assert length(clients) == 2
  end

  test "GET /users via clients with hammox 2", %{conn: _conn} do
    Hammox.expect(ClientMox, :users, fn ->
      {:ok, [%User{name: "joe", balance: 4.33}, %User{name: "jim", balance: 2.3}]}
    end)
    {:ok, clients} = Client.get_users()
    assert length(clients) == 2
  end
end
