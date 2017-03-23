:- module(suite, [go/0]).

go() :-

  [list],          list:test(),     writeln(list),     abolish(test/0),
  [puzzle],        puzzle:test(),   writeln(puzzle),   abolish(test/0),
  [hexagony],      hexagony:test(), writeln(hexagony), abolish(test/0),
  [bob],           bob:test(),      writeln(bob),      abolish(test/0),
  [clocksin/four], four:test(),     writeln(four),     true.
