#puts the students into an array
students = [
"Sanda Golcea",
"Matteo Manzo",
"Huy Le",
"David Blake"
]

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "------------"
end

def print(names)
	names.each do |name|
		puts name
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end

#calling the methods
print_header
print(students)
print_footer(students)