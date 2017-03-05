:- module(list, []).

:- export(test/0).

%% Werner Hett's 99 Prolog Programs
:- export(last/2).
:- export(penultimate/2).
:- export(element/3).
:- export(size/2).
:- export(backward/2).
:- export(palindrome/1).
:- export(flat/2).
:- export(compress/2).
:- export(pack/2).
:- export(encode/2).

%% Ancillaries for Hett
:- export(consecutive/3).

%% Others
:- export(sum/2).

test() :-

  last(d, [a, b, c, d]),
  penultimate(c, [a, b, c, d]),
  element(c, [a,b,c,d,e], 3),
  size(3, [fu, bar, baz]),
  backward([baz, bar, fu], [fu, bar, baz]),
  palindrome([x,a,m,a,x]),
  sum([0,1,2,3,4,5], 15),
  flat([a, [b, [c, d], e]], [a,b,c,d,e]),
  compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e], [a,b,c,a,d,e]),
  pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e], [[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]),
  encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e], [{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]),
  consecutive([3,3,3, 2,2], [3,3,3], [2,2]).

last(X, [X]).

last(X, [_|Tl]) :-
  last(X, Tl).

penultimate(X, [X,_]).

penultimate(X, [_|Tl]) :-
  penultimate(X, Tl).

element(X, [X|_], 1).

element(X, [_|Tl], N) :-
  M is N - 1, element(X, Tl, M).

size(1, [_]).

size(X, [_|Tl]) :-
  size(Y, Tl), X is Y + 1.

backward(X, Y) :-
  backward(X, Y, []).

backward(X, [], Y) :-
  same(X, Y).

backward(X, [Hd|Tl], Y) :-
  backward(X, Tl, [Hd|Y]).

palindrome(X) :-
  backward(X, X).

flat(X, [X]) :-
  atom(X).

flat([X], Y) :-
  flat(X, Y).

flat([H|T], Y) :-
  flat(H, A), flat(T, B), append(A, B, Y).

compress(X, Y) :-
  compress(X, Y, []).

compress([X], Y, Z) :-
  backward(Y, [X|Z]).

compress([A|[B|T]], Y, Z) :-
  same(A, B), compress([B|T], Y, Z).

compress([A|[B|T]], Y, Z) :-
  different(A, B), compress([B|T], Y, [A|Z]).

pack([], []).

pack(A, [X|Z]) :-
  consecutive(A, X, Y), pack(Y, Z).

encode([], []).

encode(A, [{N,H}|Z]) :-
  consecutive(A, X, Y), length(X, N), head(X, H), encode(Y, Z).

consecutive([A], [A], []).

consecutive([A|[B|T]], [A|Y], Z) :-
  same(A, B), consecutive([B|T], Y, Z).

consecutive([A|[B|T]], [A], [B|T]) :-
  different(A, B).

sum([], 0).

sum([_], 1).

sum([H|T], N) :-
  sum(T, M), N is M + H.

%% Ancillary

same(X, X).

different(X, Y) :-
  X \= Y.

head([X|_], X).
