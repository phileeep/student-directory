#putting all our students now into an array
students = [
  {name: "Dr Hannibal Lecter",  cohort: :march},
  {name: "Darth Vader", cohort: :march},
  {name: "Nurse Ratched", cohort: :march},
  {name: "Michael Corleone", cohort: :march},
  {name: "Alex DeLarge", cohort: :march},
  {name: "The Wicked Witch of the West", cohort: :march},
  {name: "Terminator", cohort: :march},
  {name: "Freddy Krueger", cohort: :march},
  {name: "The Joker", cohort: :march},
  {name: "Joffrey Baratheon", cohort: :march},
  {name: "Norman Bates", cohort: :march}
]

#and then print them 
def print_header 
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

print_header
print(students)
print_footer(students)