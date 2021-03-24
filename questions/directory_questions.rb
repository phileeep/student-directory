def print_header 
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0
    loop do while i <= students.size-1 
      puts "#{i+1}: #{students[i][:name]} (#{students[i][:cohort]} cohort) (Hobbies: #{students[i][:hobbies]}) (Date of birth: #{students[i][:dateofbirth]})"
      i += 1
    end
  end
  end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students
  puts "Pleae enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp

  while !name.empty? do 
    puts "Please enter their hobbies"
    hobbies = gets.chomp
  
    puts "Please enter their Date of Birth"
    dateofbirth = gets.chomp
    students << {name: name, cohort: :march, dateofbirth: dateofbirth, hobbies: hobbies}
    puts "Now we have #{students.count} students"
    puts "Pleae enter the names of the students"
    name = gets.chomp
  end

  students
end

students = input_students
print_header
print(students)
print_footer(students)