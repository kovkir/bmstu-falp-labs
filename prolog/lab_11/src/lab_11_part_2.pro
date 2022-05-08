DOMAINS
	student_id         = integer.
	student_name       = symbol.
	student_city       = symbol.
	student_phone      = symbol.
	student_birth_year = integer.

	university_id      = integer.
	university_name    = symbol.
	university_city    = symbol.

PREDICATES
	student(student_id, student_name, student_city, student_phone, student_birth_year).
	university(university_id, university_name, university_city).
	study_link(university_id, student_id).
	students(university_id, university_name, university_city, student_id, student_name, student_city, student_phone, student_birth_year).

CLAUSES 
	student(0, "Kirill", "Moscow",     "8-916-100-10-10", 2002).
	student(1, "Ivan",   "Volgograd",  "8-916-200-20-20", 2001).
	student(2, "Misha",  "Moscow",     "8-916-300-30-30", 2001).
	student(3, "Gadzhi", "Petersburg", "8-916-400-40-40", 2001).
	student(4, "Marina", "Petersburg", "8-916-500-50-50", 2001).
	student(5, "Regina", "Moscow",     "8-916-600-60-60", 2001).

	university(0, "BMSTU", "Moscow").
	university(1, "MSU",   "Moscow").
	university(2, "ITMO",  "Petersburg").
	university(3, "OSU",   "Orenburg").

	study_link(0, 0).
	study_link(0, 2).
	study_link(0, 3).

	study_link(1, 0).
	study_link(1, 4).
	study_link(1, 5).

	study_link(2, 1).
	study_link(2, 4).

	study_link(3, 5).

	students(University_id, University_name, University_city, Student_id, Student_name, Student_city, Student_phone, Student_birth_year):-
		university(University_id, University_name, University_city),
		study_link(University_id, Student_id),
		student(Student_id, Student_name, Student_city, Student_phone, Student_birth_year).

GOAL
	%student(Student_id, Student_name, "Moscow", Student_Phone, 2002).

	%university(University_id, University_name, "Moscow").

	students(0, University_name, University_city, Student_id, Student_name, "Moscow", Student_Phone, Student_birth_year).
