-module(geometry).
-export([sum/1, max_square/1, squares/1, filter_less/2]).

sum(List) ->
  sum(List, 0).

sum([{ok, Shape} | Tail], Sum) ->
  case Shape of
    {circle, _Radius} ->
      {ok, Square} = circle:square(Shape),
      sum(Tail, Sum + Square);
    {rectangle, _Height, _Width} ->
      {ok, Square} = rectangle:square(Shape),
      sum(Tail, Sum + Square);
    Other ->
      {error, {bad_property, Other}}
  end;
sum([{error, _} | Tail], Sum) ->
  sum(Tail, Sum);
sum([], Sum) ->
  {ok, Sum}.

max_square(List) ->
  max_square(List, 0).

max_square([{ok, Shape} | Tail], Max) ->
  case Shape of
    {circle, _Radius} ->
      case circle:square(Shape) of
        {ok, Square} when Square >= Max ->
          max_square(Tail, Square);
        {ok, _Square} ->
          max_square(Tail, Max)
      end;
    {rectangle, _Height, _Width} ->
      case rectangle:square(Shape) of
        {ok, Square} when Square >= Max ->
          max_square(Tail, Square);
        {ok, _Square} ->
          max_square(Tail, Max)
      end;
     Other ->
      {error, {bad_property, Other}}
  end; 

max_square([{error, _} | Tail], Max) ->
  max_square(Tail, Max);
max_square([], Max) ->
  {ok, Max}.

squares(List) ->
  squares(List, []).

squares([{ok, Shape} | Tail], Squares) ->
  case Shape of
    {circle, _Radius} ->
      {ok, Square} = circle:square(Shape),
      squares(Tail, [Square | Squares]);
    {rectangle, _Height, _Width} ->
      {ok, Square} = rectangle:square(Shape),
      squares(Tail, [Square | Squares]);
    Other ->
      {error, {bad_property, Other}}
  end;
squares([{error, _Shape} | Tail], Squares) ->
  squares(Tail, Squares);
squares([], Squares) ->
  {ok, lists:reverse(Squares)}.

filter_less({ok, List}, Value) ->
  filter_less(List, [], Value).

filter_less([Square | Tail], Filtered, Value) ->
  case Square of
    Square when Square < Value ->
      filter_less(Tail, [Square | Filtered], Value);
    Square ->
      filter_less(Tail, Filtered, Value)
  end;

filter_less([], Filtered, _Value) ->
  {ok, lists:reverse(Filtered)}.

