-module(rectangle).
-export([new/1, new/2, square/1]).
-record(rectangle, {height, width}).

new(Side) when Side > 0 ->
  {ok, #rectangle{height = Side, width = Side}};
new(Value) ->
  {error, {bad_property, Value}}.

new(Height, Width) when Height > 0, Width > 0 ->
  {ok, #rectangle{height = Height, width = Width}};
new(Height, Width) ->
  {error, {bad_property, {height, Height}, {width, Width}}}.

square(#rectangle{height = Height, width = Width}) ->
  Height * Width.




