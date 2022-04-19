# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  alias __MODULE__, as: Garden
  defstruct plots: %{}, next_id: 1

  def start(opts \\ []) do
    Agent.start(fn -> %Garden{} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn %{plots: plots} -> Map.values(plots) end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn garden ->
      plot = %Plot{plot_id: garden.next_id, registered_to: register_to}

      updated_garden =
        garden
        |> Map.update!(:plots, &Map.put_new(&1, plot.plot_id, plot))
        |> Map.update!(:next_id, &(&1 + 1))

      {plot, updated_garden}
    end)
  end

  def release(pid, plot_id) do
    Agent.get_and_update(pid, fn garden ->
      {:ok, Map.update!(garden, :plots, &Map.delete(&1, plot_id))}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn garden ->
      Map.get(garden.plots, plot_id, {:not_found, "plot is unregistered"})
    end)
  end
end
