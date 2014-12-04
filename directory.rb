@students = []
@cohort_list = []

def try_load_students
	filename = ARGV.first
	return if filename.nil?
	if File.exists?(filename)
		load_students(filename)
		puts "Loaded #{@students.length} from #{filename}"
	else
		puts "Sorry, #{filename} does not exist"
		exit
	end
end

def interactive_menu
	loop do
		print_menu
		process(STDIN.gets.chomp)
	end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list of students"
	puts "4. Load the list of students"
	puts "9. Exit"
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

def add_student(name, cohort, dob, hometown)
	@students << {:name => name, :cohort => cohort.to_sym, :dob => dob, :hometown => hometown}
end

def display_input_message
	if @students.length == 1
		puts "Now we have #{@students.length} student, please enter the next name or hit return"
	else
		puts "Now we have #{@students.length} students, please enter the next name or hit return"
	end
end

def input_students
	puts "Please enter the name of the student."
	puts "To finish, just hit return twice."
	name = STDIN.gets.chomp
	if !name.empty?
		while !name.empty? do
			print "Cohort: "
			cohort = STDIN.gets.chomp
			cohort = "Not provided" if cohort.empty?
			print "Date of birth dd/mm/yyyy: "
			dob = STDIN.gets.chomp
			dob = "Not provided" if dob.empty?
			print "Hometown: "
			hometown = STDIN.gets.chomp
			hometown = "Not provided" if hometown.empty?
			add_student(name, cohort, dob, hometown)
			display_input_message
			name = STDIN.gets.chomp
		end
		@students
	else
		input_students
	end
end

def show_students
	print_header
	print_students_list
	print_footer
end

def print_header
	puts "The students of the cohorts at Makers Academy".center(50)
	puts "------------".center(50)
end

def existing_cohorts
	@students.select {|student| @cohort_list << student[:cohort] unless @cohort_list.include?(student[:cohort])}
	@cohort_list
end

def print_students_list
	existing_cohorts.each do |x|
		month = @students.select {|student| student[:cohort] == x}
		if x.to_s == "Not provided"
			puts "The following students do not belong to a cohort yet:"
			month.map.each_with_index{|student, index| puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort), DoB: #{student[:dob]}, Hometown: #{student[:hometown]}\n".lstrip}
			puts ""
		else 
			puts "The #{x} cohort:"
			month.map.each_with_index{|student, index| puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort), DoB: #{student[:dob]}, Hometown: #{student[:hometown]}\n".lstrip}
			puts ""
		end
	end	
end

def print_footer
	if @students.length == 1
		puts "Overall, we have #{@students.length} great student".center(50)
	else
		puts "Overall, we have #{@students.length} great students".center(50)
	end
end

def save_students
	puts "Please enter the name of the file that you would like to save to"
	save_to = gets.chomp
	file = File.open(save_to, "w")
	@students.each do |student|
		student_data = [student[:name], student[:cohort], student[:dob], student[:hometown]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end

def load_students(filename = "students.csv")
	puts "Please enter the name of the file you would like to load"
	filename = gets.chomp
	file = File.open(filename, "r")
	file.readlines.each do |line|
		name, cohort, dob, hometown = line.chomp.split(',')
		add_student(name, cohort, dob, hometown)
	end
	file.close
end

try_load_students
interactive_menu







