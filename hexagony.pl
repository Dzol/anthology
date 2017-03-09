:- module(hexagony, []).

:- export(test/0).

:- export(two/1).
:- export(column/3).
:- export(diagonal/4).

test() :-

  two(World), column(World, 1, [a,d,g]),
  two(X), diagonal(X, 1, 2, [b,c, d,e,f]),
  true.

two(X) :-
    X = [{1,4,a},
         {0,3,b}, {2,3,c},
         {1,2,d},
         {0,1,e}, {2,1,f},
         {1,0,g}
        ].

%% Ancillary

column([], _, []).

column([{X, _, Value}|More], Hx, [ Value | Omega ]) :-
  same(X, Hx), column(More, Hx, Omega).

column([{X, _, _}|More], Hx, Omega) :-
  different(X, Hx), column(More, Hx, Omega).

diagonal([], _, _, []) :-
  true.

diagonal([{Gx, Gy, Value}|More], Hx, Hy, [ Value | Omega ]) :-
  diagonal({Gx, Gy}, {Hx, Hy}), diagonal(More, Hx, Hy, Omega).

diagonal([{Gx, Gy, _}|More], Hx, Hy, Omega) :-
  \+ diagonal({Gx, Gy}, {Hx, Hy}), diagonal(More, Hx, Hy, Omega).

diagonal({Ax, Ay}, {Bx, By}) :-

    difference(Ax, Bx, X),
    difference(Ay, By, Y),

    absolute(X, Xa),
    absolute(Y, Ya),

    same(Xa, Ya).

different(X, Y) :-
  X \= Y.

same(X, Y) :-
  X = Y.

difference(A, B, D) :-
  D is A - B.

absolute(X, Y) :-
  Y is abs(X).
