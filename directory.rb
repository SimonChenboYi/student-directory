@students = []
@menu = [ "1. Input the students",
          "2. Show the students",
          "3. Save the list to file",
          "4. Load the list from students.csv",
          "9. Exit"]

# getters and setters
def students
  @students
end

def students=(value)
  @students = value
end

def menu
  @menu
end

def menu=(value)
  @menu = value
end

def options
  @options
end

def options=(value)
  @options = value
end

# methods
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp

  until name.empty?
    students << { name: name, cohort: :november }
    puts "Now we have #{students.count} students"
    name = STDIN.gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_list
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{students.count} great students"
end

def print_menu
  menu.each { |option| puts option }
end

def show_students
  print_header
  print_list
  print_footer
end

def input_filename
  filename = STDIN.gets.chomp
  filename.empty? ?  "students.csv" : filename
end

def save_students
  puts 'input the filename or hit enter to save to "students.csv" as default'
  filename = input_filename

  file = File.open(filename, "w")
  students.each do |student|
    file.puts [student[:name], student[:cohort]].join(",")
  end
  file.close
  puts "Student list is saved in #{filename}"
end

def load_students(filename = "students.csv")
  if filename == "students.csv"
    puts "Input the filename to load list or hit enter to load from students.csv"
    filename = input_filename
  end

  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",") # parallel assignment
    students << { name: name, cohort: cohort.to_sym }
  end
  puts "Loaded #{students.count} from #{filename}"
  file.close
end

def try_load_students
  filename = ARGV.first || "students.csv" # "students.csv" by default
  if File.exist?(filename)
    load_students(filename)
  else
    puts "Sorry #{filename} doesn't exist"
    exit
  end
end

# stote method as objects in array
input_students = method :input_students
show_students = method :show_students
save_students = method :save_students
load_students = method :load_students
exit = method :exit

@options = { '1' => input_students, '2' => show_students,
             '3' => save_students, '4' => load_students,
             '9' => exit }

def process(selection)
  if options[selection].nil?
    puts "I don't know what you meant,try agian"
  else
    options[selection].call
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
