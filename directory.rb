@students = []

def input_students
	puts "Please enter the name of the student."
	puts "To finish, just hit return twice."
	#get the first name
	name = gets.chomp
if !name.empty?
	#while the name is not empty, repeat this code
	while !name.empty? do
		#add the student hash to the array
		print "Cohort: "
		cohort = gets.chomp
		cohort = "Not provided" if cohort.empty?
		print "Date of birth dd/mm/yyyy: "
		dob = gets.chomp
		dob = "Not provided" if dob.empty?
		print "Hometown: "
		hometown = gets.chomp
		hometown = "Not provided" if hometown.empty?
		add_student(name, cohort, dob, hometown)
		if @students.length == 1
			puts "Now we have #{@students.length} student, please enter the next name or hit return"
		else
			puts "Now we have #{@students.length} students, please enter the next name or hit return"
		end
		#get another name from the user
		name = gets.chomp
	end
	#return the array of students
	@students
else
	input_students
end
end


def print_header
	puts "The students of the cohorts at Makers Academy".center(50)
	puts "------------".center(50)
end

def print_students_list
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

def print_footer
	if @students.length == 1
		puts "Overall, we have #{@students.length} great student".center(50)
	else
		puts "Overall, we have #{@students.length} great students".center(50)
	end
end


def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "4. Load the list from students.csv"
	puts "9. Exit"
end

def show_students
	print_header
	print_students_list
	print_footer
end

def process(selection)
	case selection
		when "1"
			input_students
		when "2"
			show_students
		when "3"
			save_students
		when "4"
			load_students
		when "9"
			exit
		else 
			puts "I don't know what you mean, please try again"
	end
end

def interactive_menu
	loop do
		print_menu
		process(gets.chomp)
	end
end

def save_students
	#open the file for writing
	file = File.open("students.csv", "w")
	#iterate over the array of students
	@students.each do |student|
	student_data = [student[:name], student[:cohort], student[:dob], student[:hometown]]
	csv_line = student_data.join(",")
	file.puts csv_line
	end
	file.close
end

def load_students
	file = File.open("students.csv", "r")
	file.readlines.each do |line|
	name, cohort, dob, hometown = line.chomp.split(',')
	add_student(name, cohort, dob, hometown)
	end
	file.close
end

def add_student(name, cohort, dob, hometown)
	@students << {:name => name, :cohort => cohort.to_sym, :dob => dob, :hometown => hometown}
end

#calling the methods
interactive_menu







