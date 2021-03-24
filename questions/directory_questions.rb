def print_header 
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0
    loop do while i <= students.size-1 
      puts "#{i+1}: #{students[i][:name]} (#{students[0][:cohort]} cohort)"
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
    students << {name: name, cohort: :march}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end

  students
end

students = input_students
print_header
print(students)
print_footer(students)