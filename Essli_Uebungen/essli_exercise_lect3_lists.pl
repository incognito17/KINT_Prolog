scalarMult(N, [X], [ResEl]) :- ResEl is N * X.
scalarMult(N, [Head | Tail], [ResHead | RestResult]) :- ResHead is N * Head, scalarMult(N, Tail, RestResult).

dot([],[],0).
dot([X], [Y], Result) :- Result is X * Y.
dot([Head_V1  | Tail_V1], [Head_V2 | Tail_V2], OtherRes) :- dot(Tail_V1, Tail_V2, TailRes), OtherRes is (Head_V1 * Head_V2) + TailRes.

max([], 0).
max([X], X).
max([H | T], Result) :- max(T, ResTail), H =< ResTail, Result = ResTail.
max([H | T], Result) :- max(T, ResTail), H > ResTail, Result = H.


prefix([],[]).
prefix([X], [X]).
prefix(X, [H2 | _]) :- X = H2.
prefix([H1 | T1], [H2 | T2]) :- H1 = H2, T1 = T2.
prefix(L1, L2) :- append(L1, Tail_L1, L2), append(L1, Tail_L1, L2).

suffix(L1, L2) :- append(_, L1, L2).

%% To get a sublist of a list L, first take a suffix S of L. This cuts
%% off something from the front end of the list. Then take a prefix of
%% S. This cuts off something from the end of the list. In other
%% words, a sublist of a list is a prefix of a suffix of that list.
sublist(SubL,L) :- suffix(S,L),prefix(SubL,S).



%% Predicate that checks if a list contains only 'a' letters.
only_a_letters([a]).
only_a_letters([H | T]) :- H = a, only_a_letters(T).


list_length([], 0).
list_length([_ | T], Length) :- list_length(T, TailLength), Length is 1 + TailLength.

replace_letters([],[]).
replace_letters([a | T], [b | TailOut]) :- replace_letters(T, TailOut).
replace_letters([b | T], [c | TailOut]) :- replace_letters(T, TailOut).
replace_letters([c | T], [a | TailOut]) :- replace_letters(T, TailOut).
replace_letters([X | T], [X | TailOut]) :- X \= a, X \= b, X \= c, replace_letters(T, TailOut).



%% Version from site:
%% If the input list is empty, the output list has 
%% to be empty as well.
replace_a_b_c([],[]).

%% If the input list is not empty, there are four cases.
%% First case: the first element is an a. The first element 
%% of the output list has to be a b. OutTail should be what
%% you get what properly replacing all a's, b's, and c's in InTail.
replace_a_b_c([a|InTail],[b|OutTail]) :-
              replace_a_b_c(InTail,OutTail).

%% Second case: the first element is a b.
replace_a_b_c([b|InTail],[c|OutTail]) :-
              replace_a_b_c(InTail,OutTail).

%% Third case: the first element is a c.
replace_a_b_c([c|InTail],[a|OutTail]) :-
              replace_a_b_c(InTail,OutTail).

%% Fourth case: the first element is something else.
replace_a_b_c([X|InTail],[X|OutTail]) :-
              X \= a, X \= b, X \= c,
              replace_a_b_c(InTail,OutTail).
			  
			  

add_one([],[]).
add_one([X], [OutEl]) :- OutEl is X + 1.
add_one([H | T], [H_OutEl | T_Out]) :- H_OutEl is H + 1, add_one(T, T_Out).


%% More eficient way with "Cut" (own version).
contains_zero([0]) :- !.
contains_zero([0 | _]) :- !.
contains_zero([_ | T]) :- contains_zero(T), !.

%% The version from site: 'http://cs.union.edu/~striegnk/courses/esslli04prolog/practical.day3.php?s=day3.node2.sol2'
%% The head of the list is 0. So, the list obviously contains 0. 
contains_0([0|_]).

%% The head of the list is not 0. Check whether the tail of the list,
%% contains 0.
contains_0([Head|Tail]) :- Head \= 0,
                           contains_0(Tail).