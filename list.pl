:- module(list, [test/0, first/2, last/2]).

test() :-

    last(d, [a, b, c, d]).

last(X, [X]).
last(X, [Hd|Tl]) :-

    last(X, Tl).
