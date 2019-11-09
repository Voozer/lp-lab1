% Первая часть задания - предикаты работы со списками

my_length([],0).
my_length([_|T], N) :-
  my_length(T, N1),
  N is N1 + 1.

my_member(X,[X|_]).
my_member(X,[_|T]) :-
  my_member(X,T).

my_append([],X,X).
my_append([X|Y],Z,[X|T]) :-
  my_append(Y,Z,T).

my_remove(X,[X|T],T).
my_remove(X,[H|T],[H|Y]) :-
  my_remove(X,T,Y).

my_permute([],[]).
my_permute(X,[H|T1]) :-
  my_remove(H,X,T),
  my_permute(T,T1).

my_sublist(S,R) :-
  my_append(X,_,S),
  my_append(_,R,X).


nth(0,[H|T],H) :- !.
nth(N,[H|T],X) :-
    N1 is N - 1,
    nth(N1,T,X).

nth1(N,[H|T],X) :-
    length(L1, N),
    append(L1, [H1|T1], [H|T]),
    X is H1.


gp_check([H|T]) :-
    not(length(T,0)),
    not(H = 0),
    ratio([H|T],R),
    not(R = 0),
    ratio_check(R,[H|T]),
    !.

ratio([H|T],R) :-
    nth(1,[H|T],X),
    R is X / H.

ratio_check(R,[LastElem]) :- !.
ratio_check(R,[H|T]) :-
    nth(1,[H|T],X),
    R1 is X / H,
    R1 = R,
    ratio_check(R,T),
    !.
