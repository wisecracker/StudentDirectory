require 'rubygems'
require 'yaml'
require 'pry'

class Person
  attr_accessor :name
  attr_accessor :email
  attr_accessor :github_user
  attr_accessor :twitter
  attr_accessor :fun_fact
  attr_accessor :teleport
  attr_accessor :food
  attr_accessor :movie

  def initialize
    self.get_person_info
  end


def self.create_person(type)
case type
when "Student"
  Student.new
when "Instructor"
  Instructor.new
else
  nil
  end
end  

 def get_person_info


    print "What is your name? "
    self.name = gets.strip.chomp

    print "What is your email? "
    self.email = gets.strip.chomp

    print "what is your github?"
    self.github_user = gets.strip.chomp

    print "what is your twitter?"
    self.twitter = gets.strip.chomp

    print "Anything interesting about yourself?"
    self.fun_fact = gets.strip.chomp

    print "Would you rather fly or teleport?"
    self.teleport = gets.strip.chomp

    print "Whats your favorite food?"
    self.food = gets.strip.chomp
    
    print "whats your favorite movie genre?"
    self.movie = gets.strip.chomp
  end
end
class Student < Person
  attr_accessor :reason_for_joining

  def get_person_info
   super
   print "what was your reason for joining WDI?"
   self.reason_for_joining = gets.strip.chomp
  end

end
class Instructor < Person
  attr_accessor :instructor_type

  def get_person_info
    super
    print "What type of instructor are you? "
    self.instructor_type = gets.strip.chomp
  end

end

# Let's make @directory an array, rather than a String
@directory = []
 
# Pull in existing people from a YAML file
@directory += YAML.load_documents(File.open('student_directory.yml'))
 
# Save people to a YAML file
File.open('student_directory.yml', 'a') { |f|
  @directory.compact.each do |person|
    f.write(person.to_yaml)
  end   
} 

@directory = ""
puts "Student Directory, v0.3.2 by Big PAPA"
print "Enter Student or Instructor, q to save and quit: "

while ((input = gets.strip.chomp) != 'q') do
  someone = Person.create_person(input)

  # Append this to our yaml file
  @directory += someone.to_yaml
  puts @directory
  
  print "Enter Student or Instructor, q to save and quit: "
end

# Open a student_directory.yml YAML file and write it out on one line
File.open('student_directory.yml', 'a') { |f| f.write(@directory) } 



