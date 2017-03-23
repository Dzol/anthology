#!/usr/bin/swipl -s

:- initialization [suite], go(), success.

:- initialization failure.

success :-
  halt(0).

failure :-
  halt(1).
