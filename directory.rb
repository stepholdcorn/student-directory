#puts the students into an array
students = [
{:name => "Sanda Golcea", :cohort => :december},
{:name => "Matteo Manzo", :cohort => :december},
{:name => "Huy Le", :cohort => :december},
{:name => "David Blake", :cohort => :december}
]

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "------------"
end

def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer(students)
	puts "Overall, we have #{students.length} great students"
end

#calling the methods
print_header
print(students)
print_footer(students)