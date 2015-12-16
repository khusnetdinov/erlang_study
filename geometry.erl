-module(geometry).

-include("circle.hrl").
-include("rectangle.hrl").

-export([
         squares_sum/1,
         max_square/1,
         squares/1,
         filter_less/2
        ]).

squares_sum(List) ->
  squares_sum(List, 0).

squares_sum([Shape | Tail], Sum) ->
  case Shape of
    #circle{radius = _Radius} ->
      Square = circle:square(Shape),
      squares_sum(Tail, Sum + Square);
    #rectangle{height = _Height, width = _Width} ->
      Square = rectangle:square(Shape),
      squares_sum(Tail, Sum + Square)
  end;
squares_sum([], Sum) ->
  Sum.

max_square(List) ->
  max_square(List, 0).

max_square([Shape | Tail], Max) ->
  case Shape of
    #circle{ radius =  _Radius} ->
      case circle:square(Shape) of
        Square when Square >= Max -> max_square(Tail, Square);
        _ ->max_square(Tail, Max)
      end;
    #rectangle{height = _Height, width = _Width} ->
      case rectangle:square(Shape) of
        Square when Square >= Max -> max_square(Tail, Square);
        _ -> max_square(Tail, Max)
      end
  end; 
max_square([], Max) ->
  Max.

squares(List) ->
  squares(List, []).

squares([Shape | Tail], Squares) ->
  case Shape of
    #circle{ radius =  _Radius} ->
      Square = circle:square(Shape),
      squares(Tail, [Square | Squares]);
    #rectangle{height = _Height, width = _Width} ->
      Square = rectangle:square(Shape),
      squares(Tail, [Square | Squares])
  end;
squares([], Squares) ->
  lists:reverse(Squares).

filter_less(List, Value) ->
  filter_less(List, [], Value).

filter_less([Square | Tail], Filtered, Value) ->
  case Square of
    Square when Square < Value -> filter_less(Tail, [Square | Filtered], Value);
    _ -> filter_less(Tail, Filtered, Value)
  end;
filter_less([], Filtered, _Value) ->
  lists:reverse(Filtered).

