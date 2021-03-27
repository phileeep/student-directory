@students = []

def print_header 
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  i = 0

  puts "Which months cohort do you want to show?"
  month = gets.chomp.to_sym.capitalize

  if month.empty?
    puts "Which months cohort do you want to show?"
    month = gets.chomp.to_sym.capitalize
  end

  loop do while i <= @students.size-1 
    returnedstring = "#{i+1}: #{@students[i][:name]} (#{@students[i][:cohort]} Cohort) (Hobbies: #{@students[i][:hobbies]}) (Date of birth: #{@students[i][:dateofbirth]})"
    if @students[i][:cohort] == month
      puts returnedstring.center(100)
    end
    i += 1
  end
  end
  end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

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
  
    @students << {name: name, cohort: cohort, dateofbirth: dateofbirth, hobbies: hobbies}

    if @students.count < 2 
      puts "Now we have #{@students.count} student"
    elsif @students.count >= 2 
      puts "Now we have #{@students.count} students"
    end

    puts "Please enter the names of the students"
    name = gets.chomp
  end
  
  results = @students.map.sort_by { |hsh| hsh[:cohort] }

  return results

end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else 
      puts "I don't know what you meant, try again"
  end 
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" 
end
	
def show_students
  print_header
  print_students_list
  print_footer
end

def interactive_menu
  loop do 
    print_menu
    process(gets.chomp)
  end
end

def save_students
  file = File.open("students.csv", "w")

  @students.each do |students|
    student_Data =[student[:name], student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
end

interactive_menu