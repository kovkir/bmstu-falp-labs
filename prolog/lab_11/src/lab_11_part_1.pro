DOMAINS
	name       = symbol.
	city       = symbol.
	phone      = symbol.
	birth_year = integer.

PREDICATES
	phonebook(name, city, phone, birth_year).

CLAUSES 
	phonebook("Kirill", "Moscow",     "8-916-100-10-10", 2002).
	phonebook("Ivan",   "Volgograd",  "8-916-200-20-20", 2001).
	phonebook("Misha",  "Moscow",     "8-916-300-30-30", 2001).
	phonebook("Gadzhi", "Petersburg", "8-916-400-40-40", 2001).
	phonebook("Marina", "Petersburg", "8-916-500-50-50", 2001).
	phonebook("Regina", "Moscow",     "8-916-600-60-60", 2001).

GOAL
	phonebook(Name, "Moscow", Phone, 2001).
