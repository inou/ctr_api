defmodule CtrApi.User do
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{name: String.t(), balance: float()}

  embedded_schema do
    field :name, :string
    field :balance, :float
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, [:name, :balance])
    |> apply_changes()
  end
end
