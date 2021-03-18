defmodule ListFilter do
  def call(list) do
    list
    |> Enum.map(fn x -> _string_to_numeric(x) end)
    |> Enum.filter(fn x -> Integer.mod(x, 2) == 1 end)
    |> Enum.count()
  end

  defp _string_to_numeric(val) when is_binary(val),
    do: _string_to_numeric(Integer.parse(val), val)

  defp _string_to_numeric(:error, _val), do: 0
  defp _string_to_numeric({num, ""}, _val), do: num
  defp _string_to_numeric({num, ".0"}, _val), do: num
  defp _string_to_numeric({_num, _str}, val), do: elem(Float.parse(val), 0)
end
