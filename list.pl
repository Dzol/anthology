:- module(list, [test/0, last/2, penultimate/2, element/3]).

test() :-

    last(d, [a, b, c, d]),
    penultimate(c, [a, b, c, d]),
    element(c, [a,b,c,d,e], 3).

last(X, [X]).
last(X, [_|Tl]) :-

    last(X, Tl).

penultimate(X, [X,_]).
penultimate(X, [_|Tl]) :-

    penultimate(X, Tl).

element(X, [X|_], 1).
element(X, [_|Tl], N) :-

    M is N - 1,
    element(X, Tl, M).
