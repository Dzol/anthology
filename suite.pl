:- module(suite, [go/0]).

go() :-

  [list],          list:test(),     abolish(test/0),
  [puzzle],        puzzle:test(),   abolish(test/0),
  [hexagony],      hexagony:test(), abolish(test/0),
  [bob],           bob:test(),      abolish(test/0),
  [clocksin/four], four:test(),     true.
