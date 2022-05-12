PREDICATES
	max2(real, real, real).
	max2_сut(real, real, real).
	max3(real, real, real, real).
	max3_сut(real, real, real, real).
	
CLAUSES
	max2(A1, A2, A1) :- A1 >= A2.
	max2(A1, A2, A2) :- A1  < A2.

	max2_сut(A1, A2, A1) :- A1 >= A2, !.
	max2_сut(_,  A2, A2).
	
	max3(B1, B2, B3, B1) :- B1 >= B2, B1 >= B3.
	max3(B1, B2, B3, B2) :- B2 >= B1, B2 >= B3.
	max3(B1, B2, B3, B3) :- B3 >= B1, B3 >= B2.

	max3_сut(B1, B2, B3, B1) :- B1 >= B2, B1 >= B3, !.
	max3_сut(_,  B2, B3, B2) :- B2 >= B3, !.
	max3_сut(_, _, B3, B3).
	
GOAL
	% max2(1, 2, Max).
	% max2(2, 1, Max).
	
	% max2_сut(1, 2, Max). 
	% max2_сut(2, 1, Max).
	
	% max3(1, 2, 3, Max).
	% max3(1, 3, 2, Max).
	% max3(3, 1, 2, Max).

	max3_сut(1, 2, 3, Max).
	% max3_сut(1, 3, 2, Max).
	% max3_сut(3, 1, 2, Max).
