:- module(math, []).

:- export(test/0).

%% Adapted from Paul Brna's online tutorial
:- export(successor/2).
:- export(square/2).

test() :-

  successor(0, 1),
  square(2, 4).

successor(X, Y) :-
  number(X), Y is X + 1; number(Y), X is Y - 1.

square(X, Y) :-
  number(X), Y is X * X; number(Y), X is sqrt(Y).

sum([], 0).

sum([_], 1).

sum([H|T], N) :-
  sum(T, M), N is M + H.
