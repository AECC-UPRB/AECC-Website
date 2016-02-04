require 'pg'

begin
	con = PG.connect :dbname => 'aeccdb', :user => 'juanjalvarez', :password => '2016'
	user = con.user
	db_name = con.db
	password = con.pass

	puts "User: #{user}"
	puts "Database: #{db_name}"\

	con.exec "DROP TABLE IF EXISTS Stories"
	con.exec "CREATE TABLE Stories(Id INTEGER PRIMARY KEY, Title VARCHAR(30), Text VARCHAR(1000))"
	con.exec "INSERT INTO Stories VALUES (1, 'First post!', 'This is the first post in the database!')"
	con.exec "INSERT INTO Stories VALUES (2, 'Chaos breaks loose', 'I have no idea what the fuck I am doing')"
	con.exec "INSERT INTO Stories VALUES (3, 'Potato potato...', 'I dedicate a poem to my progress: Potato potato... Ching, chong. Tomato.')"

	result = con.exec "SELECT * FROM Stories"

	result.each do |row|
		puts "Story ##{row['id']}: #{row['title']}"
	end

rescue PG::Error => e
	puts e.message
ensure
	con.close if con
end