-module(geometry).
-export([sum/1]).

sum(List) ->
  sum(List, 0).

sum([{ok, Shape} | Tail], Sum) ->
  case Shape of
    {circle, _} ->
      sum(Tail, Sum + circle:square(Shape));
    {rectangle, _, _} ->
      sum(Tail, Sum + rectangle:square(Shape))
  end;
sum([], Sum) ->
  Sum.
