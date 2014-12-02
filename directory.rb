def input_students
	puts "Please enter the name of the student."
	puts "To finish, just hit return twice."
	#create an empty array
	students = []
	#get the first name
	name = gets.chomp
	#while the name is not empty, repeat this code
	while !name.empty? do
		#add the student hash to the array
		print "Date of birth dd/mm/yyyy: "
		dob = gets.chomp
		print "Hometown: "
		hometown = gets.chomp
		students << {:name => name,
		:cohort => :december,
		:dob => dob,
		:hometown => hometown}
		puts "Now we have #{students.length} students, please enter the next name or hit return"
		#get another name from the user
		name = gets.chomp
	end
	#return the array of students
	students
end


def print_header
	puts "The students of my cohort at Makers Academy".center(50)
	puts "------------".center(50)
	puts " "
end

def print_each(students)
		i = 0
		until i >= students.length
		for student in students 
		puts "#{i+1}. #{student[:name]} (#{student[:cohort]} cohort), DoB: #{student[:dob]}, from #{student[:hometown]}\n".lstrip
		i += 1 
		end
		end
end

def print_footer(students)
	puts " "
	puts "Overall, we have #{students.length} great students".center(50)
end

#calling the methods
students = input_students
print_header
print_each(students)
print_footer(students)