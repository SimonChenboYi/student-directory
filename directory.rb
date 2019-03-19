# Declare instance variable to be recognised across methods
@students = []

# Option 1. Ask user input for student's name
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp

  # loop when the name is not empty, repeat this code
  until name.empty?
    # add the student hash to the array
    @students << { name: name, cohort: :november }
    puts "Now we have #{@students.count} students"
    # get another name from user
    name = gets.chomp
  end
  # @students has been processed withint method, no need to return the value
end

# define methods for print header, names and total number
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

# Adding an interactive menu/Refactor
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  # option 2. Show the students
  print_header
  print
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    # terminate the program
    exit
  else
    # handle the wrong input
    puts "I don't know what you meant,try agian"
  end
end

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2&3. read the input and pass in as an argument,do what the user has asked
    process(gets.chomp)
    # 4. repeat by looping
  end
end
# call interactive menu method instead of asking for the list straight away
interactive_menu
