:- module(puzzle, []).

:- export(test/0).

:- export(eight/1).
:- export(queens/1).

test() :-

  \+ safe({1,1}, [{8,8}]),
  \+ safe({1,1}, [{8,1}]),
  \+ safe({1,1}, [{1,8}]),
  \+ safe({1,1}, [{1,1}]),

  \+ safe({1,1}, [{8,8},{8,1},{1,8},{1,1}]),

  horizontal({1,4}, {-1,4}),

  vertical({4,1}, {4,-1}),

  diagonal({1,1}, {8,8}),
  diagonal({1,8}, {8,1}).

eight([{1,_}, {2,_}, {3,_}, {4,_}, {5,_}, {6,_}, {7,_}, {8,_}]).

queens([]).

queens([{X,Y}|O]) :-
  queens(O), member(Y, [1,2,3,4,5,6,7,8]), safe({X,Y}, O).

%% Ancillary

safe(_, []).

safe(A, [B|O]) :-
  vacant(A, B), \+ dangerous(A, B), safe(A, O).

vacant(A, B) :-
  different(A, B).

dangerous(A, B) :-
  horizontal(A, B); vertical(A, B); diagonal(A, B).

vertical({Ax, _}, {Bx, _}) :-
  same(Ax, Bx).

horizontal({_,Ay}, {_,By}) :-
  same(Ay, By).

diagonal({Ax, Ay}, {Bx, By}) :-
  difference(Ax, Bx, X), difference(Ay, By, Y), absolute(X, Xa), absolute(Y, Ya), same(Xa, Ya).

different(X, Y) :-
  X \= Y.

same(X, Y) :-
  X = Y.

difference(A, B, D) :-
  D is A - B.

absolute(X, Y) :-
  Y is abs(X).
