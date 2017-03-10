#!/usr/bin/swipl -s

:- initialization main.

main :-
  [suite], go(), success.

main :-
  failure.

success :-
  halt(0).

failure :-
  halt(1).
