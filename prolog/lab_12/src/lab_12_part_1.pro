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
	
	func_1a(surname, phone, brand, price).
	func_1b(phone, brand).
	func_2(surname, symbol, phone, symbol, bank).

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

	func_1a(Surname, Phone, Brand, Price) :-  
		phonebook(Surname, Phone, _),
		car(Surname, _, Brand, _, Price). 
		
	func_1b(Phone, Brand) :- 
		func_1a(_, Phone, Brand, _).
	
	func_2(Surname, City, Phone, Street, Bank) :- 
		phonebook(Surname, Phone, address(City, Street, _, _)), 
		bank_depositor(Surname, City, Bank, _, _).
	
GOAL
	% func_1a(Surname, "8-916-200-20-20", Brand, Price).
	% func_1b("8-916-200-20-20", Brand).
	func_2("Volkov", "Moscow", Phone, Street, Bank).
