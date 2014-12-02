def input_students
	puts "Please enter the name of the student."
	puts "To finish, just hit return twice."
	#create an empty array
	students = []
	cohort_list = []
	#get the first name
	name = gets.strip
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
	elsif !month.empty? 
			puts "The #{x} cohort:"
			month.map.each_with_index{|student, index| puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort), DoB: #{student[:dob]}, Hometown: #{student[:hometown]}\n".lstrip}
	else
	print ""
	end	
	end
cohorts("December")	
cohorts("January")	
cohorts("Not provided")	
end

def print_footer(students)
puts ""
	if students.length == 1
		puts "Overall, we have #{students.length} great student".center(50)
	else
		puts "Overall, we have #{students.length} great students".center(50)
	end
end

#calling the methods
students = input_students
print_header
print_each(students)
print_footer(students)