defmodule CtrApiTest do
  use ExUnit.Case

  alias CtrApi.Client

  test "get_users/0" do
    assert [] = Client.get_users()
  end

  test "get_user/1" do
    assert nil = Client.get_user(1)
  end
end
