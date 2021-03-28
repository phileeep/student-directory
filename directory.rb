require 'csv'
@students = []
@dash = puts '-------------------------------------------------------'.center(100)

def user_selection(selection)
  case selection
    when "1"
      puts "Selected To Input"
      input_students
    when "2"
      puts "Selected To Show Students"
      show_students
    when "3"
      puts "Selected To Save The List"
      save_students
    when "4"
      puts "Selected To Load the List"
      load_students(file_open)
    when "5"
      source_code
    when "9"
      puts "Selected Exit"
      exit
    else 
      puts "I don't know what you meant, try again"
  end 
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students"
  puts "4. Load a previous list students"
  puts "5. Show the source code"
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
    user_selection(STDIN.gets.chomp)
  end
end

def file_open
  puts "What file do you want to open?"
  filename = gets.chomp 
end

def save_students(filename = "students.csv")
  puts "What name do you want for the file?"
  filename = gets.chomp
  CSV.open(filename, "w") do |csv|
    student_details = []
    @students.each do |student|
      student_details = student[:name], student[:cohort], student[:hobbies], student[:age]
      csv << student_details
    end
  end
  puts "Saved to #{filename}"
  @dash.center(100)
end

def load_students(filename = "students.csv")
  if File.exists?(filename)
    CSV.foreach(filename) do |row|
      name, cohort, hobbies, age = row
      @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, age: age}
    end
  puts "Loaded #{filename}"
  @dash
  else 
    puts "Sorry #{filename} does not exist."
  end
end

def try_load_students
  filename = ARGV.first || "students.csv"
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
  end
end

def print_header 
  puts "The Students of Villains Academy"
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
    returnedstring = "#{i+1}: #{@students[i][:name]} (#{@students[i][:cohort]} Cohort) (Hobbies: #{@students[i][:hobbies]}) (Age: #{@students[i][:age]})"
    if @students[i][:cohort] == month
      puts returnedstring.center(100)
    end
    i += 1
  end
  end
  end

def print_footer
  puts "Overall, we have #{@students.count} great students"
  puts @dash
end

def input_students
  choice = ''

  puts "Please enter the names of the students" 
  name = STDIN.gets.chomp.capitalize

    while !name.empty?

      while choice.upcase != 'Y'
        puts "Your name is #{name} is that correct? Please type Y / N"
        choice = STDIN.gets.chomp
        if choice.upcase == 'N'
        puts "Please enter your name again"
        name = STDIN.gets.chomp.capitalize
        else 
          break
        end
      end
      

      puts "Which cohort are they in?"
      cohort = STDIN.gets.chomp.to_sym.capitalize

      if cohort.empty?
          cohort = :March
      end

      puts "Please enter their Hobbies"
      hobbies = STDIN.gets.chomp.capitalize

      if hobbies.empty?
        hobbies = "Making Chocolate"
      end
    
      puts "Please enter their age"
      age = STDIN.gets.chomp.capitalize

      if age.empty?
        age = 25
      end
    
      @students << {name: name, cohort: cohort, age: age, hobbies: hobbies}

      if @students.count < 2 
        puts "Now we have #{@students.count} student"
      elsif @students.count >= 2 
        puts "Now we have #{@students.count} students"
      end
      
      puts "Please enter the names of the students" 
      name = STDIN.gets.chomp.capitalize
  end
  
  results = @students.map.sort_by { |hsh| hsh[:cohort] }

  return results

end

def source_code
  puts __FILE__
  @dash
end

try_load_students
interactive_menu
