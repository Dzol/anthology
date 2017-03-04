:- module(list, []).

:- export(test/0).

%% Werner Hett's 99 Prolog Programs
:- export(last/2).
:- export(penultimate/2).
:- export(element/3).
:- export(size/2).
:- export(backward/2).
:- export(palindrome/1).

%% Others
:- export(sum/2).

test() :-

    last(d, [a, b, c, d]),
    penultimate(c, [a, b, c, d]),
    element(c, [a,b,c,d,e], 3),
    size(3, [fu, bar, baz]),
    backward([baz, bar, fu], [fu, bar, baz]),
    palindrome([x,a,m,a,x]),
    sum([0,1,2,3,4,5], 15).

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

backward(X, Y) :-

    backward(X, Y, []).

backward(X, [], Y) :-

    equal(X, Y).

backward(X, [Hd|Tl], Y) :-

    backward(X, Tl, [Hd|Y]).

palindrome(X) :-

    backward(X, X).

sum([], 0).
sum([_], 1).
sum([H|T], N) :-

    sum(T, M),
    N is M + H.

%% Ancillary

equal(X, X).
