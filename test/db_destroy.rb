require 'pg'

begin
	con = PG.connect :dbname => 'aeccdb', :user => 'juanjalvarez', :password => '2016'
	user = con.user
	db_name = con.db
	password = con.pass

	tables = ["events", "eventreviews", "staff", "roles", "staffroles"]
	tables.reverse.each do |t|
		con.exec("DELETE FROM #{t}")
	end

rescue PG::Error => e
	puts e.message
ensure
	con.close if con
end