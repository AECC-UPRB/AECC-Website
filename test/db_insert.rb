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

	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email) VALUES('Juan J. Alvarez', 'ABOUT', 'EMAIL')")
	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email) VALUES('Yadiel Cabreras', 'ABOUT', 'EMAIL')")
	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email) VALUES('Carlos Figueroa', 'ABOUT', 'EMAIL')")
	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email) VALUES('Ramon Benitez', 'ABOUT', 'EMAIL')")
	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email) VALUES('Marie Zacarias', 'ABOUT', 'EMAIL')")
	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email) VALUES('Andres Acevedo', 'ABOUT', 'EMAIL')")
	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email) VALUES('Luis Orriols', 'ABOUT', 'EMAIL')")
	con.exec("INSERT INTO staff(staff_name, staff_about, staff_email) VALUES('Juan Carlos Morales', 'ABOUT', 'EMAIL')")

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

rescue PG::Error => e
	puts e.message
ensure
	con.close if con
end