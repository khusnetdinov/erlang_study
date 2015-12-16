-module(main).
-export([
         main/0
        ]).

main() ->
  Circles = [circle:new(Radius) || Radius <- lists:seq(1, 5)],
  Rectangles = [rectangle:new(Side, Side + 1) || Side <- lists:seq(3,8)],
  Shapes = Circles ++ Rectangles,
  geometry:squares_sum(Shapes),
  geometry:max_square(Shapes),
  geometry:filter_less(geometry:squares(Shapes), 20).
