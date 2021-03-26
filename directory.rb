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

  name = STDIN.gets.chomp.capitalize

  puts "Your name is #{name} is that correct? Please type Y / N"
  choice = STDIN.gets.chomp

  while choice == 'N' || choice.empty?
    puts "Please enter the names of the students" 
    name = STDIN.gets.chomp.capitalize
    puts "Your name is #{name} is that correct? Please type Y / N"
    choice = STDIN.gets.chomp
  end

  while !name.empty? do 
    puts "Which cohort are they in?"
    cohort = STDIN.gets.chomp.to_sym.capitalize

    if cohort.empty?
        cohort = :March
    end

    puts "Please enter their Hobbies"
    hobbies = STDIN.gets.chomp.capitalize

    if hobbies.empty?
      hobbies = "Surfing, Climbing"
    end
  
    puts "Please enter their Date of Birth"
    dateofbirth = STDIN.gets.chomp.capitalize

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
    name = STDIN.gets.chomp
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
    when "4"
      load_students
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
  puts "4. Load the list from students.csv"
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
    process(STDIN.gets.chomp)
  end
end

def save_students
  file = File.open("students.csv", "w")

  @students.each do |student|
    student_data =[student[:name], student[:cohort]]
    csv_line = student_data.join(',')
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loads #{@students.count} from #{filename}"
  else 
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

load_students
interactive_menu
