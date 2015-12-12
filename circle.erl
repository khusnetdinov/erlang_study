-module(circle).
-export([new/1,square/1]).
-record(circle, {radius}).

new(Radius) when Radius > 0 ->
  {ok, #circle{radius = Radius}};
new(Value) ->
  {error, {bad_property, Value}}.

square(#circle{radius = Radius}) ->
  math:pi() * math:pow(Radius, 2).
