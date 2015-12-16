-module(circle).
-include("circle.hrl").
-export([
         new/1,
         square/1
        ]).

new(Radius) when Radius > 0 ->
 #circle{radius = Radius}.

square(#circle{radius = Radius}) ->
  math:pi() * math:pow(Radius, 2).
