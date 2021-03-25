defmodule CtrApi do
  alias CtrApi.User
  @callback users() :: {:ok, [User.t()]} | {:error, String.t}
  @callback user(String.t) :: {:ok, User.t()} | {:error, String.t}
end
