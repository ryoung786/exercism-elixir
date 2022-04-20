defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    @default_msg "stack underflow occurred"
    defexception message: @default_msg

    def exception(context) do
      if context != [],
        do: %StackUnderflowError{message: "#{@default_msg}, context: #{context}"},
        else: %StackUnderflowError{message: @default_msg}
    end
  end

  def divide(args) when length(args) < 2 do
    raise StackUnderflowError, "when dividing"
  end

  def divide([0, _]) do
    raise DivisionByZeroError
  end

  def divide([a, b]) do
    div(b, a)
  end
end
