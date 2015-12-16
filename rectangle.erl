-module(rectangle).
-include("rectangle.hrl").
-export([
         new/1,
         new/2,
         square/1
        ]).

new(Side) when Side > 0 ->
  #rectangle{height = Side, width = Side}.

new(Height, Width) when Height > 0, Width > 0 ->
  #rectangle{height = Height, width = Width}.

square(#rectangle{height = Height, width = Width}) ->
  Height * Width.

