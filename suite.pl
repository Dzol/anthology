:- module(suite, [go/0]).

go() :-

  [list],     list:test(),   abolish(test/0),
  [puzzle],   puzzle:test(), abolish(test/0),
  [hexagony], puzzle:test(), true.
