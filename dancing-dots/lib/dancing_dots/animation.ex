defmodule DancingDots.Animation do
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer

  @callback init(opts :: opts()) :: {:ok, opts()} | {:error, error()}
  @callback handle_frame(dot :: dot(), frame_number :: frame_number(), opts :: opts()) :: dot()

  defmacro __using__(_) do
    quote do
      @behaviour DancingDots.Animation
      def init(opts), do: {:ok, opts}
      defoverridable(init: 1)
    end
  end
end

defmodule DancingDots.Flicker do
  use DancingDots.Animation

  def handle_frame(dot, frame_number, _opts) do
    case rem(frame_number, 4) do
      0 -> Map.update!(dot, :opacity, fn x -> x / 2.0 end)
      _ -> dot
    end
  end
end

defmodule DancingDots.Zoom do
  use DancingDots.Animation

  def init([velocity: v] = opts) when is_number(v), do: {:ok, opts}

  def init(opts) do
    v = opts[:velocity]

    {:error,
     "The :velocity option is required, and its value must be a number. Got: #{inspect(v)}"}
  end

  def handle_frame(dot, frame_number, velocity: v) do
    Map.update!(dot, :radius, fn r -> r + (frame_number - 1) * v end)
  end
end
