defmodule Username do
  def sanitize([]), do: []
  def sanitize([head | tail]) do
   case head do
    head when head == ?_ -> '_' ++ sanitize(tail)
    head when head == ?ä -> 'ae' ++ sanitize(tail)
    head when head == ?ü -> 'ue' ++ sanitize(tail)
    head when head == ?ö -> 'oe' ++ sanitize(tail)
    head when head == ?ß -> 'ss' ++ sanitize(tail)
    head when head >= ?a and head <= ?z -> [head] ++ sanitize(tail)
    _ -> sanitize(tail)
   end
  end
end
