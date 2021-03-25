defmodule CtrApiTest do
  use ExUnit.Case

  alias CtrApi.Client
  alias CtrApi.User

  import Hammox

  setup :verify_on_exit!

  test "get_user/1" do
    CtrApi.ClientMox
    |> Hammox.expect(:user, fn _ -> {:ok, u2()} end)

    assert {:ok, u2()} == Client.get_user("1")
  end

  # Broken, fix as a exercise, good version above
  # test "get_user/1 2" do
  #   CtrApi.ClientMox
  #   |> Hammox.expect(:user, fn _ -> u2() end)

  #   assert u1() == Client.get_user()
  # end

  test "GET /users via clients with hammox" do
    CtrApi.ClientMox
    |> Hammox.expect(:users, fn -> {:ok, [u1()]} end)

    {:ok, users} = Client.get_users()
    assert length(users) == 1
  end

  defp u1, do: %User{name: "test", balance: 1.2}
  defp u2, do: %User{name: "single", balance: 3.34}
end
