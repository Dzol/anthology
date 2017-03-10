:- module(bob, []).

:- export(test/0).

test() :-

  remaining(5, 3, 2),
  \+ remaining(3, 5, -2),
  \+ valid_choice(5, 5),
  valid_choice(5, 3).

remaining(Previous, Number, Current) :-
  Current is Previous - Number, Current >= 0.

valid_choice(Previous, Current) :-
  Current > 0, Current < 10, Previous \= Current.

next_player(alice, bob).
next_player(bob, alice).

alice_wins(Goal) :-
  win(Goal, -1, alice).

win(Goal, Previous, Player) :-
  member(Choice, [1,2,3,4,5,6,7,8,9]),
  valid_choice(Previous, Choice),
  remaining(Goal, Choice, Rest),
  next_player(Player, NextPlayer),
  loose(Rest, Choice, NextPlayer), !.

loose(Goal, Previous, Player) :-
  \+ win(Goal, Previous, Player).

bob_wins(N) :-
\+ alice_wins(N).
