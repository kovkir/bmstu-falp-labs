PREDICATES
	len(integer*, integer).
	len_rec(integer*, integer, integer).

	sum(integer*, integer).
	sum_rec(integer*, integer, integer).

	sum_odd_pos(integer*, integer).
	sum_odd_pos_rec(integer*, integer, integer).
	
CLAUSES
	% 1) Длина списка 
	len_rec([], Result, Current) :- 
		Result = Current, !.

	len_rec([_|T], Result, Current) :-
		Cur_res = Current + 1,
		len_rec(T, Result, Cur_res).
		
	len(List, Result) :- 
		len_rec(List, Result, 0).
	
	% 2) Сумма элементов списка
	sum_rec([], Result, Current) :- 
		Result = Current, !.

	sum_rec([H|T], Result, Current) :-
		Cur_res = Current + H,
		sum_rec(T, Result, Cur_res).
		
	sum(List, Result) :- 
		sum_rec(List, Result, 0).
	
	% 3) Сумма элементов списка на нечетных позициях
	sum_odd_pos_rec([], Result, Current) :- 
		Result = Current, !.

	sum_odd_pos_rec([_|[H|T]], Result, Current) :-
		Cur_res = Current + H,
		sum_odd_pos_rec(T, Result, Cur_res), !.

	sum_odd_pos_rec([_|[H|_]], Result, Current) :- 
		Result = Current + H.
		
	sum_odd_pos(List, Result) :- 
		sum_odd_pos_rec(List, Result, 0).

GOAL
	% len([1, 2, 3, 4], Result). % 4
	% sum([1, 2, 3, 4], Result). % 10
	sum_odd_pos([1, 2, 3, 4], Result). % 6
