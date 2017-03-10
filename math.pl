:- module(math, []).

:- export(test/0).

%% Adapted from Paul Brna's online tutorial
:- export(successor/2).
:- export(square/2).
:- export(fibonacci/2).

test() :-

  successor(0, 1),
  square(2, 4),
  fibonacci(5, 5).

successor(X, Y) :-
  number(X), Y is X + 1; number(Y), X is Y - 1.

square(X, Y) :-
  number(X), Y is X * X; number(Y), X is sqrt(Y).

sum([], 0).

sum([_], 1).

sum([H|T], N) :-
  sum(T, M), N is M + H.

fibonacci(0, 0).

fibonacci(1, 1).

fibonacci(N, M) :-

    N > 0,

    I is N - 1,
    J is N - 2,

    fibonacci(I, X),
    fibonacci(J, Y),

    M is X + Y.
