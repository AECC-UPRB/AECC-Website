class Member

	def initialize(name_str, rank_str)
		@name = name_str
		@rank = rank_str
	end

	def getName
		return @name
	end

	def getRank
		return @rank
	end
end

member = Array.new
rank = Array.new
map = Hash.new
member.push(Member.new('Juan J. Alvarez', 'Vowel'))
member.push(Member.new('Yadiel', 'President'))
member.push(Member.new('Carlos', 'Vice-President'))
member.push(Member.new('Marie', 'Financial manager'))
member.push(Member.new('Ramon', 'Financial manager'))
member.push(Member.new('Andres', 'Secretary'))
member.push(Member.new('Juan Carlos', 'Vowel'))
member.push(Member.new('Juan Rivera', 'Vowel'))
member.push(Member.new('Milton', 'Vowel'))
member.push(Member.new('Luis', 'Vowel'))

member.each do |m|
	unless rank.include? m.getRank
		rank.push m.getRank unless rank.include? m.getRank
		map[m.getRank] = Array.new
	end
	map[m.getRank].push m
end

rank.each do |r|

end

rank.each do |r|
	puts r
	puts "-" * r.length
	map[r].each do |m|
		puts m.getName
	end
	puts "\n\n"
end

#TODO: sort ranks by number of members in ascending order