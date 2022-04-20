defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  def decode_secret_message_part({op, _meta, args} = ast, acc) when op in [:def, :defp] do
    {ast, [truncate_fn_name(args) | acc]}
  end

  def decode_secret_message_part(ast, acc), do: {ast, acc}

  defp truncate_fn_name([{:when, _, fn_args} | _] = _args), do: truncate_fn_name(fn_args)

  defp truncate_fn_name([{fn_name, _, fn_args} | _] = _args) do
    fn_name
    |> to_string()
    |> String.slice(0, length(fn_args || []))
  end

  def decode_secret_message(string) do
    string
    |> to_ast()
    |> Macro.prewalk([], &decode_secret_message_part/2)
    |> elem(1)
    |> Enum.reverse()
    |> Enum.join()
  end
end
