defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  #   Mercury: orbital period 0.2408467 Earth years
  # Venus: orbital period 0.61519726 Earth years
  # Earth: orbital period 1.0 Earth years, 365.25 Earth days, or 31557600 seconds
  # Mars: orbital period 1.8808158 Earth years
  # Jupiter: orbital period 11.862615 Earth years
  # Saturn: orbital period 29.447498 Earth years
  # Uranus: orbital period 84.016846 Earth years
  # Neptune: orbital period 164.79132 Earth years

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(:mercury, seconds), do: calc(seconds, 0.2408467)
  def age_on(:venus, seconds), do: calc(seconds, 0.61519726)
  def age_on(:earth, seconds), do: calc(seconds, 1.0)
  def age_on(:mars, seconds), do: calc(seconds, 1.8808158)
  def age_on(:jupiter, seconds), do: calc(seconds, 11.862615)
  def age_on(:saturn, seconds), do: calc(seconds, 29.447498)
  def age_on(:uranus, seconds), do: calc(seconds, 84.016846)
  def age_on(:neptune, seconds), do: calc(seconds, 164.79132)
  def age_on(_, _), do: {:error, "not a planet"}

  defp calc(seconds, ratio), do: {:ok, seconds / (31_557_600 * ratio)}
end
