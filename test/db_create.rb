require 'pg'

begin
	con = PG.connect :dbname => 'aeccdb', :user => 'juanjalvarez', :password => '2016'
	user = con.user
	db_name = con.db
	password = con.pass

	con.exec("CREATE TABLE events(event_id SERIAL PRIMARY KEY, event_name VARCHAR(30) NOT NULL, event_desc VARCHAR(1000), event_image VARCHAR(50), event_date DATE NOT NULL)")
	con.exec("CREATE TABLE eventreviews(review_id SERIAL PRIMARY KEY, fk1_event_id INTEGER REFERENCES events(event_id) NOT NULL, review_rating INTEGER NOT NULL, review_message VARCHAR(1000))")
	con.exec("CREATE TABLE staff(staff_id SERIAL PRIMARY KEY, staff_name VARCHAR(30) NOT NULL, staff_image VARCHAR(50) DEFAULT '/staff/default.jpg', staff_about VARCHAR(250) NOT NULL, staff_email VARCHAR(50) NOT NULL)")
	con.exec("CREATE TABLE roles(role_id SERIAL PRIMARY KEY, role_name VARCHAR(30) NOT NULL, role_weight INTEGER NOT NULL)")
	con.exec("CREATE TABLE staffroles(fk1_staff_id INTEGER REFERENCES staff(staff_id), fk2_role_id INTEGER REFERENCES roles(role_id))")

rescue PG::Error => e
	puts e.message
ensure
	con.close if con
end