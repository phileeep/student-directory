def print_header 
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0

  puts "Which months cohort do you want to show?"
  month = gets.chomp.to_sym.capitalize

  loop do while i <= students.size-1 
    returnedstring = "#{i+1}: #{students[i][:name]} (#{students[i][:cohort]} Cohort) (Hobbies: #{students[i][:hobbies]}) (Date of birth: #{students[i][:dateofbirth]})"
    if students[i][:cohort] == month
      puts returnedstring.center(100)
    end
    i += 1
  end
  end
  end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students
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
    cohort = gets.chomp.to_sym.capitalize

    if cohort.empty?
        cohort = :March
    end

    puts "Please enter their Hobbies"
    hobbies = gets.chomp.capitalize

    if hobbies.empty?
      hobbies = "Surfing, Climbing"
    end
  
    puts "Please enter their Date of Birth"
    dateofbirth = gets.chomp.capitalize

    if dateofbirth.empty?
      dateofbirth = "01/01/91"
    end
  
    students << {name: name, cohort: cohort, dateofbirth: dateofbirth, hobbies: hobbies}

    if students.count < 2 
      puts "Now we have #{students.count} student"
    elsif students.count >= 2 
      puts "Now we have #{students.count} students"
    end

    puts "Please enter the names of the students"
    name = gets.chomp
  end
  
  results = students.map.sort_by { |hsh| hsh[:cohort] }

  return results

end

def interactive_menu
  students = []
  loop do 
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"

    selection = gets.chomp

    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else 
      puts "I don't know what you meant, try again"
    end 
  end
end

interactive_menu
print_header
print(students)
print_footer(students)