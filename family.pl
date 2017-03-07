:- module(family, [brother/2, sister/2]).

brother(X, Y) :-

  sibling(X, Y),
  sex(X, male).

sister(X, Y) :-

  sibling(X, Y),
  sex(X, female).

sex(mike, male).
sex(joe, male).
sex(kasia, female).
sex(aga, female).

sibling(X, Y) :-

  sibling(Y, X).

sibling(mike, joe).
sibling(kasia, aga).
