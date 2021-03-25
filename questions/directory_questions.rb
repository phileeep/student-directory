def print_header 
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0
    loop do while i <= students.size-1 
      returnedstring = "#{i+1}: #{students[i][:name]} (#{students[i][:cohort]} Cohort) (Hobbies: #{students[i][:hobbies]}) (Date of birth: #{students[i][:dateofbirth]})"
      puts returnedstring.center(100)
      i += 1
    end
  end
  end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students(name = "John")
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  students = []

  name = gets.chomp.capitalize

  puts "Your name is #{name} is that correct? Please type Y / N"
  choice = gets.chomp

  while choice == 'N' || choice.empty?
    puts "Please enter the names of the students" 
    name = gets.chomp.capitalize
    puts "Your name is #{name} is that correct? Please type Y / N"
    choice = gets.chomp
  end

  while !name.empty? do 
    puts "Which cohort are they in?"
    cohort = gets.chomp.to_sym

    while cohort.empty?
      puts "Which cohort are they in?"
      cohort = gets.chomp.to_sym
      if cohort.empty?
        cohort = "march"
      end

    puts "Please enter their Hobbies"
    hobbies = gets.chomp.capitalize
  
    puts "Please enter their Date of Birth"
    dateofbirth = gets.chomp.capitalize
    students << {name: name, cohort: cohort, dateofbirth: dateofbirth, hobbies: hobbies}
    puts "Now we have #{students.count} students"
    puts "Pleae enter the names of the students"
    name = gets.chomp
  end
end

  students
end

students = input_students
print_header
print(students)
print_footer(students)