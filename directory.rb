def input_students
	puts "Please enter the name of the student."
	puts "To finish, just hit return twice."
	#create an empty array
	students = []
	cohort_list = []
	#get the first name
	name = gets.strip
if !name.empty?
	#while the name is not empty, repeat this code
	while !name.empty? do
		#add the student hash to the array
		print "Cohort: "
		cohort = gets.strip.to_sym
		cohort = "Not provided".to_sym if cohort.empty?
		print "Date of birth dd/mm/yyyy: "
		dob = gets.strip
		dob = "Not provided" if dob.empty?
		print "Hometown: "
		hometown = gets.strip
		hometown = "Not provided" if hometown.empty?
		students << {:name => name,
		:cohort => cohort,
		:dob => dob,
		:hometown => hometown}
		if students.length == 1
			puts "Now we have #{students.length} student, please enter the next name or hit return"
		else
			puts "Now we have #{students.length} students, please enter the next name or hit return"
		end
		#get another name from the user
		name = gets.strip
	end
	#return the array of students
	students
else
	input_students
end
end


def print_header
	puts "The students of the cohorts at Makers Academy".center(50)
	puts "------------".center(50)
end

def print_each(students)
	@students = students
	def cohorts(x)
	month = @students.select {|student| student[:cohort] == x.to_sym}
	if !month.empty? && x == "Not provided"
			puts "The following students do not belong to a cohort yet:"
			month.map.each_with_index{|student, index| puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort), DoB: #{student[:dob]}, Hometown: #{student[:hometown]}\n".lstrip}
			puts ""
	elsif !month.empty? 
			puts "The #{x} cohort:"
			month.map.each_with_index{|student, index| puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort), DoB: #{student[:dob]}, Hometown: #{student[:hometown]}\n".lstrip}
			puts ""
	else
	print ""
	end	
	end
cohorts("December")	
cohorts("January")	
cohorts("Not provided")	
end

def print_footer(students)
	if students.length == 1
		puts "Overall, we have #{students.length} great student".center(50)
	else
		puts "Overall, we have #{students.length} great students".center(50)
	end
end

#defining the interactive menu
def interactive_menu
	students = []
	loop do
	#print the menu and ask the user what to do
	puts "1. Input the students"
	puts "2. Show the students"
	puts "9. Exit"
	#read the input and save it to a variable
	selection = gets.chomp
	#do what the user has asked
	case selection
		when "1"
			students = input_students
		when "2"
			print_header
			print_each(students)
			print_footer(students)
		when "9"
			exit
		else 
			puts "I don't know what you mean, please try again"
		end
	end
end

#calling the methods
interactive_menu