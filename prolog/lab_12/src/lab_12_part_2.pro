DOMAINS 
	surname = symbol.
	phone   = symbol.
	city    = symbol. 
	street  = symbol.
	house   = integer.
	flat    = integer.
	address_struct = address(city, street, house, flat).

	brand = symbol.
	color = symbol.
	price = integer.
	
	bank  = symbol.
	score = integer.
	sum   = integer.

PREDICATES
	phonebook(surname, phone, address_struct).
	car(surname, city, brand, color, price).
	bank_depositor(surname, city, bank, score, sum).
	
	func(brand, color, surname, city, phone, bank).

CLAUSES	
	phonebook("Kishov",   "8-916-100-10-10", address("Moscow",     "Sunny Street",     1, 10)).
	phonebook("Kovalets", "8-916-200-20-20", address("Moscow",     "Happiness Street", 2, 20)).
	phonebook("Volkov",   "8-916-300-30-30", address("Moscow",     "Heroes Street",    3, 30)).
	phonebook("Volkov",   "8-111-111-11-11", address("Omsk",       "Traitors Street",  3, 30)).
	phonebook("Tsvetkov", "8-916-400-40-40", address("Petersburg", "Street of Love",   4, 40)).
	phonebook("Maslova",  "8-916-500-50-50", address("Moscow",     "Hope Street",      5, 50)).
	phonebook("Khamzina", "8-916-600-60-60", address("Orenburg",   "Lenin Street",     6, 60)).

	car("Volkov",   "Moscow",     "Mercedes", "white",  12000000).
	car("Kovalets", "Moscow",     "Porsche",  "black",  25000000).
	car("Kovalets", "Moscow",     "BMW",      "cherry", 800000).
	car("Tsvetkov", "Petersburg", "Lada",     "white",  450000).
	car("Maslova",  "Moscow",     "Mercedes", "white",  8000000).
	
	bank_depositor("Khamzina", "Orenburg", "Sberbank", 1001, 15000000).
	bank_depositor("Kovalets", "Moscow",   "Sberbank", 2002, 200000).
	bank_depositor("Volkov",   "Moscow",   "Sberbank", 4004, 25000).
	bank_depositor("Volkov",   "Omsk",     "Sberbank", 5005, 10).
	bank_depositor("Volkov",   "Moscow",   "VTB",      6006, 450000).
	bank_depositor("Maslova",  "Moscow",   "Tinkoff",  7007, 650000).

	func(Brand, Color, Surname, City, Phone, Bank) :- 
		car(Surname, City, Brand, Color, _), 
		phonebook(Surname, Phone, address(City, _, _, _)),
		bank_depositor(Surname, City, Bank, _, _).

GOAL
	% Нет владельцев
	% func("Porsche", "white", Surname, City, Phone, Bank).
	% Один владелец
	% func("BMW", "cherry", Surname, City, Phone, Bank).
	% Два владельца
	func("Mercedes", "white", Surname, City, Phone, Bank).
