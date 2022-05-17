PREDICATES
	factorial(integer, integer).
	factorial_rec(integer, integer, integer).
	
	fibonacci(integer, integer).
	fibonacci_rec(integer, integer, integer, integer).
	
CLAUSES
	factorial_rec(Numb, Result, Current) :- 
		Numb <= 1, Result = Current, !. 
	
	factorial_rec(Numb, Result, Current) :-
		Cur_res = Current * Numb,
		Cur_numb = Numb - 1,
		factorial_rec(Cur_numb, Result, Cur_res).
	
	factorial(Numb, Result) :- factorial_rec(Numb, Result, 1).
	
	fibonacci_rec(Numb, Result, Prev_res, _) :- 
		Numb < 2, Result = Prev_res, !.
	
	fibonacci_rec(Numb, Result, Prev_prev_res, Prev_res) :-
		Cur_res = Prev_prev_res + Prev_res,
		Cur_numb = Numb - 1,
		fibonacci_rec(Cur_numb, Result, Prev_res, Cur_res).
	
	fibonacci(Numb, Result) :- fibonacci_rec(Numb, Result, 1, 1).
	
GOAL
	% factorial(4, Result). % 24
	fibonacci(6, Result). % 8
