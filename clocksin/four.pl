:- module(four, []).

:- export(test/0).

test() :-
  true.

maximum(X, Y, X) :-

  X >= Y, !.

maximum(X, Y, Y) :-

  X < Y.
