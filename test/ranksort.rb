require 'pg'

begin
	con = PG.connect :dbname => 'aeccdb', :user => 'juanjalvarez', :password => '2016'

	result = con.exec("SELECT * FROM roles ORDER BY role_weight DESC")
	roles = Array.new
	staffroles = Hash.new
	result.each do |row|
		roles.push row
		staffroles[row['role_id']] = Array.new
	end

	result = con.exec("SELECT * FROM staff")
	staff = Hash.new
	result.each do |row|
		staff[row['staff_id']] = row
	end

	result = con.exec("SELECT * FROM staffroles")
	result.each do |row|
		staffroles[row['fk2_role_id']].push staff[row['fk1_staff_id']]
	end

	roles.each do |role|
		puts "=" * role['role_name'].length
		puts role['role_name']
		puts "=" * role['role_name'].length
		staffroles[role['role_id']].each do |s|
			puts s['staff_name']
		end
		puts ""
	end

rescue PG::Error => e
	puts e.message
ensure
	con.close if con
end