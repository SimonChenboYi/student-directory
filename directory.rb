# Define method to ask user input for student's name
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  # creat an empty array
  students = []
  # get the fitst name
  name = gets.chomp

  # while (loop) the name is not empty, repeat this code
  until name.empty? do
    puts "Please enter the cohort of the student"

    #convert to symbol
    cohort = gets.delete("\n").to_sym
    # set up default value
    cohort = :november if cohort.empty?

    puts "Please enter the hobby of the student"
    hobby = gets.delete("\n")
    hobby = '???' if hobby.empty?

    puts "Please enter the Country of birth of the student"
    country_of_birth = gets.delete("\n")
    country_of_birth = '???' if country_of_birth.empty?

    puts "Please enter the height of the student"
    height = gets.delete("\n")
    height = '???' if height.empty?

    students << { name: name, cohort: cohort, hobby: hobby,
                  country_of_birth: country_of_birth, height: height }
    puts "Now we have #{students.count} #{students.count > 1 ? 'students' : 'student'}"

    # get another name from user
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.delete("\n")
  end
  # return the array of students
  students
end

# Print the list with index to have a visual check
def check_list(students)
  students.each_with_index{|student,index| puts "#{index} : #{student}"}
end

# Update the list and correct the typo"
def update_list(students)
  # check the list first  when call the update_list
  check_list(students)
  puts "Please enter index need to update"
  puts "To finish update, just hit return twice"

  # update according to the index, key and updated value
  index = gets.delete("\n")

  until index.empty?
    puts "Please enter the category you want to update"
    key = gets.delete("\n").to_sym
    # check whether the input key is valid,otherwise ask user input agian
    while students[index.to_i][key].nil?
      puts "input does not match any exsiting category, please re-enter"
      key = gets.delete("\n").to_sym
    end
    # update value
    puts "Please enter the value you want to update"
    value = gets.delete("\n")
    # if the current value is a symbol then convert the updated value to symbol
    value = value.to_sym if students[index.to_i][key].is_a?(Symbol)
    students[index.to_i][key] = value

    # print the updated hash
    puts " updated :#{students[index.to_i]}"

    # loop the update until no update needed
    puts "Please enter index need to update"
    puts "To finish update, just hit return twice"

    index = gets.delete("\n")
  end
end

# define methods for print header, names and total number
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# Use map to get the cohort list and iterate over it to print grouped students
def print(students)
  cohorts = []
  students.map do |student|
    cohorts << student[:cohort] unless cohorts.include?(student[:cohort])
  end

  cohorts.map do |cohort|
    students.map { |student| puts student if student[:cohort] == cohort }
  end
end

# To print  sorted lsit, an alternative way is use sort_by method
#  and then print the sorted student lists:

# def print(students)
# puts students.sort_by{|student| student[:cohort]}
# end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# Invoking the input_students methods, assign the output to a variable
students = input_students

# Invoke update_list to see whether there is anything need to update
update_list(students)

# Print header, students and total number by invoking the pre-defined methods
if students.length > 0
  print_header
  print(students)
  print_footer(students)
end
