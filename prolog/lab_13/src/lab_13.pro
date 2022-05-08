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

	square = integer.
	color  = symbol.

	property = building(price , address_struct); 
			   area(price, square);
			   water_transport(price, color);
			   car(brand, color, price).

PREDICATES
	phonebook(surname, phone, address_struct).
	bank_depositor(surname, city, bank, score, sum).
	owner(surname, property).

	cost_ownership(surname, property, price).
	func_1(surname, property).
	func_2(surname, property, price).
	func_3(surname, price).

CLAUSES
	phonebook("Kishov",   "8-916-100-10-10", address("Moscow",     "Sunny Street",     1, 10)).
	phonebook("Kovalets", "8-916-200-20-20", address("Moscow",     "Happiness Street", 2, 20)).
	phonebook("Volkov",   "8-916-300-30-30", address("Moscow",     "Heroes Street",    3, 30)).
	phonebook("Volkov",   "8-111-111-11-11", address("Omsk",       "Traitors Street",  3, 30)).
	phonebook("Tsvetkov", "8-916-400-40-40", address("Petersburg", "Street of Love",   4, 40)).
	phonebook("Maslova",  "8-916-500-50-50", address("Moscow",     "Hope Street",      5, 50)).
	phonebook("Khamzina", "8-916-600-60-60", address("Orenburg",   "Lenin Street",     6, 60)).
		
	bank_depositor("Khamzina", "Orenburg", "Sberbank", 1001, 15000000).
	bank_depositor("Kovalets", "Moscow",   "Sberbank", 2002, 200000).
	bank_depositor("Volkov",   "Moscow",   "Sberbank", 4004, 25000).
	bank_depositor("Volkov",   "Omsk",     "Sberbank", 5005, 10).
	bank_depositor("Volkov",   "Moscow",   "VTB",      6006, 450000).
	bank_depositor("Maslova",  "Moscow",   "Tinkoff",  7007, 650000).

	owner("Kovalets", building(10000000, 
		address("Moscow", "Happiness Street", 2, 20))).
	owner("Kovalets", area(200000, 100)).
	owner("Kovalets", water_transport(500000, "red")).
	owner("Kovalets", car("Porsche", "black", 25000000)).

	owner("Khamzina", building(6000000, 
		address("Orenburg", "Lenin Street", 6, 60))).
	owner("Khamzina", area(100000, 100)).
	owner("Khamzina", car("BMW", "black", 9000000)).

	owner("Tsvetkov", building(7000000, 
		address("Petersburg", "Street of Love", 4, 40))).
	owner("Tsvetkov", water_transport(75000, "blue")).
	owner("Tsvetkov", car("Mercedes", "white", 12000000)).

	func_1(Surname, Property) :- 
		func_2(Surname, Property, _).

	func_2(Surname, building, Price) :- 
		owner(Surname, building(Price, _)).
	func_2(Surname, area, Price) :- 
		owner(Surname, area(Price, _)).
	func_2(Surname, water_transport, Price) :- 
		owner(Surname, water_transport(Price, _)).
	func_2(Surname, car, Price) :- 
		owner(Surname, car(_, _, Price)).

	cost_ownership(Surname, building, Price) :- 
		owner(Surname, building(Price, _)), !.
	cost_ownership(Surname, area, Price) :- 
		owner(Surname, area(Price, _)), !.
	cost_ownership(Surname, water_transport, Price) :- 
		owner(Surname, water_transport(Price, _)), !.
	cost_ownership(Surname, car, Price) :- 
		owner(Surname, car(_, _, Price)), !.
	cost_ownership(_, _, 0).
	
	func_3(Surname, Price) :- 
		cost_ownership(Surname, building, Price1),
		cost_ownership(Surname, area, Price2),
		cost_ownership(Surname, water_transport, Price3),
		cost_ownership(Surname, car, Price4),
		Price = Price1 + Price2 + Price3 + Price4.

GOAL
	% func_1("Kovalets", Property).
	func_2("Khamzina", Property, Price).
	% func_3("Tsvetkov", Price).
