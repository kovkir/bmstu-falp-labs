DOMAINS
	name   = string.
	gender = symbol.
	struct_parent = parent(name, gender).

	child          = string.
	grandma_mother = string.
	grandpa_mother = string.
	grandma_father = string.
	grandpa_father = string.

PREDICATES
	is_parent(struct_parent, name).
	ancestors(child, grandma_mother, grandpa_mother, grandma_father, grandpa_father).
	
CLAUSES
	% дети
	is_parent(parent("Sergey", m), "Anna").
	is_parent(parent("Irina",  w), "Anna").
	
	% родители
	is_parent(parent("Peter", m), "Sergey").
	is_parent(parent("Maria", w), "Sergey").

	is_parent(parent("Dmitry", m), "Irina").
	is_parent(parent("Julia",  w), "Irina").
	
	% бабушки и дедушки
	is_parent(parent("Vadimir", m), "Peter").
	is_parent(parent("Daria",   w), "Peter").

	is_parent(parent("Anton",   m), "Maria").
	is_parent(parent("Natalia", w), "Maria").

	is_parent(parent("Ivan",      m), "Dmitry").
	is_parent(parent("Elizabeth", w), "Dmitry").

	is_parent(parent("Mikhail", m), "Julia").
	is_parent(parent("Marina",  w), "Julia").
	
	% правило
	ancestors(Child, GrandmaMother, GrandpaMother, GrandmaFather, GrandpaFather) :-
		is_parent(parent(Father, m), Child),
		is_parent(parent(Mother, w), Child),
		is_parent(parent(GrandpaMother, m), Mother),
		is_parent(parent(GrandmaMother, w), Mother),
		is_parent(parent(GrandpaFather, m), Father), 
		is_parent(parent(GrandmaFather, w), Father).
	
GOAL
	% вопрос 1
	% ancestors("Anna", GrandmaMother, _, GrandmaFather, _).

	% вопрос 2
	% ancestors("Anna", _, GrandpaMother, _, GrandpaFather).

	% вопрос 3
	ancestors("Anna", GrandmaMother, GrandpaMother, GrandmaFather, GrandpaFather).
	
	% вопрос 4
	% ancestors("Anna", GrandmaMother, _, _, _).
	
	% вопрос 5
	% ancestors("Anna", GrandmaMother, GrandpaMother, _, _).
