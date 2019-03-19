# Declare instance variable to be recognised across methods
@students = []

#  Define getter and setter
def students
  @students
end

def students=(value)
  @students = value
end

# Option 1. Ask user input for student's name
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp

  # loop when the name is not empty, repeat this code
  until name.empty?
    # add the student hash to the array
    students << { name: name, cohort: :november }
    puts "Now we have #{students.count} students"
    # get another name from user
    name = STDIN.gets.chomp
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
  puts "Overall, we have #{students.count} great students"
end

# Adding an interactive menu/Refactor
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  # option 2. Show the students
  print_header
  print
  print_footer
end

def save_students
  # option 3. Save the list to students.csv
  # "w" will rewrite the file from begining,
  # in some other cases "a" could be used to append
  file = File.open("students.csv", "w")
  # iterate over the array
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

# filename as an argument of method and set default value
# load_students will excute with default vaule as argument
def load_students(filename = "students.csv")
  # option 4. load the list from students.csv
  file = File.open(filename, "r")
  file.readlines.each do |line| # readlines
    name, cohort = line.chomp.split(",") # parallel assignment
    students << { name: name, cohort: cohort.to_sym }
  end
  file.close
end

# try load the file from commandline
def try_load_students
  filename = ARGV.first
  filename = "students.csv" if filename.nil? # load "students.csv" by default if no file is given on startup
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{students.count} from #{filename}"
  else
    puts "Sorry #{filename} doesn't exist"
    exit
  end
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
    process(STDIN.gets.chomp)
    # 4. repeat by looping
  end
end

# invoke the method to try_to_load from command  line
try_load_students
# call interactive menu method instead of asking for the list straight away
interactive_menu
