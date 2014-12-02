def input_students
	print "Please enter the name of the student.\n"
	print "To finish, just hit return twice.\n"
	#create an empty array
	students = []
	#get the first name
	name = gets.chomp
	#while the name is not empty, repeat this code
	while !name.empty? do
		#add the student hash to the array
		print "Date of birth dd/mm/yyyy:"
		dob = gets.chomp
		print "Hometown:"
		hometown = gets.chomp
		students << {:name => name,
		:cohort => :december,
		:dob => dob,
		:hometown => hometown}
		print "Now we have #{students.length} students, please enter the next name or hit return twice\n"
		#get another name from the user
		name = gets.chomp
	end
	#return the array of students
	students
end


def print_header
	print "The students of my cohort at Makers Academy\n"
	print "------------\n"
end

def print_each(students)
		i = 0
		until i >= students.length
		for student in students 
		print "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort), DoB: #{student[:dob]}, from #{student[:hometown]}\n" 
		i += 1 
		end
		end
end

def print_footer(students)
	print "Overall, we have #{students.length} great students\n"
end

#calling the methods
students = input_students
print_header
print_each(students)
print_footer(students)