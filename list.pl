:- module(list, [test/0, last/2, penultimate/2, element/3, size/2]).

test() :-

    last(d, [a, b, c, d]),
    penultimate(c, [a, b, c, d]),
    element(c, [a,b,c,d,e], 3),
    size(3, [fu, bar, baz]).

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

size(1, [_]).
size(X, [_|Tl]) :-

    size(Y, Tl),
    X is Y + 1.
