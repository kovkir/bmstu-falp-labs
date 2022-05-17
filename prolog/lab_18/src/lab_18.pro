PREDICATES
	func1(integer*, integer, integer*).
	func2(integer*, integer*).
	func3(integer*, integer, integer*).
	func4(integer*, integer*).
	
CLAUSES
	% 1) Сформировать список из элементов, больших заданного значения
	func1([H|T], Numb, [H|T_res]) :-
		H > Numb, !,
		func1(T, Numb, T_res).

	func1([_|T], Numb, Result) :- 
		func1(T, Numb, Result), !.

	func1([], _, []).
	
	% 2) Сформировать список из элементов, стоящих на нечетных позициях
	func2([_|[H|T]], [H|T_res]) :-
		func2(T, T_res), !.

	func2([_], []) :- !.

	func2([], []).
	
	% 3) Удалить заданный элемент из списка
	func3([H|T], Numb, T_res) :-
		H = Numb, !,
		func3(T, Numb, T_res).

	func3([H|T], Numb, [H|T_res]) :-
		func3(T, Numb, T_res), !.

	func3([], _, []).
	
	% 4) Преобразовать список в множество
	func4([H|T], [H|Result]) :-
		func3(T, H, Res_tmp),
		func4(Res_tmp, Result), !.

	func4([], []).
	
GOAL
	% func1([1, 2, 3], 1, Result).    % [2, 3]
	% func2([1, 2, 3, 4], Result).    % [2, 4]
	% func3([3, 1, 3, 2, 3], Result). % [1, 2]
	func4([1, 1, 2, 3, 2], Result). % [1, 2, 3]
