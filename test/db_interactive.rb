require 'pg'

begin
	con = PG.connect :dbname => 'aeccdb', :user => 'juanjalvarez', :password => '2016'

	input = "START"
	until input == "quit" do
		puts "Command:"
		input = gets.chomp
		if input == "create" then
			load 'db_create.rb'
		elsif input == "insert" then
			load 'db_insert.rb'
		elsif input == "destroyall" then
			load 'db_destroy.rb'
		elsif input == "dropall" then
			load 'db_drop.rb'
		elsif input == "viewall" then
			load 'db_view.rb'
		elsif input == "exec" then
			puts "Query:"
			code = gets.chomp
			result = con.exec(code)
			result.each do|row|
				puts row
			end
		else
			puts "'#{input}' is not a known command"
		end
	end
	puts "Exiting interactive"

rescue PG::Error => e
	puts e.message
ensure
	con.close if con
end