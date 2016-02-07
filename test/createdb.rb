require 'pg'

begin
	con = PG.connect :dbname => 'aeccdb', :user => 'juanjalvarez', :password => '2016'
	user = con.user
	db_name = con.db
	password = con.pass

	puts "User: #{user}"
	puts "Database: #{db_name}"\

	#con.exec "DROP TABLE IF EXISTS Stories"
	#con.exec "CREATE TABLE Stories(Id INTEGER PRIMARY KEY, Title VARCHAR(30), Text VARCHAR(1000))"
	#con.exec "INSERT INTO Stories VALUES (1, 'First post!', 'This is the first post in the database!')"
	#con.exec "INSERT INTO Stories VALUES (2, 'Chaos breaks loose', 'I have no idea what the fuck I am doing')"
	#con.exec "INSERT INTO Stories VALUES (3, 'Potato potato...', 'I dedicate a poem to my progress: Potato potato... Ching, chong. Tomato.')"

	#result = con.exec "SELECT * FROM Stories"

	#result.each do |row|
	#	puts "Story ##{row['id']}: #{row['title']}"
	#end

	con.exec "DROP TABLE IF EXISTS Events"
	con.exec "CREATE TABLE Events(eventid INTEGER PRIMARY KEY, eventname VARCHAR(30), eventdesc VARCHAR(1000), eventdate DATE, occupancy INTEGER)"
	con.exec "INSERT INTO EVENTS VALUES (1, 'COJ Nights 1', 'Programming competition training sessions', current_date, 15)"
	con.exec "INSERT INTO EVENTS VALUES (2, 'Ruby workshop', 'Introduction to the popular language Ruby', current_date, 30)"
	con.exec "INSERT INTO EVENTS VALUES (3, 'PCMR Showcase', 'Custom built desktop showcase, come and socialize!', current_date, 90)"
	con.exec "INSERT INTO EVENTS VALUES (4, 'Jame Jam', 'Game night! Bring your games and have fun!', current_date, 40)"
	con.exec "INSERT INTO EVENTS VALUES (5, 'Initiation', 'Welcoming ceremony to the new AECC members', current_date, 100)"

	result = con.exec "SELECT * FROM Events"

	result.each do |row|
		puts "----------------------------------"
		puts "Event ID: #{row['eventid']}"
		puts "Event: #{row['eventname']}"
		puts "Description: #{row['eventdesc']}"
		puts "Date: #{row['eventdate']}"
		puts "Occupancy: #{row['occupancy']}"
		puts "----------------------------------"
	end

rescue PG::Error => e
	puts e.message
ensure
	con.close if con
end
