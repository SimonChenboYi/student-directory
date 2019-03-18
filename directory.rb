# Define method to ask user input for student's name
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # creat an empty array
  students = []
  # get the fitst name
  name = gets.chomp
  # while (loop) the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from user
    name = gets.chomp
  end
  # return the array of students
  students
end
# define methods for print header, names and total number
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  puts "Please enter the initial letter of names to print or just hit return to print all "
  specific_letter = gets.chomp
  index = 0
  while index < students.size
    if (specific_letter.empty? || students[index][:name][0] == specific_letter) && students[index][:name].size < 12
    puts "#{index + 1}: #{students[index][:name]} (#{students[index][:cohort]} cohort)"
    end
    index += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
# Ask user input by invoking the input_students methods, assign the output to a variable
students = input_students
# Print header, students and total number by invoking the pre-defined methods
print_header
print(students)
print_footer(students)
