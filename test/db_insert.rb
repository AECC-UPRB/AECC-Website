require 'pg'

begin
	con = PG.connect :dbname => 'aeccdb', :user => 'juanjalvarez', :password => '2016'
	user = con.user
	db_name = con.db
	password = con.pass

	con.exec("INSERT INTO events(event_name, event_desc, event_date) VALUES('COJ Night 1', 'Programming competition training workshop', current_date)")
	con.exec("INSERT INTO events(event_name, event_desc, event_date) VALUES('Ruby workshop', 'Introduction into ruby programming from a rubyists point of view', current_date)")
	con.exec("INSERT INTO events(event_name, event_desc, event_date) VALUES('PCMR Showcase', 'Custom built gaming pc showcase', current_date)")
	con.exec("INSERT INTO events(event_name, event_desc, event_date) VALUES('Front-end workshop', 'Loose the fear for front-end development with a hands-on workshop', current_date)")
	con.exec("INSERT INTO events(event_name, event_desc, event_date) VALUES('AECC Initiation', 'I ran out of ideas', current_date)")

	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email, staff_image) VALUES('Juan J. Alvarez', 'Potato potato ching chong tomato', 'EMAIL', '/staff/juanjalvarez.jpg')")
	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email, staff_image) VALUES('Yadiel Cabreras', 'Mira mi gente', 'EMAIL', DEFAULT)")
	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email, staff_image) VALUES('Carlos Figueroa', 'Cabron', 'EMAIL', DEFAULT)")
	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email, staff_image) VALUES('Ramon Benitez', 'Surface', 'EMAIL', DEFAULT)")
	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email, staff_image) VALUES('Marie Zacarias', 'HAHAHAHAHAHAHAHAHAHAHAH', 'EMAIL', DEFAULT)")
	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email, staff_image) VALUES('Andres Acevedo', '4rtfuygvkuhjb54rtufygbuhjn', 'EMAIL', DEFAULT)")
	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email, staff_image) VALUES('Luis Orriols', 'Vamoj a bebel', 'EMAIL', DEFAULT)")
	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email, staff_image) VALUES('Juan Carlos Morales', '4.0 GPA Genius', 'EMAIL', DEFAULT)")
	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email, staff_image) VALUES('Juan Rivera', 'Master artist', 'EMAIL', DEFAULT)")
	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email, staff_image) VALUES('Milton Mendez', 'Videogame connoisseur', 'EMAIL', '/staff/miltonmendez.jpg')")
	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email, staff_image) VALUES('Danny Del Rio', 'Ruby extremist', 'EMAIL', DEFAULT)")

	con.exec("INSERT INTO roles(role_name, role_weight) VALUES('President', 999)")
	con.exec("INSERT INTO roles(role_name, role_weight) VALUES('VicePresident', 998)")
	con.exec("INSERT INTO roles(role_name, role_weight) VALUES('Head Financial Manager', 899)")
	con.exec("INSERT INTO roles(role_name, role_weight) VALUES('Financial Manager', 898)")
	con.exec("INSERT INTO roles(role_name, role_weight) VALUES('Secretary', 700)")
	con.exec("INSERT INTO roles(role_name, role_weight) VALUES('Vowel', 100)")
	con.exec("INSERT INTO roles(role_name, role_weight) VALUES('Developer', 99)")

	con.exec("INSERT INTO staffroles VALUES(1, 6)")
	con.exec("INSERT INTO staffroles VALUES(1, 7)")
	con.exec("INSERT INTO staffroles VALUES(2, 1)")
	con.exec("INSERT INTO staffroles VALUES(3, 2)")
	con.exec("INSERT INTO staffroles VALUES(4, 4)")
	con.exec("INSERT INTO staffroles VALUES(5, 3)")
	con.exec("INSERT INTO staffroles VALUES(6, 5)")
	con.exec("INSERT INTO staffroles VALUES(7, 6)")
	con.exec("INSERT INTO staffroles VALUES(8, 6)")
	con.exec("INSERT INTO staffroles VALUES(9, 6)")
	con.exec("INSERT INTO staffroles VALUES(10, 6)")
	con.exec("INSERT INTO staffroles VALUES(11, 7)")

rescue PG::Error => e
	puts e.message
ensure
	con.close if con
end