defmodule CtrApi.Client do 

  def get_users, do: mod().users()
  def get_user(id), do: mod().user(id)

  defp mod do
    Application.get_env(:ctr_api, CtrApi).mod
  end
end
