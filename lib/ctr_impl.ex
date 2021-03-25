defmodule CtrApi.Impl do
  @behaviour CtrApi
  use Tesla

  alias CtrApi.User

  plug Tesla.Middleware.BaseUrl, Application.get_env(:ctr_api, CtrApi).url
  plug Tesla.Middleware.JSON

  def users do
    {:ok, %{body: body}} = get("/users/")
    {:ok, Enum.map(body["data"], &User.changeset/1)}
  end

  def user(id) do
    {:ok, %{body: body}} = get("/users/#{id}")
    body
  end
end
