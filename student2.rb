require 'pry'
require 'sqlite3'
 
# Open a database called my_amazing_database.db
# and store a reference to it in db
db = SQLite3::Database.new("my_amazing_database.db")
 
# Print all of the people in the database so far
results = db.execute("select * from people")
results.each do |row|
  puts row
end
 
# Ask the user for some information about people
print 'name: '
name = gets.strip.chomp
print 'age: '
age = gets.strip.chomp.to_i
print 'height: '
height = gets.strip.chomp.to_f
print 'star_sign: '
star_sign = gets.strip.chomp
print 'married? (t/f): '
married = gets.strip.chomp
 
# Build a SQL string with an instruction to insert a person
sql = "insert into people (name, age, height, star_sign, married) values (?, ?, ?, ?, ?)"
# Execute the SQL and provide the actual values
db.execute(sql, name, age, height, star_sign, married)
 
db.close

