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
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# Adding an interactive menu
def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      # input the students
      students = input_students
    when "2"
      #show the input_students
      print_header
      print(students)
      print_footer(students)
    when "9"
      # terminate the program
      exit
    else
      # handle the wrong input
      puts "I don't know what you meant,try agian"
    end
    # 4. repeat the loop
  end
end

#call interactive_menu method instead of asking for the list of users straight away
interactive_menu
