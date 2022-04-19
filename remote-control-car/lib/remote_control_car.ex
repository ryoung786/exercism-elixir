defmodule RemoteControlCar do
  @enforce_keys :nickname
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{} = car) do
    "#{car.distance_driven_in_meters} meters"
  end

  def display_battery(%RemoteControlCar{} = car) do
    case car.battery_percentage do
      0 -> "Battery empty"
      percentage -> "Battery at #{percentage}%"
    end
  end

  def drive(%RemoteControlCar{} = car) when car.battery_percentage < 1, do: car

  def drive(%RemoteControlCar{} = car) do
    car
    |> Map.update!(:battery_percentage, &(&1 - 1))
    |> Map.update!(:distance_driven_in_meters, &(&1 + 20))
  end
end
