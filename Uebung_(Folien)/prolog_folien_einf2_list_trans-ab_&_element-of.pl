trans_ab([], []).
trans_ab([a | Tail], [b | TransTail]) :- trans_ab(Tail, TransTail).

element_of(X, [X | _]).
element_of(X, [_ | T]) :- element_of(X, T).

concatenate(X, Y, [X | Y]).

concat_schoolVersion([], L2, L2).
concat_schoolVersion([Head_L1 | Tail_L1], L2, [Head_L1 | ResultTail]) :- concat_schoolVersion(Tail_L1, L2, ResultTail).