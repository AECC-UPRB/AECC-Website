require 'pg'

begin
	@con = PG.connect :dbname => 'aeccdb', :user => 'juanjalvarez', :password => '2016'

	def showtable(table)
		result = @con.exec("SELECT * FROM #{table}")
		line = "=" * table.length
		puts line
		puts table
		puts line
		result.each do |row|
			puts row
		end
		puts ""
	end

	showtable "events"

	showtable "staff"

	showtable "roles"

	showtable "staffroles"

rescue PG::Error => e
	puts e.message
ensure
	@con.close if @con
end