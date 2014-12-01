#puts the students into an array
students = [
"Sanda Golcea",
"Matteo Manzo",
"Huy Le",
"David Blake"
]

#prints the students
puts "The students of my cohort at Makers Academy"
puts "------------"
students.each do |student|
	puts student
end

#finally, we print the total
puts "Overall, we have #{students.length} great students"